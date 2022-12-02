package com.potato.nedonado.service.user;

import com.potato.nedonado.mapper.UserMapper;
import com.potato.nedonado.model.user.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class UserDataEditService {

    @Autowired(required = false)
    private UserMapper userMapper;

    public long editUserInfo(UserDTO userDTO, long userIdx) throws SQLException {

        //UserDTO user = UserDTO.builder().userIdx(userIdx).build();
        userDTO.setUserIdx(userIdx);
        return userMapper.editUserInfo(userDTO);

    }
}
