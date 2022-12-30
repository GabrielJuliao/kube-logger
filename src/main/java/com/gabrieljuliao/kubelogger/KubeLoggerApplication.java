package com.gabrieljuliao.kubelogger;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.UUID;

@SpringBootApplication
public class KubeLoggerApplication {

	public static void main(String[] args) {
		SpringApplication.run(KubeLoggerApplication.class, args);
		Logger logger = LoggerFactory.getLogger(KubeLoggerApplication.class);
		logger.info("Kube logger localImagePull rand UUID: "+ UUID.randomUUID());
	}

}
