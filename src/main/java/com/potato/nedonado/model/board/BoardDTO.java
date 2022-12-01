package com.potato.nedonado.model.board;

import com.fasterxml.jackson.databind.util.JSONPObject;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class BoardDTO {
    private long boardIdx;
    private int boardCategory;
    private String title;
    private String content;
    private int category;
    private JSONPObject imgURL;
    private int onSale;
    private int price;
    private long userIdx;
    private long writeDate;

    public BoardViewInto toBoardView(){
        return BoardViewInto.builder()
                .boardIdx(boardIdx)
                .title(title)
                .price(price)
                .onSale(onSale)
                .writeDate(writeDate)
                .build();
    }
}