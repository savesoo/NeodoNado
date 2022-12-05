package com.potato.nedonado.model.comment;

import com.potato.nedonado.util.Util;
import lombok.*;

import javax.validation.constraints.NotEmpty;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class CommentDTO {

    @NotEmpty
    private long commentIdx;
    @NotEmpty
    private long boardIdx;
    @NotEmpty
    private long userIdx;
    @NotEmpty
    private String nickname;
    @NotEmpty
    private  String content;
    @NotEmpty
    private long writeDate;

    public CommentViewInfo toCommentView(){
        return new CommentViewInfo(commentIdx, boardIdx, userIdx, nickname, content, Util.convertLongTimestampToString(writeDate));
    }
}
