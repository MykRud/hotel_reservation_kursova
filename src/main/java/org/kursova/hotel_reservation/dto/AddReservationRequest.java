package org.kursova.hotel_reservation.dto;

import jakarta.persistence.ManyToOne;
import lombok.*;
import org.kursova.hotel_reservation.client.Client;
import org.kursova.hotel_reservation.room.Room;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AddReservationRequest {
    private int clientId;
    private int roomId;
    private double price;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date arrivalDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date releaseDate;
}
