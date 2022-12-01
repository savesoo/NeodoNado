package com.potato.nedonado.model.user;

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
    private int bYear;
    private int bMonth;
    private int bDay;

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

}
