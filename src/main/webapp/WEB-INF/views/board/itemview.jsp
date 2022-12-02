<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2022-12-02
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.potato.nedonado.util.ConfigUtil" %>
<html>
<head>
    <title>${item.title}</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/slide.css"/>
</head>
<body>
<table>
    <tr>
        <td colspan="2">
            <div class="slideshow-container">
                <c:if test="${item.imgURL == ''}">
                    <div class="mySlides fade">
                        <div class="numbertext">1 / 1</div>
                        <img src="/resources/files/default.jpg"/>
                        <div class="text">Caption Text</div>
                    </div>
                </c:if>
                <c:forEach items="${item.imgURL}" var="url" varStatus="status">
                    <div class="mySlides fade">
                        <div class="numbertext">${status.count} / 3</div>
                        <img src="${ConfigUtil.getConfig("imgURL")}/${url}" 500 500 style="width:500px; height:500px;"/>
                            <%--<div class="text">Caption Text</div>--%>
                    </div>
                </c:forEach>

                <!-- Next and previous buttons -->
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>

                <!-- The dots/circles -->
                <div style="text-align: center; margin-top:-50px;">
                    <c:forEach items="${item.imgURL}" var="url" varStatus="status">
                        <span class="dot" onclick="currentSlide(${status.count})"></span>
                    </c:forEach>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2">　</td>
    </tr>
    <tr>
        <td colspan="2">${item.title}</td>
    </tr>
    <tr>
        <td>${item.onSale} / ${item.category}</td>
        <td>${item.price}</td>
    </tr>
    <tr>
        <td colspan="2">${item.content}</td>
    </tr>
</table>

</body>
<script>
    let slideIndex = 1;
    showSlides(slideIndex);

    // Next/previous controls
    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    // Thumbnail image controls
    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");
        if (n > slides.length) {slideIndex = 1}
        if (n < 1) {slideIndex = slides.length}
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
    }
</script>
</html>
