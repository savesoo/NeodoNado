package com.potato.nedonado.controller.user;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping("/user/logout")
public class UserLogoutController {

    @GetMapping
    public String getloginFormAfterLogout(HttpSession session, HttpServletResponse res){

        log.info("logout get ... ");

        session.invalidate();

        Cookie cookie = new Cookie("uuid", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        res.addCookie(cookie);

        return "redirect:/user/login";

    }

}
