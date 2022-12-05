package com.potato.nedonado.controller.board;

import com.potato.nedonado.model.board.ItemEntity;
import com.potato.nedonado.model.user.LoginInfo;
import com.potato.nedonado.service.board.ItemUpdateService;
import com.potato.nedonado.service.board.ItemViewService;
import com.potato.nedonado.util.CategoryUtil;
import com.potato.nedonado.util.Util;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Log4j2
@RestController
@RequestMapping("/board/update")
public class ItemUpdateController {
    @Autowired
    ItemViewService itemViewService;

    @Autowired
    ItemUpdateService itemUpdateService;

    @GetMapping("/{idx}")
    public ModelAndView updateItem(
            @PathVariable("idx") long boardIdx,
            HttpServletRequest request
    ) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("itemCategory", CategoryUtil.categoryNames);
        mav.addObject("item", itemViewService.selectItemByIdx(boardIdx));
        mav.setViewName("/board/itemupdate");
        return mav;
    }

    @PostMapping
    public ResponseEntity<Map<String, String>> updateItem(
            HttpServletRequest request,
            @RequestBody ItemEntity itemEntity
    ) {
        log.info(itemEntity);

        HttpHeaders httpHeaders = new HttpHeaders();
        Map<String, String> result = new HashMap<>();

        if((itemEntity.getTitle() == null  || itemEntity.getTitle().isEmpty())
                || (itemEntity.getContent() == null  || itemEntity.getContent().isEmpty())
                || (itemEntity.getPrice() <= 0)) {
            result.put("msg", "입력 데이터를 다시 확인해주세요.");
            return new ResponseEntity<>(result, httpHeaders, HttpStatus.OK);
        }

        LoginInfo loginInfo = (LoginInfo) request.getSession().getAttribute("loginInfo");
        if(loginInfo == null) {
            result.put("msg", "세션이 만료되었습니다.");
            result.put("url", "/login");
            return new ResponseEntity<>(result, httpHeaders, HttpStatus.OK);
        }
        log.info(loginInfo);

        itemEntity.setUserIdx(loginInfo.getUserIdx());
        log.info(itemEntity);
        int r = itemUpdateService.updateItemByitemEntity(itemEntity);

        result.put("url","/board/view/"+itemEntity.getBoardIdx());
        return new ResponseEntity<>(result, httpHeaders, HttpStatus.OK);
    }
}
