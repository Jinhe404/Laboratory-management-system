package com.lab.demo.controller.dto;

import com.lab.demo.entity.Menu;
import lombok.Data;

import java.util.List;

/*
* 接受前端登陆的请求参数
* */
@Data
public class UserDTO {
    private Integer id;
    private String username;
    private String password;
    private String email;
    private String code;
    private String nickname;
    private String avatarUrl;
    private String token;
    private String role;
    private List<Menu> menus;
}
