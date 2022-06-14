package com.spring.config;

import com.spring.model.User;
import com.spring.service.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"com.spring.service"})
public class RootConfig {
    @Bean
//    public UserService userService(){
            public User user(){
        User user = new User();
        user.setName("Mainul");
        user.setAge(33);
        user.setCountry("Bangladesh");
//        return new UserService(user);
        return user;
    }
}
