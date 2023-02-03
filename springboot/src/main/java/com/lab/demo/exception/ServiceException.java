package com.lab.demo.exception;

/*
* 自定义异常
* */

import lombok.Getter;

@Getter
public class ServiceException extends RuntimeException {
    private String code;
    public String getCode() {
        return code;
    }
    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }

    public ServiceException(String message) {
        super(message);
    }

    public ServiceException(String code,String mag) {
        super(mag);
        this.code = code;
    }
}
