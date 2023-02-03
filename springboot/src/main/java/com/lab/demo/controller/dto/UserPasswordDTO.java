package com.lab.demo.controller.dto;


import lombok.Data;

@Data
public class UserPasswordDTO {
    private String username;
    private String password;
    private String newPassword;
    private String email;
    private String code;
}
