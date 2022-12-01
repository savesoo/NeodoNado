package com.potato.nedonado.domain;

import lombok.*;

import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class LoginInfo {

    private String userId;
    private String uuid;
    private LocalDate joinDate;
    private String location;
    private String nickname;
    private boolean deleted;

}
