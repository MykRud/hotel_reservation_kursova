package org.kursova.hotel_reservation.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AddClientRequest {
    private String firstName;
    private String lastName;
}
