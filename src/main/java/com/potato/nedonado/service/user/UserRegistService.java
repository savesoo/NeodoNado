package com.potato.nedonado.service.user;

import com.potato.nedonado.mapper.UserMapper;
import com.potato.nedonado.model.user.UserDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Log4j2
@Service
public class UserRegistService {

    @Autowired(required = false)
    private UserMapper userMapper;

    public int insertUser(UserDTO userDTO) throws SQLException {

        return userMapper.insertUser(userDTO);
    }
}
