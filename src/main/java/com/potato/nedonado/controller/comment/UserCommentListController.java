package com.potato.nedonado.controller.comment;

import com.potato.nedonado.model.comment.CommentDTO;
import com.potato.nedonado.model.comment.CommentViewInfo;
import com.potato.nedonado.model.user.LoginInfo;
import com.potato.nedonado.service.comment.UserCommentListService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("/user/mycomment")
public class UserCommentListController {

    @Autowired
    private UserCommentListService userCommentListService;



    @GetMapping
    public void getMyComment(Model model, HttpServletRequest req){

        log.info(" >>> get myComment Page >>> ");


        LoginInfo loginInfo = (LoginInfo) req.getSession().getAttribute("loginInfo");
        log.info("loginInfo = " + loginInfo);
        //List<CommentViewInfo> list = userCommentListService.selectCommentByUserIdx(loginInfo.getUserIdx());
        model.addAttribute("myCommentList", userCommentListService.selectCommentByUserIdx(loginInfo.getUserIdx()));

    }


}
