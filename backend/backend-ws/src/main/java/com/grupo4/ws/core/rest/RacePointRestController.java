package com.grupo4.ws.core.rest;

import com.grupo4.api.core.service.IRacePointService;
import com.ontimize.jee.server.rest.ORestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/races_points")
public class RacePointRestController extends ORestController<IRacePointService> {

    @Autowired
    private IRacePointService iRacePointService;

    @Override
    public IRacePointService getService() {
        return this.iRacePointService;
    }


}
