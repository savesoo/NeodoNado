package com.potato.nedonado.service.board;

import com.potato.nedonado.domain.board.BoardDTO;
import com.potato.nedonado.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardListService {
    @Autowired(required = false)
    private BoardMapper boardMapper;

    public List<BoardDTO> selectBoardList(int page) {
        return boardMapper.selectItemList(page);
    }
}
