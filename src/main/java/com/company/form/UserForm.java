package com.company.form;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class UserForm {
    @Size(min = 3, message = "must not be empty")
    private String name;
    @NotEmpty
    private String surname;
    private Integer nationalityIdbyRequest;


    public UserForm() {
    }

    public UserForm(String name, String surname, Integer nationalityIdbyRequest) {
        this.name = name;
        this.surname = surname;
        this.nationalityIdbyRequest = nationalityIdbyRequest;


    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Integer getNationalityIdbyRequest() {
        return nationalityIdbyRequest;
    }

    public void setNationalityIdbyRequest(Integer nationalityIdbyRequest) {
        this.nationalityIdbyRequest = nationalityIdbyRequest;
    }


}
