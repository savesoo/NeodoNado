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
    <title>내가 쓴 게시글</title>
</head>
<body>

  <h1>내가 작성한 게시글</h1>

  <table>
      <tr>
          <td>게시글 번호</td>
          <td>제목</td>
          <td>썸네일</td>
          <td>판매상태</td>
          <td>가격</td>
          <td>작성일</td>
      </tr>
      <c:forEach items="${myItemList}" var="mi">
      <tr>
          <td>${mi.boardIdx}</td>
          <td>${mi.title}</td>
          <td>${mi.thumbnail}</td>
          <td>${mi.onSale}</td>
          <td>${mi.price}</td>
          <td>${mi.writeDate}</td>
      </tr>
      </c:forEach>

  </table>

    <br>

  <a class="btn btn-primary col-md-6 btn-dark" href="/user/mycomment">내가 남긴 댓글</a>
  <a class="btn btn-primary col-md-6 btn-dark" href="/user/mypage">이전으로 돌아가기</a>

</body>
</html>
