package com.grupo4.ws.core.rest;

import com.grupo4.api.core.service.ICompetitionService;
import com.grupo4.api.core.service.IUserCompetitionService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users_competitions")
public class UserCompetitionRestController extends ORestController<IUserCompetitionService> {

    @Autowired
    private IUserCompetitionService userCompetitionService;

    @Override
    public IUserCompetitionService getService() {
        return this.userCompetitionService;
    }
}
