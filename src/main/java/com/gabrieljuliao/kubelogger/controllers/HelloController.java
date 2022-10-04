package com.gabrieljuliao.kubelogger.controllers;

import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
public class HelloController {
    @GetMapping
    public ResponseEntity<String> get() {
        LoggerFactory.getLogger(HelloController.class).info("Kube logger rand UUID: " + UUID.randomUUID());
        return new ResponseEntity<>("Hello World!", HttpStatus.OK);
    }
}
