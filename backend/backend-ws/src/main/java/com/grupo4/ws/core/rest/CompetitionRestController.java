package com.grupo4.ws.core.rest;

import com.grupo4.api.core.service.ICompetitionService;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/competitions")
public class CompetitionRestController extends ORestController<ICompetitionService> {

    @Autowired
    private ICompetitionService competitionService;

    @Override
    public ICompetitionService getService() {
        return this.competitionService;
    }


}
