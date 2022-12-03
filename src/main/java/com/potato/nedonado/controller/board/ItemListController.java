package com.potato.nedonado.controller.board;

import com.potato.nedonado.model.board.ItemViewListInfo;
import com.potato.nedonado.service.board.ItemListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/board/list")
public class ItemListController {
    @Autowired
    ItemListService service;

    @GetMapping
    public ModelAndView getBoardList(){
        ModelAndView mav = new ModelAndView();
        mav.addObject("itemList", service.selectBoardListByPage(0));
        mav.setViewName("/board/itemlist");
        return mav;
    }

    @GetMapping("/{idx}")
    public ResponseEntity<List<ItemViewListInfo>> getBoardList(
            @PathVariable("idx") long boardIdx
    ) {
        List<ItemViewListInfo> itemList = service.selectBoardListByListIdx(boardIdx);

        HttpHeaders httpHeaders = new HttpHeaders();
        return new ResponseEntity<>(itemList, httpHeaders, HttpStatus.OK);
    }
}
