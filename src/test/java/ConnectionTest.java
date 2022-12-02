import com.potato.nedonado.mapper.UserMapper;
import com.potato.nedonado.model.user.LoginInfo;
import com.potato.nedonado.model.user.UserDTO;
import com.potato.nedonado.service.user.UserDataEditService;
import com.potato.nedonado.service.user.UserMyPageReadService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.sql.DataSource;
import java.sql.SQLException;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/context/root-context.xml")
public class ConnectionTest {

    @Autowired(required = false)
    private DataSource dataSource;

    @Autowired(required = false)
    private UserMapper userMapper;

    @Autowired(required = false)
    private UserMyPageReadService service;



    @Test
    public void selectUser() throws SQLException {
        long userIdx = 2;
        service.selectUserByIdx(userIdx);
    }



    @Test
    public void deleteUserTest(){

        UserDTO user = UserDTO.builder().userId("test").build();

        int result = userMapper.deleteUser(user);

        Assertions.assertEquals(1, result);

    }

    @Test
    public void editUserTest(){

        UserDTO user = UserDTO.builder()
                .userIdx(2)
                .location("제주")
                .nickname("tangerine")
                .build();

        log.info(user);

        long result = userMapper.editUserInfo(user);

        Assertions.assertEquals(1, result);

    }

    @Test
    public void selectUserTest(){
        UserDTO user = UserDTO.builder()
                .userId("test")
                .userPw("1111")
                .build();

        userMapper.selectByIdAndPw(user);

        log.info(user);

    }

    @Test
    public void insertUserTest(){

        UserDTO user = UserDTO.builder()
                .userId("test")
                .userPw("1111")
                .joinDate(System.currentTimeMillis())
                .location("서울")
                .nickname("blue")
                .build();

        int result = userMapper.insertUser(user);

        Assertions.assertEquals(1, result);

    }


    @Test
    public void Test() {
        log.info("test");
    }

}
