package com.lab.demo.service.impl;

import com.lab.demo.entity.Goods;
import com.lab.demo.mapper.GoodsMapper;
import com.lab.demo.service.IGoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 金河
 * @since 2022-10-23
 */
@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements IGoodsService {

}
