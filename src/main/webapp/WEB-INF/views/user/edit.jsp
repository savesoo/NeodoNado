<%--
  Created by IntelliJ IDEA.
  User: E495
  Date: 2022-12-01
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 정보 수정</title>
</head>
<body>


  <h1>내 정보 수정</h1>
  <form method="post">
    <table>
      <tr>
        <td>아이디 </td>
        <td>${loginInfo.userId}</td>
      </tr>
      <tr>
        <td>닉네임 </td>
        <td>${loginInfo.nickname}</td>
      </tr>
      <tr>
        <td>지역 </td>
        <td>${loginInfo.location}</td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="정보 수정"></td>
      </tr>

    </table>
  </form>

</body>
</html>
