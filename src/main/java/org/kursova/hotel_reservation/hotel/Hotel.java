package org.kursova.hotel_reservation.hotel;

import jakarta.persistence.*;
import lombok.*;
import org.kursova.hotel_reservation.reservation.Reservation;
import org.kursova.hotel_reservation.room.Room;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Hotel {
    @Id
    private int id;
    @OneToMany
    private List<Reservation> reservations = new ArrayList<>();
    @OneToMany
    private List<Room> rooms = new ArrayList<>();
}
