package org.yecq.weblibrary.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.yecq.weblibrary.bean.LogStatus;
import org.yecq.weblibrary.bean.LoginResult;
import org.yecq.weblibrary.bean.LogoutResult;
import org.yecq.weblibrary.service.LogService;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author yecq
 */
@RestController
public class LogController {

    @Autowired
    private LogService ls;

    @RequestMapping("if/is-logged.php")
    public LogStatus isLogged(HttpSession session) {
        return this.ls.isLogged(session);
    }

    @RequestMapping(path = "if/regist.php",method = RequestMethod.POST)
    public Map regist(@RequestParam("username")String username,@RequestParam("passwd")String passwd,@RequestParam("name")String name,@RequestParam("cellphone")String cellphone){
        System.out.println("Juniors");
        return this.ls.regist(username,passwd,name,cellphone);
    }

    @RequestMapping("if/login.php")
    public LoginResult login(@RequestParam("username") String username, @RequestParam("passwd") String passwd, HttpSession session, HttpServletResponse response) {
        return this.ls.login(username, passwd, session,response);
    }

    @RequestMapping("if/logout.php")
    public LogoutResult logout(HttpSession session) {
        return this.ls.logout(session);
    }

}
