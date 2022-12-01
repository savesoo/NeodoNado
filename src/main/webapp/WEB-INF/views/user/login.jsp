<%--
  Created by IntelliJ IDEA.
  User: E495
  Date: 2022-12-01
  Time: 오후 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>로그인 페이지</title>
</head>
<body>

    <h1>로그인 페이지</h1>
    <form method="post">

        <table>
            <tr>
                <td>아이디 </td>
                <td> <input type="text" name="userId"></td>
            </tr>
            <tr>
                <td>비밀번호 </td>
                <td><input type="password" name="userPw"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="로그인">
                    <button><a href="/user/register">회원 가입</a></button>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="checkbox" name="rememberMe"> 다음부터 자동로그인</td>
            </tr>
        </table>

    </form>

    <c:if test="${loginFailMsg ne null}">
        <script>
            alert('${loginFailMsg}');
        </script>
    </c:if>

    <c:if test="${regMsg ne null}">
        <script>
            alert('${regMsg}');
        </script>
    </c:if>

</body>
</html>
