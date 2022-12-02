package com.potato.nedonado.model.user;

import com.potato.nedonado.util.Util;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class UserDTO {

    private long userIdx;
    private String uuid;

    private String userId;
    private String userPw;

    private String nickname;
    private String nation;
    private String phone;

    private String location;
    private int byear;
    private int bmonth;
    private int bday;

    private long joinDate;
    private boolean deleted;

    public LoginInfo loginData(){

        return LoginInfo.builder()
                .userIdx(userIdx)
                .uuid(uuid)
                .userId(userId)
                .joinDate(joinDate)
                .nickname(nickname)
                .location(location)
                .deleted(deleted)
                .build();
    }

    public UserInfo toUserInfo(){

        return UserInfo.builder()
                .userIdx(userIdx)
                .userId(userId)
                .nickname(nickname)
                .nation(nation)
                .phone(phone)
                .location(location)
                .byear(byear)
                .bmonth(bmonth)
                .bday(bday)
                .joinDate(Util.convertLongTimestampToString(joinDate)).build();

    }

}
