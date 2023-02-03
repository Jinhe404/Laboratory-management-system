package com.lab.demo.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lab.demo.controller.dto.UserPasswordDTO;
import com.lab.demo.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 金河
 * @since 2022-09-22
 */
public interface UserMapper extends BaseMapper<User> {

    List<User> list();

    @Update("update sys_user set password = #{newPassword} where username = #{username} and password = #{password}")
    int updatePassword(UserPasswordDTO userPasswordDTO);
    Page<User> findPage(Page<User> page, @Param("username") String username, @Param("email") String email, @Param("address") String address);
}
