package com.potato.spring.Filter;

import lombok.extern.log4j.Log4j2;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j2
@WebFilter(filterName = "LoginCheckFilter", urlPatterns = {"/board/*"})
public class LoginCheckFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }

    // Filter가 먼저, Spring 진입 후 Interceptor가 나중에 동작
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        log.info(" >>> 로그인 필터 진입. 로그인시 페이지 미출력 >>> ");

        // ServletRequest가 더 상위이므로 형변환
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();

        if(session.getAttribute("loginInfo")==null){

            log.info(" >>> 비로그인 상태 -> 로그인 페이지로 이동 >>> ");
            res.sendRedirect("/user/login");

        }

            chain.doFilter(request, response);

    }


}
