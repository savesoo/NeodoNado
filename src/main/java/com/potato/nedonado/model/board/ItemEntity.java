package com.potato.nedonado.model.board;

import com.potato.nedonado.util.Util;
import lombok.*;

import javax.validation.constraints.NotEmpty;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class ItemEntity {
    @NotEmpty
    private long boardIdx;
    private int boardCategory;

    @NotEmpty
    private String title;
    @NotEmpty
    private String content;
    @NotEmpty
    private int category;
    private String thumbnail;
    private String imgURL;
    @NotEmpty
    private int onSale;
    @NotEmpty
    private int price;
    @NotEmpty
    private long userIdx;
    @NotEmpty
    private long writeDate;

    public ItemViewListInfo toItemViewListInfo(){
        return ItemViewListInfo.builder()
                .boardIdx(boardIdx)
                .title(title)
                .price(price)
                .onSale(onSale)
                .thumbnail(thumbnail)
                .writeDate(Util.convertLongTimestampToString(writeDate))
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