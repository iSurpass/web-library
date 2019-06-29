package org.yecq.weblibrary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
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

    public Map regist(String username,String passwd,String name,String cellphone){
        Map map = new HashMap();
        map.put("status","注册成功!");
        return map;
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

    public LoginResult login(String username, String passwd, HttpSession session) {
        LoginResult st = new LoginResult();
        st.setStatus("用户名密码失败");

        List<Map<String, Object>> list = this.jdbc.queryForList("select id from user where username=? and passwd=?", username, passwd);
        if (!list.isEmpty()) {
            Map<String, Object> o = list.get(0);
            int id = Integer.parseInt(o.get("id") + "");
            session.setAttribute("USER_ID", id);
            session.setAttribute("USER_NAME", username);
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
