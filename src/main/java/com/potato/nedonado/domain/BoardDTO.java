package com.potato.nedonado.domain;

import lombok.*;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class BoardDTO {

    private long boardid;
    private String userid;
    private int category;
    private String product;
    private LocalDate writedate;
    private long saleprice;
    private boolean salestatus;
    private String tradeloc;

}
