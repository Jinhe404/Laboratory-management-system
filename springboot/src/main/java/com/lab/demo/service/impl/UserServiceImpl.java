package com.lab.demo.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.log.Log;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lab.demo.common.Constants;
import com.lab.demo.common.RoleEnum;
import com.lab.demo.common.ValidationEnum;
import com.lab.demo.config.AuthAccess;
import com.lab.demo.controller.dto.UserDTO;
import com.lab.demo.controller.dto.UserPasswordDTO;
import com.lab.demo.entity.Menu;
import com.lab.demo.entity.User;
import com.lab.demo.entity.Validation;
import com.lab.demo.exception.ServiceException;
import com.lab.demo.mapper.RoleMapper;
import com.lab.demo.mapper.RoleMenuMapper;
import com.lab.demo.mapper.UserMapper;
import com.lab.demo.service.IMenuService;
import com.lab.demo.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lab.demo.service.IValidationService;
import com.lab.demo.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 金河
 * @since 2022-09-22
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    JavaMailSender javaMailSender;
    @Value("${spring.mail.username}")
    private String from;

    private static final Log LOG = Log.get();

    @Resource
    private UserMapper userMapper;


    @Resource
    private RoleMapper roleMapper;

    @Resource
    private RoleMenuMapper roleMenuMapper;

    @Resource
    private IMenuService menuService;

    @Resource
    private IValidationService validationService;




    @Override
    public UserDTO login(UserDTO userDTO) {
//        userDTO.setPassword(SecureUtil.md5(userDTO.getPassword()));
        User one = getUserInfo(userDTO);
        if (one != null) {
            BeanUtil.copyProperties(one,userDTO,true);
            String token = TokenUtils.genToken(one.getId().toString(), one.getPassword());
            userDTO.setToken(token);

            String role = one.getRole();
            List<Menu> roleMenus = getRoleMenus(role);
            userDTO.setMenus(roleMenus);
            return userDTO;
        } else {
            throw new ServiceException(Constants.CODE_600,"用户名或者密码错误");
        }


//        List<User> list = list(queryWrapper);
//        return list.size() != 0;
    }

    @Override
    public User register(UserDTO userDTO) {
//        userDTO.setPassword(SecureUtil.md5(userDTO.getPassword()));
//        User one = getOne(Wrappers.<User>lambdaQuery().eq(User::getUsername, userDTO.getUsername()));
        User one = getUserInfo(userDTO);
        if (one == null) {
            one = new User();
            BeanUtil.copyProperties(userDTO,one,true);
            // 默认一个普通用户的角色
            one.setRole(RoleEnum.ROLE_STUDENT.toString());
            if (one.getNickname() == null) {
                one.setNickname(one.getUsername());
            }
            save(one);
        } else {
            throw new ServiceException(Constants.CODE_600,"用户名已存在");
        }

        return one;
    }

    @Override
    public void updatePassword(UserPasswordDTO userPasswordDTO) {
        int update = userMapper.updatePassword(userPasswordDTO);
        if (update < 1) {
            throw new ServiceException(Constants.CODE_600, "密码错误");
        }
    }

    @Override
    public Page<User> findPage(Page<User> page, String username, String email, String address) {
        return userMapper.findPage(page, username, email, address);
    }

    @Override
    public UserDTO loginEmail(UserDTO userDTO) {
        String email = userDTO.getEmail();
        String code = userDTO.getCode();
        // 先查询 邮箱验证结果，看看之前有没有发送过 邮箱code  如果不存在就重新获取
        QueryWrapper<Validation> validationQueryWrapper = new QueryWrapper<>();
        validationQueryWrapper.eq("email",email);
        validationQueryWrapper.eq("code",code);
        validationQueryWrapper.ge("time",new Date());// 查询未过期的code
        Validation one = validationService.getOne(validationQueryWrapper);
        if (one == null) {
            throw new ServiceException("-1","验证码过期，请重新获取");
        }
        // 如果验证通过了，就查询用户的信息
        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
        userQueryWrapper.eq("email", email);
        User user = getOne(userQueryWrapper);

        if (user == null) {
            throw new ServiceException("-1","未找到用户");
        }

        BeanUtil.copyProperties(user,userDTO,true);

        String token = TokenUtils.genToken(user.getId().toString(), user.getPassword());
        userDTO.setToken(token);

        String role = user.getRole();
        List<Menu> roleMenus = getRoleMenus(role);
        userDTO.setMenus(roleMenus);
        return userDTO;

    }
    @AuthAccess
    @Override
    public void sendEmailCode(String email,Integer type) throws MessagingException {
        Date now = new Date();
        // 先查询同类型code
        QueryWrapper<Validation> validationQueryWrapper = new QueryWrapper<>();
        validationQueryWrapper.eq("email",email);
        validationQueryWrapper.eq("type",type);
        validationQueryWrapper.ge("time",now);// 查询未过期的code
        Validation validation = validationService.getOne(validationQueryWrapper);
        if (validation != null) {
            throw new ServiceException("-1","当前您的验证码任然有效，请不要重复发送");
        }

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(email);
        message.setSentDate(now);
        String code = RandomUtil.randomNumbers(4);  // 随机一个四位长度的验证码

        if (ValidationEnum.LOGIN.getCode().equals(type)){
            message.setSubject("【兰州交通大学测绘与地理信息学院实验室管理系统】登录邮箱验证");
            message.setText("您本次登录的验证码:" + code + "，有效期5分钟，请妥善报关，切勿泄露");
        } else if (ValidationEnum.FORGET_PASS.getCode().equals(type)) {
            message.setSubject("【兰州交通大学测绘与地理信息学院实验室管理系统】忘记密码验证");
            message.setText("您本次忘记密码的验证码:" + code + "，有效期5分钟，请妥善报关，切勿泄露");
        }



        javaMailSender.send(message);

        // 发送成功之后，将验证码存在数据库
        validationService.saveCode(email,code, type, DateUtil.offsetMinute(now,5));

    }

    private User getUserInfo(UserDTO userDTO){
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username",userDTO.getUsername());
        queryWrapper.eq("password",userDTO.getPassword());
        User one;
        try {
            one = getOne(queryWrapper);  // 从数据库查询用户信息

        } catch (Exception e) {
            LOG.error(e);
            throw new ServiceException(Constants.CODE_500,"系统错误");
        }
        return one;
    }


    /**
     * 获取当前角色的菜单列表
     * @param roleFlag
     * @return
     */
    private List<Menu> getRoleMenus(String roleFlag) {
        Integer roleId = roleMapper.selectByFlag(roleFlag);
        // 当前角色的所有菜单id集合
        List<Integer> menuIds = roleMenuMapper.selectByRoleId(roleId);

        // 查出系统所有的菜单(树形)
        List<Menu> menus = menuService.findMenus("");
        // new一个最后筛选完成之后的list
        List<Menu> roleMenus = new ArrayList<>();
        // 筛选当前用户角色的菜单
        for (Menu menu : menus) {
            if (menuIds.contains(menu.getId())) {
                roleMenus.add(menu);
            }
            List<Menu> children = menu.getChildren();
            // removeIf()  移除 children 里面不在 menuIds集合中的 元素
            children.removeIf(child -> !menuIds.contains(child.getId()));
        }
        return roleMenus;
    }







}
