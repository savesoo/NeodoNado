package com.potato.nedonado.service.board;

import com.potato.nedonado.mapper.BoardMapper;
import com.potato.nedonado.model.board.ItemEntity;
import com.potato.nedonado.model.board.ItemViewInfo;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Log4j2
@Service
public class ItemUpdateService {
    @Autowired(required = false)
    BoardMapper boardMapper;

    public int updateItemByitemEntity(ItemEntity itemEntity) {
        return boardMapper.updateItem(itemEntity);
    }

}
