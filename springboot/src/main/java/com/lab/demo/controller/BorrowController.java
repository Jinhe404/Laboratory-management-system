package com.lab.demo.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lab.demo.common.RoleEnum;
import com.lab.demo.controller.request.BorrowPageRequest;
import com.lab.demo.entity.Retur;
import com.lab.demo.entity.User;
import com.lab.demo.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lab.demo.common.Result;

import com.lab.demo.service.IBorrowService;
import com.lab.demo.entity.Borrow;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 金河
 * @since 2022-10-20
 */
@CrossOrigin
@RestController
@RequestMapping("/borrow")
public class BorrowController {

    @Autowired
    IBorrowService borrowService;

    @PostMapping("/save")
    public Result save(@RequestBody Borrow obj) {
        borrowService.save(obj);
        return Result.success();
    }

    @PutMapping("/update")
    public Result update(@RequestBody Borrow obj) {
        borrowService.update(obj);
        return Result.success();
    }

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        borrowService.deleteById(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id) {
        Borrow obj = borrowService.getById(id);
        return Result.success(obj);
    }

    @GetMapping("/list")
    public Result list() {
        List<Borrow> list = borrowService.list();
        return Result.success(list);
    }

    @GetMapping("/page")
    public Result page(@RequestParam(defaultValue = "") String name,BorrowPageRequest pageRequest) {
        QueryWrapper<Borrow> queryWrapper = new QueryWrapper<>();
    queryWrapper.orderByDesc("id");
    if (!"".equals(name)) {
        queryWrapper.like("name", name);
    }
    User currentUser = TokenUtils.getCurrentUser();
    if (RoleEnum.ROLE_USER.toString().equals(currentUser.getRole())) {  // 角色是普通用户
        queryWrapper.eq("user", currentUser.getUsername()).or().eq("status","已归还");
    }
        return Result.success(borrowService.page(pageRequest));
    }
// 分页查询做一下筛选
//@GetMapping("/page")
//public Result page(@RequestParam(defaultValue = "") String name,
//                       @RequestParam Integer pageNum,
//                       @RequestParam Integer pageSize) {
//    QueryWrapper<Borrow> queryWrapper = new QueryWrapper<>();
//    queryWrapper.orderByDesc("id");
//    if (!"".equals(name)) {
//        queryWrapper.like("name", name);
//    }
//    User currentUser = TokenUtils.getCurrentUser();
//    if (RoleEnum.ROLE_USER.toString().equals(currentUser.getRole())) {  // 角色是普通用户
//        queryWrapper.eq("user", currentUser.getUsername());
//    }
//    return Result.success(borrowService.page(new Page<>(pageNum, pageSize), queryWrapper));
//}


    @GetMapping("/pageRetur")
    public Result pageRetur(BorrowPageRequest pageRequest) {
        return Result.success(borrowService.pageRetur(pageRequest));
    }

    @PostMapping("/saveRetur")
    public Result saveRetur(@RequestBody Retur obj) {
        borrowService.saveRetur(obj);
        return Result.success();
    }

    @DeleteMapping("/deleteRetur/{id}")
    public Result deleteRetur(@PathVariable Integer id) {
        borrowService.deleteReturById(id);
        return Result.success();
    }

    @GetMapping("/lineCharts/{timeRange}")
    public Result lineCharts(@PathVariable String timeRange) {
        return Result.success(borrowService.getCountByTimeRange(timeRange));
    }

}
