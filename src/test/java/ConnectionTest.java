import com.potato.nedonado.mapper.UserMapper;
import com.potato.nedonado.model.user.UserDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import javax.sql.DataSource;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/context/root-context.xml")
public class ConnectionTest {

    @Autowired(required = false)
    private DataSource dataSource;

    @Autowired(required = false)
    private UserMapper userMapper;

    @Test
    public void deleteUserTest(){

        UserDTO user = UserDTO.builder().userId("test").build();

        int result = userMapper.deleteUser(user);

        Assertions.assertEquals(1, result);

    }

    @Test
    public void editUserTest(){

        UserDTO user = UserDTO.builder()
                .location("제주")
                .nickname("tangerine")
                .userId("test")
                .build();

        log.info(user);

        int result = userMapper.editUserInfo(user);

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
