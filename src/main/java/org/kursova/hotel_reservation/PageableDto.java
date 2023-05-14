package org.kursova.hotel_reservation;

import lombok.*;

import java.util.Iterator;
import java.util.List;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PageableDto<E> {
    private long totalElements;
    private int allPages;
    private int page;
    private List<E> elements;
}
