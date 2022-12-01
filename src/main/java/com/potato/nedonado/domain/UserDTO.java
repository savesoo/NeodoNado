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

    private String userid;
    private String password;
    private LocalDate joindate;
    private String loc;
    private String nickname;
    private boolean deleteuser;

    public UserDTO loginData(){

        return UserDTO.builder()
                .userid(this.getUserid())
                .password(this.getPassword())
                .build();
    }

}
