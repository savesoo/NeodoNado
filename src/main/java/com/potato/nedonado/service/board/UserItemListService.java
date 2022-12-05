package com.potato.nedonado.service.board;

import com.potato.nedonado.mapper.BoardMapper;
import com.potato.nedonado.model.board.ItemEntity;
import com.potato.nedonado.model.board.ItemViewListInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserItemListService {

    @Autowired(required = false)
    private BoardMapper boardMapper;

    public List<ItemViewListInfo> selectItemListByUserIdx(long userIdx){

        List<ItemViewListInfo> list = new ArrayList<>();
        List<ItemEntity> mylists = boardMapper.selectItemListByUserIdx(userIdx);

        for(ItemEntity item : mylists){
            list.add(item.toItemViewListInfo());
        }

        return list;
    }
}
