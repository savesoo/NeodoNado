package com.potato.nedonado.model.comment;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class CommentDTO {

    private long boardIdx;

    private long commentIdx;
    private  String contentText;
    private long commentTime;

    private String nickname;
    private long userIdx;


}
