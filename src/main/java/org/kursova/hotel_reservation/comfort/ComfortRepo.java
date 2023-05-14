package org.kursova.hotel_reservation.comfort;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ComfortRepo extends JpaRepository<Comfort, Integer> {
    Optional<Comfort> findByComfortName(String comfortName);
}
