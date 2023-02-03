package com.lab.demo.service;

import com.lab.demo.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 金河
 * @since 2022-10-16
 */
public interface IMenuService extends IService<Menu> {

    List<Menu> findMenus(String name);
}
