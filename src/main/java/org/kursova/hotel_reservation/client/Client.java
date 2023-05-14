package org.kursova.hotel_reservation.client;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.kursova.hotel_reservation.reservation.Reservation;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Client {
    @Id
    @SequenceGenerator(name = "client_pk", sequenceName = "client_pk")
    @GeneratedValue(generator = "client_pk", strategy = GenerationType.SEQUENCE)
    private int id;
    @Length(min = 2, max = 255)
    @NotBlank
    private String firstName;
    @Length(min = 2, max = 255)
    @NotBlank
    private String lastName;
    @Length(min = 5, max = 255)
    @NotBlank
    private String comment;
    @OneToMany(mappedBy = "client")
    private List<Reservation> reservations = new ArrayList<>();
}
