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
    <td>${user.userId}</td>
  </tr>
  <tr>
    <td>닉네임 </td>
    <td><input type="text" name="nickname" value="${user.nickname}"></td>
  </tr>
  <tr>
    <td>지역 </td>
    <td><input type="text" name="location" value="${user.location}"></td>
  </tr>
  <tr>
    <td>핸드폰 </td>
    <td><input type="text" name="phone" value="${user.phone}"></td>
  </tr>
  <tr>
    <td>생년월일 </td>
    <td>
      <input type="number" name="byear" value="${user.byear!=0 ? user.byear : 0}">
      <input type="number" name="bmonth" value="${user.bmonth!=0 ? user.bmonth : 0}">
      <input type="number" name="bday" value="${user.bday!=0 ? user.bday : 0}">
    </td>
  </tr>
  <tr>
    <td></td>
    <td><input type="submit" value="수정 완료"></td>
  </tr>

</table>


  </form>

  <button><a href="/user/mypage">마이페이지로 돌아가기</a></button>

</body>
</html>
