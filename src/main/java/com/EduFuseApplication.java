package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.controller", "com.service", "com.repository", "com.model", "com.config"})
public class EduFuseApplication {
    public static void main(String[] args) {
        SpringApplication.run(EduFuseApplication.class, args);
    }
}