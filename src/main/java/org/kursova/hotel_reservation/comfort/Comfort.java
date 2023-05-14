package org.kursova.hotel_reservation.comfort;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Comfort {
    @Id
    @SequenceGenerator(name = "comfort_pk", sequenceName = "comfort_pk")
    @GeneratedValue(generator = "comfort_pk", strategy = GenerationType.SEQUENCE)
    private int id;
    @Length(min = 2, max = 15)
    @NotBlank
    private String comfortName;
}
