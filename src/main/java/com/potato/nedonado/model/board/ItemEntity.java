package com.potato.nedonado.model.board;

import com.fasterxml.jackson.databind.util.JSONPObject;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class ItemEntity {
    private long boardIdx;
    private int boardCategory;
    private String title;
    private String content;
    private int category;
    private String thumbnail;
    private String imgURL;
    private int onSale;
    private int price;
    private long userIdx;
    private long writeDate;

    public ItemViewInfo toEntityViewInfo(){
        return ItemViewInfo.builder()
                .boardIdx(boardIdx)
                .title(title)
                .price(price)
                .onSale(onSale)
                .thumbnail(thumbnail)
                .writeDate(writeDate)
                .build();
    }
}