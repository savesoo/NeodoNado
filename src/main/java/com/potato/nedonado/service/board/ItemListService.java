package com.potato.nedonado.service.board;

import com.potato.nedonado.mapper.BoardMapper;
import com.potato.nedonado.model.board.ItemEntity;
import com.potato.nedonado.model.board.ItemViewInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ItemListService {
    @Autowired(required = false)
    private BoardMapper boardMapper;

    public List<ItemViewInfo> selectBoardList(int page) {
        List<ItemViewInfo> list = new ArrayList<ItemViewInfo>();
        List<ItemEntity> entities = boardMapper.selectItemList(page);

        for(ItemEntity entity : entities) {
            list.add(entity.toItemViewInfo());
        }

        return list;
    }
}
