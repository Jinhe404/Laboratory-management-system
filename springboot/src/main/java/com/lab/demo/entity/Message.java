package com.lab.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author 金河
 * @since 2022-10-01
 */
@Getter
@Setter
  @ApiModel(value = "Message对象", description = "")
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("内容")
      private String content;

      @ApiModelProperty("留言人id")
      private Integer userId;

      @ApiModelProperty("留言人用户名")
      private String username;

      @ApiModelProperty("留言时间")
      @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GTM+8")
      private LocalDateTime time;

      @ApiModelProperty("父级id")
      private Integer pid;


}
