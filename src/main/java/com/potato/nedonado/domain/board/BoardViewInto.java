package com.potato.nedonado.domain.board;

import com.fasterxml.jackson.databind.util.JSONPObject;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Builder
public class BoardViewInto {
    private long boardIdx;
    private String title;
    private JSONPObject imgURL;
    private int onSale;
    private int price;
    private long writeDate;
}
