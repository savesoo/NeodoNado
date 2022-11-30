package com.potato.newpotato.mapper;

import com.potato.newpotato.domain.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;

@Mapper
public interface UserMapper {


    int selectByUserIdAndPw(UserDTO userDTO) throws SQLException;

    int insertUser(UserDTO userDTO) throws SQLException;

    UserDTO selectUserInfo() throws SQLException;

    int editUser(UserDTO userDTO) throws SQLException;

    int deleteUser(UserDTO userDTO) throws SQLException;





}
