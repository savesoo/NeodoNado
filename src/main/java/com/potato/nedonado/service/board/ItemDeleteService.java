package com.potato.nedonado.service.board;

import com.potato.nedonado.mapper.BoardMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Log4j2
@Service
public class ItemDeleteService {
    @Autowired(required = false)
    BoardMapper boardMapper;

    public int deleteItemByBoardIdx(long boardIdx, long userIdx) {
        return boardMapper.deleteByIdx(boardIdx, userIdx);
    }
}
