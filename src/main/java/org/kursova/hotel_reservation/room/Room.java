package org.kursova.hotel_reservation.room;

import jakarta.persistence.*;
import lombok.*;
import org.kursova.hotel_reservation.comfort.Comfort;
import org.kursova.hotel_reservation.reservation.Reservation;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Room {
    @Id
    @SequenceGenerator(name = "room_pk", sequenceName = "room_pk")
    @GeneratedValue(generator = "room_pk", strategy = GenerationType.SEQUENCE)
    private int id;
    private int capacity;
    @ManyToOne
    private Comfort comfort;
    private double price;
    private boolean isReserved;

    public boolean getIsReserved(){
        return isReserved;
    }

    public void setIsReserved(boolean isReserved){
        this.isReserved = isReserved;
    }
}
