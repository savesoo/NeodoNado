<%--
  Created by IntelliJ IDEA.
  User: E495
  Date: 2022-11-30
  Time: 오후 6:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>회원 가입</title>
</head>
<body>

    <h1>회원 가입</h1>
    <form method="post">

        <table>
            <tr>
                <td>아이디 </td>
                <td><input type="text" name="userId" placeholder="아이디 입력"></td>
            </tr>
            <tr>
                <td>비밀번호 </td>
                <td><input type="password" name="userPw" placeholder="비밀번호 입력"></td>
            </tr>
            <tr>
                <td>닉네임 </td>
                <td><input type="text" name="nickname"></td>
            </tr>
            <tr>
                <td>거주 지역 </td>
                <td><input type="text" name="location"></td>
            </tr>
            <tr>
                <td>생일 </td>
                <td>
                    <input type="number" name="bYear" placeholder="년도">
                    <input type="number" name="bMonth" placeholder="월">
                    <input type="number" name="bDay" placeholder="날짜">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="reset">
                    <input type="submit" value="회원 가입">
                </td>
            </tr>
        </table>

    </form>

</body>
</html>
