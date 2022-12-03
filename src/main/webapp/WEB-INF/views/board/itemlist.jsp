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
        <div class="container" id="itemListDiv">
            <c:forEach items="${itemList}" var="item">
                <div class="row">
                    <a href="/app/v1/item/${item.boardIdx}">
                        <div name="item" value="${item.boardIdx}">
                            <div>
                                <c:if test="${item.thumbnail == ''}">
                                    <img src="/resources/files/default.jpg" style="width: 120px; height: 120px" />
                                </c:if>
                                <c:if test="${item.thumbnail != ''}">
                                    <img src="${ConfigUtil.getConfig("imgURL")}/thumbnail/${item.thumbnail}" />
                                </c:if>
                            </div>
                            <div>
                                ${item.title} <br/>
                                ${item.price}
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <div>
            <input type="hidden" id="lastItemIdx" value="${itemList.size() > 0 ? itemList[itemList.size()-1].boardIdx : 0}"/>
            <input type="button" id="nextItems" class="btn" value="▼"/>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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

        function makeItemRow(idx, thumbnail, title, price, writeDate) {
            return '<a href="/app/v1/item/'+idx+'">'
            +'	<div name="item" value="'+idx+'">'
            +'		<div>'
            +'			<img src="${ConfigUtil.getConfig("imgURL")}/thumbnail/'+thumbnail+'" />'
            +'		</div>'
            +'		<div>'
            +'			'+title+' <br/>'
            +'			' + price
            +'		</div>'
            +'	</div>'
            +'</a>';
        }
    </script>
</html>
