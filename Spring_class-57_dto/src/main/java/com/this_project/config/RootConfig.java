package com.this_project.config;

import com.this_project.controller.AuthSuccessHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
@ComponentScan(basePackages = {"com.this_project.dao", "com.this_project.dao_impl", "com.this_project.service"})
public class RootConfig {
//    @Bean
//    public CommonsMultipartResolver multipartResolver(){
//        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
//        multipartResolver.setMaxUploadSize(Properties.MAX_UPLOAD_SIZE);
//        return multipartResolver;
//    }

    //    adding password encoder. NoOp - existing passwords were not same as BCrypt.
    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
//        return NoOpPasswordEncoder.getInstance();
    }

    @Bean
    public AuthSuccessHandler authSuccessHandler()
    {
        return new AuthSuccessHandler();
    }
}
