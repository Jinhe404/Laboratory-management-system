package com.lab.demo.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDate;

/**
 * <p>
 * 
 * </p>
 *
 * @author 金河
 * @since 2022-10-20
 */
@Data
public class Borrow {

  /**
   * id
   */
  private Integer id;

  /**
   * 名称
   */
  private String bookName;

  /**
   * 标准码
   */
  private String bookNo;

  /**
   * id
   */
  private String userNo;

  /**
   * 名称
   */
  private String userName;

  /**
   * 用户联系方式
   */
  private String userPhone;

  /**
   * 创建时间
   */
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
  private LocalDate createtime;

  /**
   * 更新时间
   */
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
  private LocalDate updatetime;

  /**
   *
   */
  private Integer score;
  private String status;
  private Integer days;
  @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
  private LocalDate returnDate;
  //提醒状态 即将到期（-1） 到期（当天） 过期（超过归还日期）
  private String note;

}
