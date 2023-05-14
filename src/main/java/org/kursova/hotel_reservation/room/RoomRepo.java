package org.kursova.hotel_reservation.room;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomRepo extends JpaRepository<Room, Integer> {
    Page<Room> findByIsReservedFalse(Pageable pageable);
    long countByIsReservedFalse();
}
