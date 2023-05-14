package org.kursova.hotel_reservation.hotel;

import lombok.RequiredArgsConstructor;
import org.kursova.hotel_reservation.PageableDto;
import org.kursova.hotel_reservation.client.Client;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HotelService {
    private final HotelRepo hotelRepo;

    public Hotel getHotel(){
        return hotelRepo.findById(1)
                .orElseThrow(() -> new IllegalArgumentException("Cannot find hotel in db"));
    }

}
