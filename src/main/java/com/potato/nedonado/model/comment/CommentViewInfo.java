package com.potato.nedonado.model.comment;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class CommentViewInfo {

    private long commentIdx;
    private long boardIdx;
    private long userIdx;
    private String nickname;
    private  String content;
    private String writeDate;


}
