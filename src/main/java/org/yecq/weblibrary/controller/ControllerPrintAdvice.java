package org.yecq.weblibrary.controller;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.yecq.weblibrary.bean.LogStatus;
import org.yecq.weblibrary.bean.PagedData;
import org.yecq.weblibrary.service.BookService;
import org.yecq.weblibrary.service.LogService;
import sun.rmi.runtime.Log;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 面向切面编程实例
 *
 * @author Juniors
 */
@Component
@Aspect
public class ControllerPrintAdvice {

    @Autowired
    LogService logService;

    @Autowired
    BookService service;

    @Autowired
    HttpSession session;

    @Around("within(@org.springframework.web.bind.annotation.RestController org.yecq.weblibrary.controller.BookController ) && execution(@org.springframework.web.bind.annotation.RequestMapping * *(..))")
    public PagedData print(ProceedingJoinPoint point){

        Object[] objects = point.getArgs();

        LogStatus status = logService.isLogged((HttpSession) objects[3]);


        PagedData data = new PagedData();
        List row = new ArrayList();

        if (status.isLogged()){
            try {
                return (PagedData) point.proceed();
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
        }else {
            data.setPage(0);
            data.setRows(row);
            return data;
        }
        return data;
    }
}
