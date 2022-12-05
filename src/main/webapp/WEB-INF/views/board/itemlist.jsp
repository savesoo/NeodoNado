<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2022-12-01
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.potato.nedonado.util.ConfigUtil" %>
<html>
    <head>
        <title>NEODONADO SALES</title>
        <style>
            .aTag{
                text-decoration: none;
                color: #1a1e21;
            }
            .row-item {
                border: 1px solid #cccccc;
                border-radius: 10px;
                background: #f5f5f5;
                padding: 20px;
            }
            .row-img {
                border: 1px solid #cccccc;
                border-radius: 10px;
            }
            .addItem {
                position: fixed;
                right: 15px;
                bottom: 15px;
            }
        </style>
    </head>
    <body>
    <%@include file="/WEB-INF/views/parts/header.jsp"%>
        <div class="container" id="itemListDiv">
            <h2 class="mt-4">너도나도 장터</h2>
            <p>중고 물품을 사고 팔아보세요</p>
            <div class="container-lg themed-container text-center">　 </div>
            <div class="container-lg themed-container text-center">　 </div>
            <c:forEach items="${itemList}" var="item">
                <a href="/app/v1/item/${item.boardIdx}" class="aTag">
                    <div name="item" class="row mb-3 text-center row-item">
                        <div class="col-md-4 ">
                            <c:if test="${item.thumbnail == ''}">
                                <img class="row-img" src="/resources/files/default.jpg" />
                            </c:if>
                            <c:if test="${item.thumbnail != ''}">
                                <img class="row-img" src="${ConfigUtil.getConfig("imgURL")}/thumbnail/${item.thumbnail}" />
                            </c:if>
                        </div>
                        <div class="col-md-8 ">
                            <div class="pb-3">
                                <strong>${item.title}</strong>
                            </div>
                            <div class="row">
                                <div class="col-md-6 ">${item.onSale}</div>
                                <div class="col-md-6 ">${item.writeDate}</div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 "></div>
                                <div class="col-md-6 "><strong>${item.price} 원</strong></div>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
        <div class="container">
            <input type="hidden" id="lastItemIdx" value="${itemList.size() > 0 ? itemList[itemList.size()-1].boardIdx : 0}"/>
            <input type="button" id="nextItems" class="btn btn-outline-secondary" style="min-width: 100%" value="▼"/>
        </div>
        <div class="addItem col-md-1">
            <a href="/app/v1/item" class="btn btn-secondary">　+　</a>
        </div>
    </body>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            document.querySelector('#nextItems').addEventListener('click', (e) => {
                let itemIdx = document.querySelector('#lastItemIdx').value;
                axios('/app/v1/item/list/'+itemIdx)
                    .then(function(response){
                        let obj = response.data;
                        if(obj.length == 0) {
                            // 안보이게 처리
                            document.querySelector('#nextItems').style.visibility = 'hidden';
                        } else {
                            // 여기서 append 시켜줘야 함
                            let appendHtml = '';
                            let div = document.createElement('div');
                            div.setAttribute('class', 'row');
                            obj.forEach((e) => {
                                appendHtml += makeItemRow(e.boardIdx, e.thumbnail, e.title, e.price, e.writeDate);
                            });
                            div.innerHTML = appendHtml;
                            document.querySelector('#itemListDiv').appendChild(div);
                            document.querySelector('#lastItemIdx').value = obj[obj.length-1].boardIdx;
                        }
                    });
            });
        });

        function makeItemRow(idx, thumbnail, title, price, writeDate, onSale=1) {
            return '<a href="/app/v1/item/'+idx+'">'
                +'<div name="item" value="'+idx+'" class="row mb-3 text-center row-item">'
                +'	<div class="col-md-4 ">'
                +'		<img class="row-img" src="${ConfigUtil.getConfig("imgURL")}/thumbnail/'+thumbnail+'" />'
                +'	</div>'
                +'	<div class="col-md-8 ">'
                +'		<div class="pb-3">'
                +'			<strong>'+title+'</strong>'
                +'		</div>'
                +'		<div class="row">'
                +'			<div class="col-md-6 ">'+onSale+'</div>'
                +'			<div class="col-md-6 ">'+writeDate+'</div>'
                +'		</div>'
                +'		<div class="row">'
                +'			<div class="col-md-6 "></div>'
                +'			<div class="col-md-6 "><strong>'+price+' 원</strong></div>'
                +'		</div>'
                +'	</div>'
                +'</div>'
            +'</a>';
        }
    </script>
</html>
