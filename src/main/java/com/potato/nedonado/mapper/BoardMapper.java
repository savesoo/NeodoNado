package com.potato.nedonado.mapper;

import com.potato.nedonado.model.board.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper

public interface BoardMapper {
    List<BoardDTO> selectItemList(int page);
}
