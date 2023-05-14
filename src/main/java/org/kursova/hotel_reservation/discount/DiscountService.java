package org.kursova.hotel_reservation.discount;

import lombok.RequiredArgsConstructor;
import org.kursova.hotel_reservation.client.Client;
import org.kursova.hotel_reservation.client.ClientService;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DiscountService {

    private final ClientService clientService;

    public double calculateDiscount(int clientId) {
        Client client = clientService.getClient(clientId);
        int numberOfReservations = client.getReservations().size() + 1;
        return numberOfReservations % 5;
    }
}
