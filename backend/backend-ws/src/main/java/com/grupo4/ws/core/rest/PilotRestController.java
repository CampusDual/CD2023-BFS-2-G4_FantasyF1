package com.grupo4.ws.core.rest;

import com.grupo4.api.core.service.IPilotService;
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
@RequestMapping("/pilots")
public class PilotRestController extends ORestController<IPilotService> {

    @Autowired
    private IPilotService pilotService;

    @Override
    public IPilotService getService() {
        return this.pilotService;
    }

    @RequestMapping(
            value = "/login",
            method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<EntityResult> login() {
        return new ResponseEntity<>(HttpStatus.OK);
    }


}
