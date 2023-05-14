package org.kursova.hotel_reservation.comfort;

import lombok.RequiredArgsConstructor;
import org.kursova.hotel_reservation.PageableDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ComfortService {
    private final ComfortRepo comfortRepo;

    // TODO delete method if not used
    public Comfort getComfort(int comfortId){
        return comfortRepo.findById(comfortId)
                .orElseThrow(() -> new IllegalArgumentException("Cannot find comfort with id " + comfortId));
    }

    public Comfort getComfortByComfortName(String comfortName){
        return comfortRepo.findByComfortName(comfortName)
                .orElseThrow(() -> new IllegalArgumentException("Cannot find comfort with name " + comfortName));
    }

    public List<Comfort> getAllComforts(){
        return comfortRepo.findAll();
    }

    public Comfort addComfort(Comfort comfort){
        return comfortRepo.save(comfort);
    }

    public void deleteComfort(Comfort comfort){
        comfortRepo.delete(comfort);
    }
}
