package com.lab.demo.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lab.demo.entity.Course;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 金河
 * @since 2022-10-19
 */
public interface ICourseService extends IService<Course> {

    Page<Course> findPage(Page<Course> page, String name);


    void setStudentCourse(Integer courseId, Integer studentId);
}
