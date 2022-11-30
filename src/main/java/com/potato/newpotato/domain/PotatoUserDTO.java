package com.potato.newpotato.domain;

import lombok.*;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class PotatoUserDTO {

    private String userid;
    private String password;
    private LocalDate joindate;
    private String loc;
    private String nickname;
    private boolean deleteuser;

}
