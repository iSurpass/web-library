package org.yecq.weblibrary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.yecq.weblibrary.service.MyService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Juniors
 */
@RestController
public class MyController {

    @Autowired
    MyService myService;

    /*@RequestMapping("if/is-logged.php")
    public Map log(HttpSession session){

        return myService.log(session);

    }*/
}
