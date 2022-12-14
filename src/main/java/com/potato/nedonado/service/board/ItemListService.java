package com.potato.nedonado.service.board;

import com.potato.nedonado.mapper.BoardMapper;
import com.potato.nedonado.model.board.ItemEntity;
import com.potato.nedonado.model.board.ItemViewListInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ItemListService {
    @Autowired(required = false)
    private BoardMapper boardMapper;

    public List<ItemViewListInfo> selectBoardListByPage(int page) {
        List<ItemViewListInfo> list = new ArrayList<ItemViewListInfo>();
        List<ItemEntity> entities = boardMapper.selectItemListByPage(page);

        for(ItemEntity entity : entities) {
            list.add(entity.toItemViewListInfo());
        }

        return list;
    }


    public List<ItemViewListInfo> selectBoardListByListIdx(long idx) {
        List<ItemViewListInfo> list = new ArrayList<ItemViewListInfo>();
        List<ItemEntity> entities = boardMapper.selectItemListByItemIdx(idx);

        for(ItemEntity entity : entities) {
            list.add(entity.toItemViewListInfo());
        }

        return list;
    }
}
