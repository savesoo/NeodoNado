package com.potato.nedonado.controller.board;

import com.potato.nedonado.service.board.ItemViewService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Log4j2
@Controller
@RequestMapping("/board/view")
public class ItemViewController {
    @Autowired
    ItemViewService itemViewService;

    @GetMapping
    public String viewItem(
            HttpServletRequest request,
            HttpServletResponse response
    ){
        request.setAttribute("item", itemViewService.selectItemByIdx(5));
        return "/board/itemview";
    }
}
