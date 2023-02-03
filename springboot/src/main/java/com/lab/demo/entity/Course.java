package com.lab.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
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
 * @since 2022-10-19
 */
@Getter
@Setter
  @ApiModel(value = "Course对象", description = "")
public class Course implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("设备名称")
      private String name;

      @ApiModelProperty("设备型号")
      private String equip;

      @ApiModelProperty("借还时间")
      private String times;

      @ApiModelProperty("是否可用")
      private Boolean state;

      @ApiModelProperty("老师ID")
      private Integer teacherId;

      @ApiModelProperty("设备数量")
      private Integer equipNum;

      @TableField(exist = false)
      private String teacher;

}
