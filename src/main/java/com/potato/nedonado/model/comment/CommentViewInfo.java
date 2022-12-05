package com.potato.nedonado.model.comment;

import lombok.*;

import javax.validation.constraints.NotEmpty;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class CommentViewInfo {

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
    private String writeDate;


}
