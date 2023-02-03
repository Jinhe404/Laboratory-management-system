package com.lab.demo.service;

import com.github.pagehelper.PageInfo;
import com.lab.demo.controller.request.BaseRequest;
import com.lab.demo.entity.Category;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 金河
 * @since 2022-10-20
 */
public interface ICategoryService {

    List<Category> list();

    PageInfo<Category> page(BaseRequest baseRequest);

    void save(Category obj);

    Category getById(Integer id);

    void update(Category obj);

    void deleteById(Integer id);

}

