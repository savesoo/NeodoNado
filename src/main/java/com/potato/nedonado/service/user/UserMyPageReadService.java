package com.potato.nedonado.service.user;

import com.potato.nedonado.mapper.UserMapper;
import com.potato.nedonado.model.user.UserDTO;
import com.potato.nedonado.model.user.UserInfo;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Log4j2
@Service
public class UserMyPageReadService {

    @Autowired(required = false)
    private UserMapper userMapper;

    public UserInfo selectUserByIdx(long userIdx) throws SQLException {

        return userMapper.selectUserByIdx(userIdx).toUserInfo();
    }

}
