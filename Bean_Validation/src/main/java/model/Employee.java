package model;

import lombok.Data;

import javax.validation.constraints.Size;
@Data
public class Employee {

    private String name;
    @Size(min=1,message="required")
    private String pass;
}
