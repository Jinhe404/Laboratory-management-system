package com.lab.demo.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.lab.demo.controller.dto.UserDTO;
import com.lab.demo.controller.dto.UserPasswordDTO;
import com.lab.demo.entity.User;

import javax.mail.MessagingException;
import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 金河
 * @since 2022-09-22
 */
public interface IUserService extends IService<User> {



    UserDTO login(UserDTO userDTO);

    User register(UserDTO userDTO);
    void updatePassword(UserPasswordDTO userPasswordDTO);
    Page<User> findPage(Page<User> objectPage, String username, String email, String address);

    UserDTO loginEmail(UserDTO userDTO);

    void sendEmailCode(String email,Integer type) throws MessagingException;
}
