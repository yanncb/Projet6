package com.ocr.amis.escalade;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class AmisEscaladeApplication  extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(AmisEscaladeApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(AmisEscaladeApplication.class);
	}
}
