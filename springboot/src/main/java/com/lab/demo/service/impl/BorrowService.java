package com.lab.demo.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lab.demo.controller.request.BaseRequest;
import com.lab.demo.entity.Book;
import com.lab.demo.entity.Borrow;
import com.lab.demo.entity.Retur;
import com.lab.demo.exception.ServiceException;
import com.lab.demo.mapper.BookMapper;
import com.lab.demo.mapper.BorrowMapper;
import com.lab.demo.mapper.UserMapper;
import com.lab.demo.mapper.po.BorrowReturCountPO;
import com.lab.demo.service.IBorrowService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 金河
 * @since 2022-10-20
 */
@Service
@Slf4j
public class BorrowService implements IBorrowService {

    @Resource
    BorrowMapper borrowMapper;

    @Autowired
    UserMapper userMapper;

    @Autowired
    BookMapper bookMapper;

    @Override
    public List<Borrow> list() {
        return borrowMapper.list();
    }

    @Override
    public PageInfo<Borrow> page(BaseRequest baseRequest) {
        PageHelper.startPage(baseRequest.getPageNum(), baseRequest.getPageSize());
        List<Borrow> borrows = borrowMapper.listByCondition(baseRequest);
        for (Borrow borrow :borrows) {
            LocalDate returnDate = borrow.getReturnDate();
            LocalDate now = LocalDate.now();
            if (now.plusDays(1).isEqual(returnDate)) {  // 当前日期比归还的日期小一天
                borrow.setNote("即将到期");
            } else if (now.isEqual(returnDate)) {
                borrow.setNote("已到期");
            } else if (now.isAfter(returnDate)) {
                borrow.setNote("已过期");
            } else {
                borrow.setNote("正常");
            }
        }
        return new PageInfo<>(borrows);
    }

    @Override
    @Transactional
    public void save(Borrow obj) {
//        // 1. 校验用户的积分是否足够
//        String userNo = obj.getUserNo();
//        User user = userMapper.getByUsername(userNo);
//        if (Objects.isNull(user)) {
//            throw new ServiceException("用户不存在");
//        }
        // 2. 校验设备的数量是否足够
        Book book = bookMapper.getByNo(obj.getBookNo());
        if (Objects.isNull(book)) {
            throw new ServiceException("所借设备不存在");
        }
        //        // 4. 校验设备数量
        if (book.getNums() < 1) {
            throw new ServiceException("设备数量不足");
        }
//        Integer account = user.getAccount();
        Integer score = book.getScore();
//        // 3. 校验用户账户余额
//        if (score > account) {
//            throw new ServiceException("用户积分不足");
//        }

//        // 5. 更新用户余额
//        user.setAccount(user.getAccount() - score);
//        userMapper.updateById(user);
//        // 6. 更新设备的数量
        book.setNums(book.getNums() - 1);
        bookMapper.updateById(book);
//
        obj.setReturnDate(LocalDate.now().plus(obj.getDays(), ChronoUnit.DAYS)); //当前的日期 +days 得到归还的日期
//        // 7. 新增借设备记录
        borrowMapper.save(obj);
    }


    @Override
    public PageInfo<Retur> pageRetur(BaseRequest baseRequest) {
        PageHelper.startPage(baseRequest.getPageNum(), baseRequest.getPageSize());
        return new PageInfo<>(borrowMapper.listReturByCondition(baseRequest));
    }

    // 还设备逻辑
    @Transactional
    @Override
    public void saveRetur(Retur obj) {

        // 改状态
        obj.setStatus("已归还");
        borrowMapper.updateStatus("已归还", obj.getId());  // obj.getId() 是前端传来的借设备id
//        obj.setId(null);  // 新数据
        obj.setRealDate(LocalDate.now());
        borrowMapper.saveRetur(obj);

        // 设备数量增加
        bookMapper.updateNumByNo(obj.getBookNo());

        // 返还和扣除用户积分
//        Book book = bookMapper.getByNo(obj.getBookNo());
//        if (book != null) {
//            long until = 0;
//            if (obj.getRealDate().isBefore(obj.getReturnDate())) {
//                until = obj.getRealDate().until(obj.getReturnDate(), ChronoUnit.DAYS);
//            } else if (obj.getRealDate().isAfter(obj.getReturnDate())) {  // 逾期归还，要扣额外的积分
//                until = -obj.getReturnDate().until(obj.getRealDate(), ChronoUnit.DAYS);
//            }
//            int score = (int) until * book.getScore();  // 获取待归还的积分
//            User user = userMapper.getByUsername(obj.getUserNo());
//            int account = user.getAccount() + score;
//            user.setAccount(account);
//            if (account < 0) {
//                // 锁定账号
//                user.setStatus(false);
//            }
//            userMapper.updateById(user);
//        }
    }





    @Override
    public Borrow getById(Integer id) {
        return borrowMapper.getById(id);
    }

    @Override
    public void update(Borrow obj) {
        obj.setUpdatetime(LocalDate.now());
        borrowMapper.updateById(obj);
    }

    @Override
    public void deleteById(Integer id) {
        borrowMapper.deleteById(id);
    }
    @Override
    public void deleteReturById(Integer id) {
        borrowMapper.deleteReturById(id);
    }



    @Override
    public Map<String, Object> getCountByTimeRange(String timeRange) {
        Map<String, Object> map = new HashMap<>();
        Date today = new Date();
        List<DateTime> dateRange;
        switch (timeRange) {
            case "week":
                // offsetDay 计算时间的一个工具方法
                // rangeToList 返回从开始时间到结束时间的一个时间范围
                dateRange = DateUtil.rangeToList(DateUtil.offsetDay(today, -6), today, DateField.DAY_OF_WEEK);
                break;
            case "month":
                dateRange = DateUtil.rangeToList(DateUtil.offsetDay(today, -29), today, DateField.DAY_OF_MONTH);
                break;
            case "month2":
                dateRange = DateUtil.rangeToList(DateUtil.offsetDay(today, -59), today, DateField.DAY_OF_MONTH);
                break;
            case "month3":
                dateRange = DateUtil.rangeToList(DateUtil.offsetDay(today, -89), today, DateField.DAY_OF_MONTH);
                break;
            default:
                dateRange = new ArrayList<>();
        }
        //  datetimeToDateStr() 就是一个处理的方法， 把 DateTime类型的List转换成一个 String的List
        List<String> dateStrRange = datetimeToDateStr(dateRange);
        map.put("date", dateStrRange);  // x轴的日期数据生产完毕

        //  timeRange = week  month
        // getCountByTimeRange 不会统计数据库没有的日期，比如 数据库 11.4 这一天数据没有，他不会返回 date=2022-11-04,count=0 这个数据
        List<BorrowReturCountPO> borrowCount = borrowMapper.getCountByTimeRange(timeRange, 1);   // 1 borrow  2 return
        List<BorrowReturCountPO> returnCount = borrowMapper.getCountByTimeRange(timeRange, 2);
        map.put("borrow", countList(borrowCount, dateStrRange));
        map.put("retur", countList(returnCount, dateStrRange));
        return map;
    }

    // 把 DateTime类型的List转换成一个 String的List
    private List<String> datetimeToDateStr(List<DateTime> dateTimeList) {
        List<String> list = CollUtil.newArrayList();
        if (CollUtil.isEmpty(dateTimeList)) {
            return list;
        }
        for (DateTime dateTime : dateTimeList) {
            String date = DateUtil.formatDate(dateTime);
            list.add(date);
        }
        return list;
    }

    // 对数据库未统计的时间进行处理
    private List<Integer> countList(List<BorrowReturCountPO> countPOList, List<String> dateRange) {
        List<Integer> list = CollUtil.newArrayList();
        if (CollUtil.isEmpty(countPOList)) {
            return list;
        }
        for (String date : dateRange) {
            // .map(BorrowReturCountPO::getCount) 取出 对象里的 count值
            // orElse(0) 对没匹配的数据返回0
            // "2022-11-04" 没有的话 就返回0
            Integer count = countPOList.stream().filter(countPO -> date.equals(countPO.getDate()))
                    .map(BorrowReturCountPO::getCount).findFirst().orElse(0);
            list.add(count);
        }
        // 最后返回的list的元素个数会跟 dateRange 的元素个数完全一样
        // dateRange: [
        //            "2022-10-30",
        //            "2022-10-31",
        //            "2022-11-01",
        //            "2022-11-02",
        //            "2022-11-03",
        //            "2022-11-04",
        //            "2022-11-05"
        //        ],
        // borrow: [
        //            0,
        //            0,
        //            2,
        //            1,
        //            0,
        //            1,
        //            3
        //        ]
        return list;
    }




}

