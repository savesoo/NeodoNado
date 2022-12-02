package com.potato.nedonado.model.board;

import com.potato.nedonado.util.Util;
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

    public ItemViewListInfo toItemViewListInfo(){
        return ItemViewListInfo.builder()
                .boardIdx(boardIdx)
                .title(title)
                .price(price)
                .onSale(onSale)
                .thumbnail(thumbnail)
                .writeDate(writeDate)
                .build();
    }

    public ItemViewInfo toItemViewInfo() {
        ItemViewInfo view = ItemViewInfo.builder()
                .boardIdx(boardIdx)
                .category(category)
                .title(title)
                .content(content)
                .price(price)
                .onSale(onSale)
                .writeDate(Util.convertLongTimestampToString(writeDate))
                .userIdx(userIdx)
                .build();
        view.makeImgURL(imgURL);
        return view;
    }
}