package com.lab.demo.service.impl;

import com.lab.demo.entity.Item;
import com.lab.demo.mapper.ItemMapper;
import com.lab.demo.service.IItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 金河
 * @since 2022-11-29
 */
@Service
public class ItemServiceImpl extends ServiceImpl<ItemMapper, Item> implements IItemService {

}
