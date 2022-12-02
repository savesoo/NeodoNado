package com.potato.spring.interceptor;

import lombok.extern.log4j.Log4j2;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Log4j2
public class AuthCheckInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession(false);
        log.info(" >>> 로그인 권한 확인중 >>> ");

        if(session!=null && session.getAttribute("loginInfo")!=null){

            log.info(" >>> 로그인 상태 >>> ");
            return true;

        }

        log.info(" >>> 비로그인 상태이므로 로그인 진행 >>> ");
        response.sendRedirect("/user/login");
        return false;

    }
}
