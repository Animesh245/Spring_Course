package com.this_project.dto;

import com.this_project.entity.User;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Collections;
import java.util.List;
@Data
public class UserDTO {
    private Long id;

    @NotBlank(message = "Required")
    private String name;


    @Pattern(regexp = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$" , message = "Password must contain one capital letter, one digit, one special character, Total 8 characters")
    private String password;


    @Email(regexp = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", message = "Enter valid email")
    private String email;


    @NotBlank(message = "Required")
    private String location;
}
