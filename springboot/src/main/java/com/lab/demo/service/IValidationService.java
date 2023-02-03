package com.lab.demo.service;

import cn.hutool.core.date.DateTime;
import com.lab.demo.entity.Validation;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 金河
 * @since 2022-10-23
 */
public interface IValidationService extends IService<Validation> {

    void saveCode(String email, String code, Integer type, DateTime expireDate);
}
