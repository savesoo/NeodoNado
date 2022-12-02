package com.potato.nedonado.mapper;

import com.potato.nedonado.model.board.ItemEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<ItemEntity> selectItemList(int page);

    int insertItem(ItemEntity itemEntity);

    ItemEntity selectItemByIdx(long boardIdx);
}
