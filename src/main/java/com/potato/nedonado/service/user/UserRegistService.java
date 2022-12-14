package com.potato.nedonado.service.user;

import com.fasterxml.jackson.databind.DatabindException;
import com.potato.nedonado.mapper.UserMapper;
import com.potato.nedonado.model.user.UserDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.sql.SQLException;
import java.time.LocalDate;

@Log4j2
@Service
public class UserRegistService {

    @Autowired(required = false)
    private UserMapper userMapper;

    public int insertUser(UserDTO userDTO) throws SQLException {

        userDTO.setJoinDate(new Date().getTime());
        return userMapper.insertUser(userDTO);
    }
}
