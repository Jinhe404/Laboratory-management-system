package com.lab.demo.exception;


import cn.hutool.core.util.StrUtil;
import com.lab.demo.common.Result;
import lombok.extern.slf4j.Slf4j;
import net.bytebuddy.build.BuildLogger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {
    /**
     * 如果抛出的的是ServiceException，则调用该方法
     * @param se 业务异常
     * @return
     */
    @ExceptionHandler(ServiceException.class)
    @ResponseBody
    public Result handle(ServiceException se){
        return Result.error(se.getCode(),se.getMessage());
    }



//    @ExceptionHandler(value = ServiceException.class)
//    @ResponseBody
//    public Result serviceExceptionError(ServiceException e) {
//        log.error("业务异常", e);
//        String code = e.getCode();
//        if (StrUtil.isNotBlank(code)) {
//            return Result.error(code, e.getMessage());
//        }
//        return Result.error(e.getMessage());
//    }
//
//    @ExceptionHandler(value = Exception.class)
//    public Result exceptionError(Exception e) {
//        log.error("系统错误", e);
//        return Result.error("系统错误");
//    }

}
