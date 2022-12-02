package com.potato.spring.interceptor;

import com.potato.nedonado.model.user.UserDTO;
import com.potato.nedonado.service.user.UserLoginService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.UUID;

import static com.potato.nedonado.util.Util.findCookie;

@Log4j2
public class LoginRememberInterceptor implements HandlerInterceptor {

    @Autowired
    private UserLoginService loginService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        log.info(" >>> 자동로그인을 위한 세션 체크 >>> ");

        Cookie cookie = findCookie(request.getCookies(), "uuid");

        log.info("cookie 있니? = " + cookie.getValue());

        HttpSession session = request.getSession(false);

        if (session!=null && session.getAttribute("loginInfo")==null) {

            if (cookie != null && cookie.getValue() != null) {

                log.info(" >>> 세션 없으므로 자동로그인 X >>> ");
                log.info(" >>> 쿠키 확인, uuid 여부 체크 >>> ");
                log.info("cookie 있니? = " + cookie);

                UserDTO user = loginService.selectUUID(cookie.getValue());

                log.info("저장된 uuid user = " + user);

                if(user!=null){

                    log.info(" >>> uuid 존재하므로 자동로그인 및 uuid 갱신 >>> ");

                    UUID uuid = UUID.randomUUID();
                    loginService.updateUUID(uuid.toString(), user.getUserIdx());
                    session.setAttribute("loginInfo", user.loginData());

                    cookie.setValue(uuid.toString());
                    response.addCookie(cookie);

                    log.info(" >>> 자동로그인 처리 완료 >>> ");

                }


                return true;
            }

            log.info(" >>> 세션 있으므로 자동로그인 미처리 >>> ");
            log.info("session = " + session);
            return true;
        }

        log.info(" >>> 기존 자동로그인 유지 상태 >>> ");
        return true;

    }

}
