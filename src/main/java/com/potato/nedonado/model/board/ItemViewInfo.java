package com.potato.nedonado.model.board;

import lombok.*;

import javax.validation.constraints.NotEmpty;
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
    @NotEmpty
    private long boardIdx;
    @NotEmpty
    private String title;
    @NotEmpty
    private String content;
    @NotEmpty
    private int category;
    private List<String> imgURL;
    @NotEmpty
    private int onSale;
    @NotEmpty
    private int price;
    @NotEmpty
    private long userIdx;
    @NotEmpty
    private String writeDate;

    public void makeImgURL(String img) {
        if(img == null || img.isEmpty()) return;
        imgURL = Arrays.asList(img.split(","));
    }
}