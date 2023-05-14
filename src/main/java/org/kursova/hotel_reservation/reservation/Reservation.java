package org.kursova.hotel_reservation.reservation;

import jakarta.persistence.*;
import lombok.*;
import org.kursova.hotel_reservation.client.Client;
import org.kursova.hotel_reservation.discount.Discount;
import org.kursova.hotel_reservation.room.Room;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Reservation {
    @Id
    @SequenceGenerator(name = "reservation_pk", sequenceName = "reservation_pk")
    @GeneratedValue(generator = "reservation_pk", strategy = GenerationType.SEQUENCE)
    private int id;
    @ManyToOne
    private Client client;
    private double price;
    private Date arrivalDate;
    private Date releaseDate;
    private boolean isPaid;
    @ManyToOne
    private Room room;
}
