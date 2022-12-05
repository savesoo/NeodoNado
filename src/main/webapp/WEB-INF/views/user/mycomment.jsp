<%--
  Created by IntelliJ IDEA.
  User: E495
  Date: 2022-12-05
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>내가 쓴 댓글</title>
</head>
<body>

  <h1>My Comments</h1>

  <table>

      <tr>
        <td>댓글 번호</td>
        <td>게시글 번호</td>
        <td>닉네임</td>
        <td>내용</td>
        <td>작성일</td>
      </tr>

      <c:forEach items="${myCommentList}" var="mc">
      <tr>
        <td>${mc.commentIdx}</td>
        <td>${mc.boardIdx}</td>
        <td>${mc.nickname}</td>
        <td>${mc.content}</td>
        <td>${mc.writeDate}</td>
      </tr>
      </c:forEach>

  </table>

    <br>

  <a class="btn btn-primary col-md-6 btn-dark" href="/user/myitemlist">내가 남긴 게시글</a>
  <a class="btn btn-primary col-md-6 btn-dark" href="/user/mypage">이전으로 돌아가기</a>

</body>
</html>
