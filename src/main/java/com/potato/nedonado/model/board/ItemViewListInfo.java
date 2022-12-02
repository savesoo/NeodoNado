package com.potato.nedonado.model.board;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class ItemViewListInfo {
    private long boardIdx;
    private String title;
    private String thumbnail;
    private int onSale;
    private int price;
    private long writeDate;
}
