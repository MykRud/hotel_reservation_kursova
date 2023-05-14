package org.kursova.hotel_reservation.reservation;

import lombok.RequiredArgsConstructor;
import org.kursova.hotel_reservation.PageableDto;
import org.kursova.hotel_reservation.client.Client;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReservationService {
    private final ReservationRepo reservationRepo;

    public Reservation getReservation(int reservationId){
        return reservationRepo.findById(reservationId)
                .orElseThrow(() -> new IllegalArgumentException("Cannot find reservation with id " + reservationId));
    }

    public PageableDto<Reservation> getReservationsPage(int page){
        Page<Reservation> pageOfReservations = reservationRepo.findAll(PageRequest.of(page - 1, 10));
        List<Reservation> listOfReservations = pageOfReservations.stream().toList();
        return new PageableDto<>(pageOfReservations.getTotalElements(), pageOfReservations.getTotalPages(), page, listOfReservations);
    }

    public List<Reservation> getAllReservations(){
        return reservationRepo.findAll();
    }

    public Reservation addReservation(Reservation reservation){
        return reservationRepo.save(reservation);
    }

    public void deleteReservation(Reservation reservation){
        reservationRepo.delete(reservation);
    }

    public long countReservations(){
        return reservationRepo.count();
    }
}
