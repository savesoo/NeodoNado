package com.potato.nedonado.model.user;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class UserInfo {

    private long userIdx;
    private String userId;

    private String nickname;
    private String nation;
    private String phone;

    private String location;
    private int byear;
    private int bmonth;
    private int bday;

    private String joinDate;

}
