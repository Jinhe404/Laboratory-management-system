package com.lab.demo.service.impl;

import com.lab.demo.entity.Article;
import com.lab.demo.mapper.ArticleMapper;
import com.lab.demo.service.IArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 金河
 * @since 2022-10-21
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {

}
