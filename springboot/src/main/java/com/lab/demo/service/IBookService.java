package com.lab.demo.service;

import com.github.pagehelper.PageInfo;
import com.lab.demo.controller.request.BaseRequest;
import com.lab.demo.entity.Book;
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
public interface IBookService {

    List<Book> list();

    PageInfo<Book> page(BaseRequest baseRequest);

    void save(Book obj);

    Book getById(Integer id);

    void update(Book obj);

    void deleteById(Integer id);

}
