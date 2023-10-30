package com.grupo4.ws.core.rest;

import com.grupo4.api.core.service.ICompetitionService;
import com.grupo4.api.core.service.IResultService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/results")
public class ResultRestController extends ORestController<IResultService> {

    @Autowired
    private IResultService resultService;

    @Override
    public IResultService getService() {
        return this.resultService;
    }


}
