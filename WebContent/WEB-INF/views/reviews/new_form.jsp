<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="review_comicTitle">作品タイトル</label><br />
<c:out value="${comic.title}" />
<br /><br />

<label for="poster">投稿者</label><br />
<c:out value="${sessionScope.login_poster.name}" />
<br /><br />

<label for="title">レビュータイトル</label><br />
<textarea name="title" rows="1" cols="40">${review.title}</textarea>
<br /><br />

<label for="content">内容</label><br />
<textarea name="content" rows="10" cols="50">${review.content}</textarea>
<br /><br />

<label for="score">スコア（1〜５点）</label><br />
<input type="number" name="score" value=0  min="1" max="5"/>
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>