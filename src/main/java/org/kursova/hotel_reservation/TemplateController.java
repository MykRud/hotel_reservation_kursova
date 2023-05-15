package org.kursova.hotel_reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping(path = {"/", "index.html", "home.jsp"})
public class TemplateController {
    @RequestMapping
    public RedirectView getHome(){
        return new RedirectView("/api/allClients");
    }
}
