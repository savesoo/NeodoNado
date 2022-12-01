package com.potato.nedonado.domain;

import lombok.*;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class LoginData {

    private String userid;
    private LocalDate joindate;
    private String loc;
    private String nickname;
    private boolean deleteuser;

}
