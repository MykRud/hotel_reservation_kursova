package org.kursova.hotel_reservation.client;

import lombok.RequiredArgsConstructor;
import org.kursova.hotel_reservation.PageableDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ClientService {
    private final ClientRepo clientRepo;

    public Client getClient(int clientId){
        return clientRepo.findById(clientId)
                .orElseThrow(() -> new IllegalArgumentException("Cannot find client with id " + clientId));
    }

    public PageableDto<Client> getClientsPage(int page, int size){
        Page<Client> pageOfClients = clientRepo.findAll(PageRequest.of(page - 1, size));
        List<Client> listOfClients = pageOfClients.stream().toList();
        return new PageableDto<>(pageOfClients.getTotalElements(), pageOfClients.getTotalPages(), page, listOfClients);
    }

    public List<Client> getAllClients(){
        return clientRepo.findAll();
    }

    public Client addClient(Client client){
        return clientRepo.save(client);
    }

    public void deleteClient(Client client){
        clientRepo.delete(client);
    }

    public long countClients(){
        return clientRepo.count();
    }
}
