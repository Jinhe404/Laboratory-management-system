package com.lab.demo.service.impl;

import com.lab.demo.entity.Notice;
import com.lab.demo.mapper.NoticeMapper;
import com.lab.demo.service.INoticeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 金河
 * @since 2022-10-18
 */
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice> implements INoticeService {

}
