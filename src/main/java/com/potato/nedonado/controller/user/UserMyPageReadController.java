package com.potato.nedonado.controller.user;

import com.potato.nedonado.model.user.LoginInfo;
import com.potato.nedonado.model.user.UserDTO;
import com.potato.nedonado.service.user.UserMyPageReadService;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@Log4j2
@Controller
@RequestMapping("/user/mypage")
public class UserMyPageReadController {

    private final UserMyPageReadService myPageReadService;

    public UserMyPageReadController(UserMyPageReadService myPageReadService) {
        this.myPageReadService = myPageReadService;
    }

    @GetMapping
    public void getMyPage(@ModelAttribute UserDTO userDTO, Model model, HttpServletRequest req) throws SQLException {

        log.info("get MyPage ... ");

        LoginInfo loginInfo = (LoginInfo) req.getSession().getAttribute("loginInfo");
        log.info(loginInfo);
        model.addAttribute("loginInfo", myPageReadService.selectUserByIdx(loginInfo.getUserIdx()));

    }


}
