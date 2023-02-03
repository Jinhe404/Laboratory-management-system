package com.lab.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
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
 * @since 2022-10-23
 */
@Getter
@Setter
  @ApiModel(value = "Goods对象", description = "")
public class Goods implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("设备名称")
      private String name;

      @ApiModelProperty("报修学生")
      private String user;

      @ApiModelProperty("设备图片")
      private String img;

      @ApiModelProperty("报修时间")
      private String time;

      @ApiModelProperty("待审核，审核不通过，审核通过")
      private String state;


}
