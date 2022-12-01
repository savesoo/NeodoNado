package com.potato.nedonado.service.user;

import com.potato.nedonado.mapper.UserMapper;
import com.potato.nedonado.model.user.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class UserLoginService {

    @Autowired(required = false)
    private UserMapper userMapper;

    public UserDTO loginByIdPw(String userId, String userPw){

        UserDTO user = UserDTO.builder()
                .userId(userId)
                .userPw(userPw)
                .build();

        return userMapper.selectByIdAndPw(user);

    }


    // uuid로 user 정보 가져오기
    public UserDTO selectUUID(String uuid) throws SQLException {

        return userMapper.selectUserByUUID(uuid);

    }


    // idx 찾아 uuid 갱신
    public int updateUUID(String uuid, long userIdx) throws SQLException  {

        UserDTO user = UserDTO.builder()
                .uuid(uuid)
                .userIdx(userIdx)
                .build();

        return userMapper.updateUUIDtoUser(user);

    }

}
