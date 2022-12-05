<%--
  Created by IntelliJ IDEA.
  User: LG
  Date: 2022-12-01
  Time: 오후 5:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
        <link rel="stylesheet" type="text/css" href="/resources/css/drop.css"/>
        <style>
            .mg-form {
                margin-top:10px;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
    <%@include file="/WEB-INF/views/parts/header.jsp"%>
    <main>
        <div class="container">
            <div class="container-lg text-center">
                <h2 class="mt-4">판매글 등록하기</h2>
            </div>
            <div class="container-lg">　 </div>
            <div class="container-lg">　 </div>
            <div class="container-lg">
                <div id="dropFileZone" class="row" draggable="true" ondragover="return false" >
                    <div id="dragUploadFile" class="col-sm-12">
                        <select class="dropFileZone col-sm-12" name="fileList" id="fileList" disabled readonly multiple size="min-width:317px">
                            <option>Drop file(s) here</option>
                        </select>
                        <div class="row">
                            <div class="col-sm-2">
                                <p><input type="button" class="btn btn-outline-secondary" value="Select File(s)" id="fileExplorer" /></p>
                                <input type="file" id="selectFile" multiple name ="selectFile" accept=".gif, .png, .jpg"/>
                            </div>
                            <div class="col-sm-10 text-sm-end text-black-50">
                                <label id="fileCnt">0</label> / 5
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-lg">　 </div>
            <div class="container-lg">　 </div>
            <input type="hidden" name="thumbnail" id="thumbnail">
            <div class="mg-form col-lg-12">
                <fieldset>
                    <div class="row form-group">
                        <div class="col-sm-2 text-lg-end"> <label for="title" class="form-label mt-sm-2">게시글 제목</label> </div>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="title" placeholder="게시글 제목을 입력하세요">
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="mg-form col-lg-12">
                <fieldset>
                    <div class="row form-group">
                        <div class="col-sm-2 text-lg-end">
                            <label for="price" class="form-label mt-sm-2">판매 가격</label>
                        </div>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="price" name="price" placeholder="판매 금액">
                        </div>
                        <div class="col-sm-2 text-lg-end">
                            <label for="price" class="form-label mt-sm-2">카테고리</label>
                        </div>
                        <div class="col-sm-3">
                            <select name="category" class="form-control form-select" id="category">
                                <c:forEach items="${itemCategory}" var="category">
                                    <option value="${category.key}">${category.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="mg-form col-lg-12">
                <fieldset>
                    <div class="row form-group">
                        <div class="col-sm-2 text-lg-end">
                            <label for="content" class="form-label mt-sm-2">내용
                                <br/>
                                <small><label id="contentByte">0</label> / 300</small>
                            </label>
                        </div>
                        <div class="col-sm-8">
                            <textarea name="content" class="form-control" id="content" rows="3" style="resize: none;"></textarea>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="mg-form col-lg-12">
                <fieldset>
                    <div class="row form-group">
                        <div class="col-sm-8"></div>
                        <div class="col-sm-2">
                            <input type="button" value="작성" id="itemSubmit" class="btn btn-outline-success" style="width: 100%; height:100%">
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </main>
        <%@include file="/WEB-INF/views/parts/footer.jsp"%>
    </body>
    <script src="/resources/js/drop.js"></script>
    <script src="/resources/js/textLenCheck.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            let bytes = 0;
            const contentArea = document.querySelector('#content');

            //글자수 처리하는 이벤트
            contentArea.addEventListener('keyup', event => { // textArea 글자수 처리
                bytes = getTextByte(contentArea.value);
                document.querySelector('#contentByte').innerText = bytes;
            });

            // submit(글작성)
            document.querySelector('#itemSubmit').addEventListener('click', (event) => {
                const title = document.querySelector('#title');
                const content = document.querySelector('#content');
                const price = document.querySelector('#price');

                if(!checkTextLenAndAlert(title, '게시글 제목', 100)
                || !checkTextLenAndAlert(content, '본문 내용', 300)
                || !checkPriceAndAlert(price)){
                    return;
                }

                let itemEntity = {
                    title: title.value,
                    content: content.value,
                    price: price.value,
                    category: category.options[category.selectedIndex].value,
                    imgURL: fileList.toString(),
                    thumbnail: document.querySelector('#thumbnail').value
                };

                axios.post('/app/v1/item', itemEntity)
                    .then(function (response) {
                        console.log(response);
                        location.href= response.data;
                    }).catch(function (error){
                        console.log(error);
                });
            });

        });
    </script>
</html>
