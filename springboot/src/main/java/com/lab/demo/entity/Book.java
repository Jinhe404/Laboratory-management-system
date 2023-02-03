package com.lab.demo.entity;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author 金河
 * @since 2022-10-20
 */
@Data
public class Book extends BaseEntity implements Serializable {

  private static final long serialVersionUID = 1L;


  /**
   * 名称
   */
  private String name;

  /**
   * 描述
   */
  private String description;

  /**
   * 出版日期
   */
  private String publishDate;

  /**
   * 作者
   */
  private String author;

  /**
   * 出版社
   */
  private String publisher;

  /**
   * 分类
   */
  private String category;

  /**
   * 标准码
   */
  private String bookNo;

  /**
   * 封面
   */
  private String cover;

  private List<String> categories;
  private Integer score;
  private Integer nums;
  private LocalDate createtime;
  private LocalDate updatetime;


}
