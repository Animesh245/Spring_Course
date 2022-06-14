package com.spring.service;

import com.spring.model.User;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final User user;

    public UserService(User user) {
        this.user = user;
    }

    public User getUserDetails(){
        return this.user;
    }
}
