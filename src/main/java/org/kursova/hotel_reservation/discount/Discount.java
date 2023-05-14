package org.kursova.hotel_reservation.discount;

import jakarta.persistence.Entity;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Discount {
    private double discountPercentage;
}
