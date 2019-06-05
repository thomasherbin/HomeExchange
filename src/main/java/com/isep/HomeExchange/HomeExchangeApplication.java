package com.isep.HomeExchange;



import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@ComponentScan("com")
public class HomeExchangeApplication {

	public static void main(String[] args) {
		SpringApplication.run(HomeExchangeApplication.class, args);
	}

}

