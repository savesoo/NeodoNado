<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2022-12-02
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.potato.nedonado.util.ConfigUtil" %>
<html>
<head>
    <title>${item.title}</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/slide.css"/>
    <style>
        .mySlides.fade:not(.show) { opacity: 1 !important; }
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/parts/header.jsp"%>
<main>
    <div class="container">
        <div class="container-lg themed-container text-center">
            <h2 class="mt-4">${item.title}</h2>
        </div>
        <div class="container-lg themed-container text-center">　 </div>
        <div class="container-lg themed-container text-center">　 </div>
        <div class="container-lg themed-container text-center">
            <div class=" slideshow-container">
                <c:if test="${item.imgURL == ''}">
                    <div class="mySlides fade">
                        <div class="numbertext">1 / 1</div>
                        <img src="/resources/files/default.jpg" 500 500 style="width:500px; height:500px;"/>
                        <div class="text">Caption Text</div>
                    </div>
                </c:if>
                <c:forEach items="${item.imgURL}" var="url" varStatus="status">
                    <div class="mySlides fade">
                        <img src="${ConfigUtil.getConfig("imgURL")}/${url}" 500 500 style="width:500px; height:500px;"/>
                    </div>
                </c:forEach>

                <!-- Next and previous buttons -->
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>

                <!-- The dots/circles -->
                <div style="text-align: center; margin-top:-50px;">
                    <c:forEach items="${item.imgURL}" var="url" varStatus="status">
                        <span class="dot"></span>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="container-md themed-container text-center" style="margin-top: 50px">
            <div class="col-md-12 themed-grid-col">
                <div class="row">
                    <div class="col-md-4 themed-grid-col">
                        <strong>${item.price} 원</strong>
                    </div>
                    <div class="col-md-4 themed-grid-col">
                        <strong>${item.category}</strong>
                    </div>
                    <div class="col-md-4 themed-grid-col">
                        <c:if test="${item.userIdx == loginInfo.userIdx}">
                            <input type="button" class="btn btn-outline-secondary" value="수정" id="updateItem"/>
                            <input type="button" class="btn btn-outline-danger" value="삭제" id="deleteItem"/>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="col-md-12 themed-grid-col" >
                <div class="col-md-4 themed-grid-col">
                    ${item.onSale}
                </div>
            </div>
        </div>
        <div class="container-lg themed-container text-center">
            <div class="col-md-12 themed-grid-col" >
                <p>${item.content}</p>
            </div>
        </div>
    </div>
</main>
<%@include file="../comment/comment.jsp"%>
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
<script>
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelector('#updateItem').addEventListener('click', (event)=>{
            location.href='/app/v1/item/'+${item.boardIdx} + '/'+${loginInfo.userIdx};
        });
        document.querySelector('#deleteItem').addEventListener('click', (event)=>{
            if(!confirm('게시글을 삭제 하시겠습니까?\r\n삭제한 게시글은 복구할 수 없습니다.')) return;
            axios.delete('/app/v1/item/'+${item.boardIdx})
                .then(function(response) {
                    if(response.data != '')
                        location.href = response.data;
                    else
                        alert('게시글 삭제 실패!');
                });
        });
    });
</script>
</html>
