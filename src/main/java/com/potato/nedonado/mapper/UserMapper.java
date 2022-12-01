package com.potato.nedonado.mapper;

import com.potato.nedonado.domain.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;

@Mapper
public interface UserMapper {
    String getTime();
}
