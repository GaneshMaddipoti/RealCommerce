package web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
public class WebInitializer extends SpringBootServletInitializer {
	

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		logger.error("test");
		return application.sources(WebInitializer.class);
	}

	public static void main(String[] args) throws Exception {
		
		SpringApplication.run(WebInitializer.class, args);
	}

}