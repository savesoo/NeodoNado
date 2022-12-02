package com.potato.nedonado.model.board;

import lombok.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class ItemViewInfo {
    private long boardIdx;
    private String title;
    private String content;
    private int category;
    private List<String> imgURL;
    private int onSale;
    private int price;
    private long userIdx;
    private String writeDate;

    public void makeImgURL(String img) {
        if(img == null || img.isEmpty()) return;
        imgURL = Arrays.asList(img.split(","));
    }
}