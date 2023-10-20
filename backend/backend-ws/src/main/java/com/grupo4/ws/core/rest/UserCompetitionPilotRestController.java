package com.grupo4.ws.core.rest;

import com.grupo4.api.core.service.IUserCompetitionPilotService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users_competitions_pilots")
public class UserCompetitionPilotRestController extends ORestController<IUserCompetitionPilotService> {

    @Autowired
    private IUserCompetitionPilotService userCompetitionPilotService;

    @Override
    public IUserCompetitionPilotService getService() {
        return this.userCompetitionPilotService;
    }
}
