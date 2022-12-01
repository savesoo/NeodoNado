package com.potato.nedonado.model.board;

import com.fasterxml.jackson.databind.util.JSONPObject;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class ItemViewInfo {
    private long boardIdx;
    private String title;
    private String thumbnail;
    private int onSale;
    private int price;
    private long writeDate;
}
