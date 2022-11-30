package com.potato.newpotato.mapper;

import com.potato.newpotato.domain.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.sql.SQLException;
import java.util.List;

@Mapper
public interface BoardMapper {

    int insertBoard() throws SQLException;

    int updateBoard() throws SQLException;

    int deleteBoard() throws SQLException;

    List<BoardDTO> selectAllBoard() throws SQLException;

    BoardDTO checkAuth(int boardid) throws SQLException;



}
