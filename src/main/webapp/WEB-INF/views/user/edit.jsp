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
    <td><input type="text" name="nickname" value="${loginInfo.nickname}"></td>
  </tr>
  <tr>
    <td>지역 </td>
    <td><input type="text" name="location" value="${loginInfo.location}"></td>
  </tr>
  <tr>
    <td>핸드폰 </td>
    <td><input type="text" name="phone" value="${loginInfo.phone}"></td>
  </tr>
  <tr>
    <td>생년월일 </td>
    <td>
      <input type="number" name="bYear" value="${param.bYear}">
      <input type="number" name="bMonth" value="${param.bMonth}">
      <input type="number" name="bDay" value="${param.bDay}">
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
