package com.example.webapplication.controllers;

import com.example.webapplication.model.Users;
import com.example.webapplication.repository.UserRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class HealthCheckController {
    UserRepository userRepository;

    public HealthCheckController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/health")
    public Object health() {
            return "ok";
    }

    @GetMapping("/users/{id}")
    public String getUser(@PathVariable Long id) {
        return userRepository.getUserById(id)
                .map(user -> "User name: " + user.getName())
                .orElse("User not found");
    }
}
