package com.lab.demo.service;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.unit.DataUnit;
import com.github.pagehelper.PageInfo;
import com.lab.demo.controller.request.BaseRequest;
import com.lab.demo.entity.Borrow;
import com.baomidou.mybatisplus.extension.service.IService;
import com.lab.demo.entity.Retur;

import javax.xml.crypto.Data;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 金河
 * @since 2022-10-20
 */
public interface IBorrowService {

    List<Borrow> list();

    PageInfo<Borrow> page(BaseRequest baseRequest);


    PageInfo<Retur> pageRetur(BaseRequest baseRequest);

    void saveRetur(Retur obj);

    void deleteReturById(Integer id);

    void save(Borrow obj);

    Borrow getById(Integer id);

    void update(Borrow obj);

    void deleteById(Integer id);

    Map<String, Object> getCountByTimeRange(String timeRange);

}
