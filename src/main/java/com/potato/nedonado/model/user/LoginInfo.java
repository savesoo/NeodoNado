package com.potato.nedonado.model.user;

import lombok.*;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class LoginInfo {

    private long userIdx;
    private String userId;
    private String uuid;

    private String location;
    private String nickname;
    private int byear;
    private int bmonth;
    private int bday;

    private long joinDate;
    private boolean deleted;

}
