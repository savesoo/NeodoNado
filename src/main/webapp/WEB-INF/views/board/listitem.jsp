<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2022-12-01
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
      <title>NEODONADO SALES</title>
  </head>
  <body>
      <table>
          <c:forEach items="${itemList}" var="item">
              <tr>
                  <td>${item.title}</td>
              </tr>
          </c:forEach>
      </table>
  </body>
</html>
