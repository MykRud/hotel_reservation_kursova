package org.kursova.hotel_reservation.dto;

import jakarta.persistence.ManyToOne;
import lombok.*;
import org.kursova.hotel_reservation.comfort.Comfort;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AddRoomRequest {
    private int capacity;
    private String comfort;
    private double price;
}
