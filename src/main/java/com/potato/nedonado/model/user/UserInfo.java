package com.potato.nedonado.model.user;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class UserInfo {

    @NotEmpty
    private long userIdx;
    @NotEmpty
    private String userId;

    private String nickname;
    private String nation;
    private String phone;

    @NotEmpty
    private String location;
    private int byear;
    private int bmonth;
    private int bday;

    @NotEmpty
    private String joinDate;

}
