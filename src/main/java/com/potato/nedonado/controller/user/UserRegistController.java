package com.potato.nedonado.controller.user;

import com.potato.nedonado.model.user.UserDTO;
import com.potato.nedonado.service.user.UserRegistService;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.SQLException;

@Log4j2
@Controller
@RequestMapping("/register")
public class UserRegistController {

    private final UserRegistService userRegistService;

    public UserRegistController(UserRegistService userRegistService) {
        this.userRegistService = userRegistService;
    }

    @GetMapping
    public void getInsertUser(){

        log.info("get register ... ");


    }

    @PostMapping
    public String postInsertUser(@ModelAttribute UserDTO userDTO,
                                 BindingResult bindingResult,
                                 RedirectAttributes rttr) throws SQLException {

        log.info("post register ... ");

//        if(bindingResult.hasErrors()){
//            log.info(bindingResult.getAllErrors());
//            return "redirect:/user/register";
//        }

        log.info(userDTO);

        userRegistService.insertUser(userDTO);

        String message = "너도나도에 가입하신 걸 환영합니다! \n 로그인 화면으로 이동합니다.";
        rttr.addFlashAttribute("regMsg", message);

        return "redirect:/login";

    }
}

