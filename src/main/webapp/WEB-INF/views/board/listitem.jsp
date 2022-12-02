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
      <table>
          <c:forEach items="${itemList}" var="item">
              <a href="/board/vier/${item.boardIdx}">
                  <tr>
                      <td rowspan="3">
                          <img src="${ConfigUtil.getConfig("imgURL")}/thumbnail/${item.thumbnail}" />
                      </td>
                      <td></td>
                  </tr>
                  <tr>
                      <td>${item.title}</td>
                  </tr>
                  <tr>
                      <td>${item.price}</td>
                  </tr>
              </a>
          </c:forEach>
      </table>
  </body>
</html>
