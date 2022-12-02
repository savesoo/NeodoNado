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
    <title>My Page</title>
</head>
<body>

    <h1>마이페이지</h1>

        <table>
            <c:if test="${loginInfo != null}">
            <tr>
                <td>내 가입날짜 </td>
                <td>${user.joinDate}</td>
            </tr>
            <tr>
                <td>아이디 </td>
                <td><input type="text" name="userId" value="${user.userId}" readonly></td>
            </tr>
            <tr>
                <td>닉네임 </td>
                <td><input type="text" name="nickname" value="${user.nickname}" readonly></td>
            </tr>
            <tr>
                <td>지역 </td>
                <td><input type="text" name="location" value="${user.location}" readonly></td>
            </tr>
            </c:if>
        </table>

    <form action="/user/edit">
        <input type="submit" value="내 정보 수정">
    </form>

    <button><a href="#">내가 작성한 글</a></button>
    <button><a href="/board/saleList">이전 화면으로</a></button>
    <br>

    <form>
        <input type="submit" value="회원 탈퇴">
    </form>
    <form action="/user/logout">
        <input type="submit" value="로그아웃">
    </form>


</body>
</html>
