package com.potato.nedonado.mapper;

import com.potato.nedonado.model.board.ItemEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<ItemEntity> selectItemListByPage(int page);

    int insertItem(ItemEntity itemEntity);

    ItemEntity selectItemByIdx(long boardIdx);

    ItemEntity selectItemByIdxAndUserIdx(long boardIdx, long userIdx);

    List<ItemEntity> selectItemListByItemIdx(long boardIdx);

    int deleteByIdx(long boardIdx, long userIdx);
    int updateItem(ItemEntity itemEntity);
}
