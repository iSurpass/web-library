package org.yecq.weblibrary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.yecq.weblibrary.bean.LogStatus;
import org.yecq.weblibrary.bean.LoginResult;
import org.yecq.weblibrary.bean.LogoutResult;

/**
 *
 * @author yecq
 */
@Service
public class LogService {

    @Autowired
    private JdbcTemplate jdbc;

    private static Logger log = Logger.getLogger(LogService.class);

    public Map regist(String username,String passwd,String name,String cellphone){

        Map map = new HashMap();
        String sql = "SELECT * from user where username = ?";
        List<Map<String,Object>> list = jdbc.queryForList(sql,username);
        if (!list.isEmpty()){
            log.info(getClass().getName()+"用户已存在");
            map.put("status","用户已存在");
            return map;
        }

        sql = "INSERT into user(username,passwd,name,cellphone) VALUES(?,?,?,?)";
        int ret = jdbc.update(sql,username,passwd,name,cellphone);
        if (ret > 0){
            map.put("status","注册成功");
            return map;
        }else {
            map.put("status","注册失败");
            return map;
        }
    }

    public LogStatus isLogged(HttpSession session) {
        LogStatus ret = new LogStatus();
        Object o = session.getAttribute("USER_NAME");
        if (o != null) {
            ret.setLogged(true);
            ret.setUsername((String) o);
        } else {
            ret.setLogged(false);
        }
        return ret;
    }

    public LoginResult login(String username, String passwd, HttpSession session, HttpServletResponse response) {
        LoginResult st = new LoginResult();
        st.setStatus("用户名密码失败");

        List<Map<String, Object>> list = this.jdbc.queryForList("select id from user where username=? and passwd=?", username, passwd);
        if (!list.isEmpty()) {
            Map<String, Object> o = list.get(0);
            int id = Integer.parseInt(o.get("id") + "");
            session.setAttribute("USER_ID", id);
            session.setAttribute("USER_NAME", username);
            session.setMaxInactiveInterval(60);
            Cookie cookie = new Cookie("Cookie_NAME","cookieeee");
            response.addCookie(cookie);
            st.setStatus("登录成功");
            st.setUsername(username);
        }
        return st;
    }

    public LogoutResult logout(HttpSession session) {

        session.removeAttribute("USER_ID");
        session.removeAttribute("USER_NAME");
        LogoutResult ret = new LogoutResult();
        ret.setStatus("注销成功");

        return ret;
    }
}
