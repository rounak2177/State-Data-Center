package com.example.demo.service;

import com.example.demo.User;
import java.util.Optional;
import java.util.List;

public interface UserService {
    Optional<User> getUserByEmail(String email);
    List<User> getAllUsers();
    void saveUser(User user);
}
