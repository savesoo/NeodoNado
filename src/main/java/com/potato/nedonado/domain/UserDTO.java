package com.potato.nedonado.domain;

import lombok.*;

import java.time.LocalDate;

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
    private LocalDate joinDate;
    private String location;
    private String nickname;
    private boolean deleted;

    public LoginInfo loginData(){

        return LoginInfo.builder()
                .uuid(uuid)
                .userId(userId)
                .joinDate(joinDate)
                .nickname(nickname)
                .location(location)
                .deleted(deleted)
                .build();
    }

}
