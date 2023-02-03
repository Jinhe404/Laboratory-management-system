package com.lab.demo.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lab.demo.utils.TokenUtils;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lab.demo.common.Result;

import com.lab.demo.service.IArticleService;
import com.lab.demo.entity.Article;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 金河
 * @since 2022-10-21
 */
@RestController
@RequestMapping("/article")
        public class ArticleController {
    
@Resource
private IArticleService articleService;

// 新增或者更新
@PostMapping
public Result save(@RequestBody Article article) {
    if (article.getId() == null) {
        article.setTime(DateUtil.now());
        article.setUser(TokenUtils.getCurrentUser().getNickname());
    }
    articleService.saveOrUpdate(article);
        return Result.success();
        }

@DeleteMapping("/{id}")
public Result delete(@PathVariable Integer id) {
    articleService.removeById(id);
        return Result.success();
        }

@PostMapping("/del/batch")
public Result deleteBatch(@RequestBody List<Integer> ids) {
    articleService.removeByIds(ids);
        return Result.success();
        }

@GetMapping
public Result findAll() {
        return Result.success(articleService.list());
        }

@GetMapping("/{id}")
public Result findOne(@PathVariable Integer id) {
        return Result.success(articleService.getById(id));
        }

@GetMapping("/page")
public Result findPage(@RequestParam String name,
        @RequestParam Integer pageNum,
@RequestParam Integer pageSize) {
        QueryWrapper<Article> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");

        if (StrUtil.isNotBlank(name)) {
            queryWrapper.like("name",name);
        }
        return Result.success(articleService.page(new Page<>(pageNum, pageSize), queryWrapper));
        }

        }

