package org.kursova.hotel_reservation.room;

import lombok.RequiredArgsConstructor;
import org.kursova.hotel_reservation.PageableDto;
import org.kursova.hotel_reservation.client.Client;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoomService {
    private final RoomRepo roomRepo;

    public Room getRoom(int roomId){
        return roomRepo.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("Cannot find room with id " + roomId));
    }

    public PageableDto<Room> getRoomsPage(int page, int size){
        Page<Room> pageOfRooms = roomRepo.findAll(PageRequest.of(page - 1, size));
        List<Room> listOfRooms = pageOfRooms.stream().toList();
        return new PageableDto<>(pageOfRooms.getTotalElements(), pageOfRooms.getTotalPages(), page, listOfRooms);
    }

    public PageableDto<Room> getAvailableRoomsPage(int page, int size){
        Page<Room> pageOfRooms = roomRepo.findByIsReservedFalse(PageRequest.of(page - 1, size));
        List<Room> listOfRooms = pageOfRooms.stream().toList();
        return new PageableDto<>(pageOfRooms.getTotalElements(), pageOfRooms.getTotalPages(), page, listOfRooms);
    }

    public long countRooms(){
        return roomRepo.count();
    }

    public long countAvailableRooms(){
        return roomRepo.countByIsReservedFalse();
    }

    public Room addRoom(Room room){
        return roomRepo.save(room);
    }

    public void deleteRoom(Room room){
        roomRepo.delete(room);
    }

    public boolean checkAvailability(int roomId){
        Room room = getRoom(roomId);
        return room.getIsReserved();
    }
}
