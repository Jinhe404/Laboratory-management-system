package com.lab.demo.controller;


import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lab.demo.common.RoleEnum;
import com.lab.demo.entity.User;
import com.lab.demo.utils.TokenUtils;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lab.demo.common.Result;

import com.lab.demo.service.IGoodsService;
import com.lab.demo.entity.Goods;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 金河
 * @since 2022-10-23
 */
@RestController
@RequestMapping("/goods")
        public class GoodsController {
    
@Resource
private IGoodsService goodsService;

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Goods goods) {
        if (goods.getId() == null) {
            // 新增
            goods.setTime(DateUtil.today());
            goods.setUser(TokenUtils.getCurrentUser().getUsername());
        }
        goodsService.saveOrUpdate(goods);
        return Result.success();
    }


@DeleteMapping("/{id}")
public Result delete(@PathVariable Integer id) {
    goodsService.removeById(id);
        return Result.success();
        }

@PostMapping("/del/batch")
public Result deleteBatch(@RequestBody List<Integer> ids) {
    goodsService.removeByIds(ids);
        return Result.success();
        }

@GetMapping
public Result findAll() {
        return Result.success(goodsService.list());
        }

@GetMapping("/{id}")
public Result findOne(@PathVariable Integer id) {
        return Result.success(goodsService.getById(id));
        }

    // 分页查询做一下筛选
    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String username,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Goods> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(username)) {
            queryWrapper.like("username", username);
        }
        User currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.ROLE_USER.toString().equals(currentUser.getRole())) {  // 角色是普通用户
            queryWrapper.eq("user", currentUser.getUsername());
        }
        return Result.success(goodsService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }


}

