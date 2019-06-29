package org.yecq.weblibrary.service;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Juniors
 */
@Service
public class MyService {

    public Map log(HttpSession httpSession){

        Map map = new HashMap();
        map.put("logged",true);
        map.put("username","juniors");

        return map;
    }
}
