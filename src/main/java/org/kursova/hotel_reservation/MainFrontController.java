package org.kursova.hotel_reservation;

import lombok.RequiredArgsConstructor;
import org.kursova.hotel_reservation.client.Client;
import org.kursova.hotel_reservation.client.ClientService;
import org.kursova.hotel_reservation.comfort.ComfortService;
import org.kursova.hotel_reservation.discount.DiscountService;
import org.kursova.hotel_reservation.dto.AddClientRequest;
import org.kursova.hotel_reservation.dto.AddReservationRequest;
import org.kursova.hotel_reservation.dto.AddRoomRequest;
import org.kursova.hotel_reservation.reservation.Reservation;
import org.kursova.hotel_reservation.reservation.ReservationService;
import org.kursova.hotel_reservation.room.Room;
import org.kursova.hotel_reservation.room.RoomService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/api")
@RequiredArgsConstructor
public class MainFrontController {

    private final RoomService roomService;
    private final ComfortService comfortService;
    private final ReservationService reservationService;
    private final ClientService clientService;
    private final DiscountService discountService;

    // Room section
    @GetMapping("allRooms")
    public ModelAndView getAllRooms(@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "m", required = false) String m){
        ModelAndView mv = new ModelAndView("/allRooms.jsp");
        PageableDto<Room> rooms = roomService.getRoomsPage(page, 8);
        mv.addObject("rooms", rooms);
        mv.addObject("submit_room", new AddRoomRequest());
        mv.addObject("submit_reservation", new AddReservationRequest());
        mv.addObject("available_rooms", roomService.countAvailableRooms());
        mv.addObject("clients", clientService.getAllClients());

        if(m != null)
            mv.addObject("message", m);

        return mv;
    }

    @PostMapping("addRoom")
    public ModelAndView addRoomLogic(@ModelAttribute @Valid AddRoomRequest addRoomRequest){
        Room room = Room.builder()
                .price(addRoomRequest.getPrice())
                .capacity(addRoomRequest.getCapacity())
                .comfort(comfortService.getComfortByComfortName(addRoomRequest.getComfort()))
                .isReserved(false)
                .build();
        roomService.addRoom(room);
        return new ModelAndView("redirect:/api/allRooms?m=Room successfully added");
    }

    @DeleteMapping("deleteRoom")
    public ModelAndView deleteRoom(@RequestParam("id") Integer roomId){
        Room foundRoom = roomService.getRoom(roomId);
        if(foundRoom == null)
            return new ModelAndView("redirect:/api/allRooms?m=Room is not found");

        roomService.deleteRoom(foundRoom);
        return new ModelAndView("redirect:/api/allRooms?m=Room successfully deleted");
    }

    // Reservation section
    @GetMapping("allReservations")
    public ModelAndView getAllReservations(@RequestParam(name = "m", required = false) String m){
        ModelAndView mv = new ModelAndView("/allReservations.jsp");

        List<Reservation> reservations = reservationService.getAllReservations();
        mv.addObject("reservations", reservations);

        if(m != null)
            mv.addObject("message", m);

        return mv;
    }

    @PostMapping("addReservation")
    public ModelAndView addReservationLogic(@RequestParam("roomId") Integer roomId, @RequestParam("clientId") Integer clientId,
                                            @RequestParam("price") Double price, @RequestParam("arrivalDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date arrivalDate, @RequestParam("releaseDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date releaseDate){
        Client client = clientService.getClient(clientId);
        double discount = discountService.calculateDiscount(clientId);
        Reservation reservation = Reservation.builder()
                .price(price * (discount / 100))
                .arrivalDate(arrivalDate)
                .releaseDate(releaseDate)
                .client(client)
                .room(roomService.getRoom(roomId))
                .build();

        Reservation savedReservation = reservationService.addReservation(reservation);
        if(savedReservation != null) {
            client.getReservations().add(reservation);
            clientService.addClient(client);
            return new ModelAndView("redirect:/api/allReservations?id=" + savedReservation.getId());
        } else {
            return new ModelAndView("redirect:/api/allReservations?m=Cannot add reservation");
        }
    }

    @DeleteMapping("deleteReservation")
    public ModelAndView deleteReservation(@RequestParam("id") Integer id){
        Reservation foundReservation = reservationService.getReservation(id);
        if(foundReservation == null)
            return new ModelAndView("redirect:/api/allReservations?m=Cannot find reservation");

        Room room = foundReservation.getRoom();
        room.setIsReserved(false);
        roomService.addRoom(room);

        reservationService.deleteReservation(foundReservation);

        return new ModelAndView("redirect:/api/allReservations?m=Reservation successfully deleted");
    }

    // Client section
    @GetMapping("allClients")
    public ModelAndView getAllClients(@RequestParam(name = "page", defaultValue = "1") Integer page, @RequestParam(name = "m", required = false) String m){
        ModelAndView mv = new ModelAndView("/allClients.jsp");
        PageableDto<Client> clients = clientService.getClientsPage(page, 8);
        mv.addObject("clients", clients);
        mv.addObject("submit_client", new AddClientRequest());


        if(m != null)
            mv.addObject("message", m);

        return mv;
    }

    @PostMapping("addClient")
    public ModelAndView addClientLogic(@ModelAttribute @Valid AddClientRequest addClientRequest){
        Client client = Client.builder()
                .firstName(addClientRequest.getFirstName())
                .lastName(addClientRequest.getLastName())
                .build();

        Client savedClient = clientService.addClient(client);
        if(savedClient != null)
            return new ModelAndView("redirect:/api/allClients?id="+savedClient.getId());
        else
            return new ModelAndView("redirect:/api/allClients?m=Cannot add client");
    }

    // Hotel section
    @GetMapping("hotel")
    public ModelAndView getHotelInfo(){
        long numberOfClients = clientService.countClients();
        long numberOfReservations = reservationService.countReservations();
        long numberOfRooms = roomService.countRooms();

        ModelAndView mv = new ModelAndView("/hotel.jsp");
        mv.addObject("numberOfClients", numberOfClients);
        mv.addObject("numberOfReservations", numberOfReservations);
        mv.addObject("numberOfRooms", numberOfRooms);
        return mv;
    }
}
