package com.potato.nedonado.controller.board;

import com.potato.nedonado.model.user.LoginInfo;
import com.potato.nedonado.service.board.UserItemListService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Log4j2
@Controller
@RequestMapping("/user/myitemlist")
public class UserItemListController {

    @Autowired
    private UserItemListService userItemListService;


    @GetMapping
    public void getMyItemList(Model model, HttpServletRequest req){

        log.info(" >>> get MyItemList Page >>> ");

        LoginInfo loginInfo = (LoginInfo) req.getSession().getAttribute("loginInfo");
        log.info("loginInfo = " + loginInfo);
        model.addAttribute("myItemList",
                            userItemListService.selectItemListByUserIdx(loginInfo.getUserIdx()));

    }

}
