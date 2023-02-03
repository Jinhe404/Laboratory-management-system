package com.lab.demo.mapper;

import com.lab.demo.controller.request.BaseRequest;
import com.lab.demo.entity.Borrow;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lab.demo.entity.Retur;
import com.lab.demo.mapper.po.BorrowReturCountPO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 金河
 * @since 2022-10-20
 */
@Mapper
public interface BorrowMapper {

    List<Borrow> list();

    List<Borrow> listByCondition(BaseRequest baseRequest);

    List<Retur> listReturByCondition(BaseRequest baseRequest);

    void save(Borrow obj);

    void saveRetur(Retur obj);

    Borrow getById(Integer id);

    void updateById(Borrow user);

    void deleteById(Integer id);

    void deleteReturById(Integer id);

    void updateStatus(String status, Integer id);

    List<BorrowReturCountPO> getCountByTimeRange(@Param("timeRange") String timeRange, @Param("type") int type);  // 1 borrow  2 return

}
