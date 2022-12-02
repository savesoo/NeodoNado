package com.potato.nedonado.controller.user;

import com.potato.nedonado.model.user.LoginInfo;
import com.potato.nedonado.model.user.UserDTO;
import com.potato.nedonado.service.user.UserDataEditService;
import com.potato.nedonado.service.user.UserMyPageReadService;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@Log4j2
@Controller
@RequestMapping("/user/edit")
public class UserDataEditController {

    private final UserDataEditService editService;

    private final UserMyPageReadService readService;

    public UserDataEditController(UserDataEditService editService, UserMyPageReadService readService) {
        this.editService = editService;
        this.readService = readService;
    }

    @GetMapping
    public void getEditPage(Model model, HttpServletRequest req) throws SQLException {
        log.info("get edit ... ");
        LoginInfo loginInfo = (LoginInfo)  req.getSession().getAttribute("loginInfo");
        model.addAttribute("user", readService.selectUserByIdx(loginInfo.getUserIdx()));
    }


    @PostMapping
    public String postEdit(
            @ModelAttribute UserDTO userDTO,
            HttpServletRequest req
    ) throws SQLException {

        log.info("post edit ... ");
        log.info(userDTO);

        LoginInfo loginInfo = (LoginInfo) req.getSession().getAttribute("loginInfo");
        log.info(loginInfo);
        editService.editUserInfo(userDTO, loginInfo.getUserIdx());

        return "redirect:/user/mypage";

    }


}
