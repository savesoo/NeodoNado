<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2022-12-01
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.potato.nedonado.util.ConfigUtil" %>
<html>
    <head>
        <title>NEODONADO SALES</title>
    </head>
    <body>
        <div class="container">
            <c:forEach items="${itemList}" var="item">
                <a href="/board/view/${item.boardIdx}">
                <div name="item" value="${item.boardIdx}">
                    <div>
                        <img src="${ConfigUtil.getConfig("imgURL")}/thumbnail/${item.thumbnail}" />
                    </div>
                    <div>
                        ${item.title} <br/>
                        ${item.price}
                    </div>
                </div>
                </a>
            </c:forEach>
        </div>
    </body>
    <script>
    </script>
</html>
