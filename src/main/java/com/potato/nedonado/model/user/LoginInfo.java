package com.potato.nedonado.model.user;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class LoginInfo {

    @NotEmpty
    private long userIdx;
    @NotEmpty
    private String userId;
    private String uuid;

    @NotEmpty
    private String location;
    @NotEmpty
    private String nickname;
    private int byear;
    private int bmonth;
    private int bday;

    @NotEmpty
    private long joinDate;
    private boolean deleted;

}
