package com.lab.demo.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lab.demo.common.Result;

import com.lab.demo.service.IEquipService;
import com.lab.demo.entity.Equip;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 金河
 * @since 2022-10-22
 */
@RestController
@RequestMapping("/equip")
        public class EquipController {
    
@Resource
private IEquipService equipService;

// 新增或者更新
@PostMapping
public Result save(@RequestBody Equip equip) {
    equipService.saveOrUpdate(equip);
        return Result.success();
        }

@DeleteMapping("/{id}")
public Result delete(@PathVariable Integer id) {
    equipService.removeById(id);
        return Result.success();
        }

@PostMapping("/del/batch")
public Result deleteBatch(@RequestBody List<Integer> ids) {
    equipService.removeByIds(ids);
        return Result.success();
        }

@GetMapping
public Result findAll() {
        return Result.success(equipService.list());
        }

@GetMapping("/{id}")
public Result findOne(@PathVariable Integer id) {
        return Result.success(equipService.getById(id));
        }

@GetMapping("/page")
public Result findPage(@RequestParam String etype,
        @RequestParam Integer pageNum,
@RequestParam Integer pageSize) {
        QueryWrapper<Equip> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        queryWrapper.like("etype",etype);
        return Result.success(equipService.page(new Page<>(pageNum, pageSize), queryWrapper));
        }

        }

