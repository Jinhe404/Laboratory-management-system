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
 * @since 2022-10-22
 */
@Getter
@Setter
  @ApiModel(value = "Equip对象", description = "")
public class Equip implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("设备名称")
      private String etype;

      @ApiModelProperty("设备描述")
      private String emodel;

      @ApiModelProperty("设备数量")
      private String eqnum;

      @ApiModelProperty("设备地点")
      private String eplace;


}
