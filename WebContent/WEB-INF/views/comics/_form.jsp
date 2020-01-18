<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${erros!=null}">
   <div id="flush_error">
       入力内容にエラーがあります。<br />
       <c:forEach var="error" items="${errors}">
          .<c:out value="${error}" /><br />
       </c:forEach>
   </div>
</c:if>

<label for="title">作品タイトル</label><br />
<input type="text" name="title" value="${comic.title}"/>
<br /><br />

<label for="author">作者名 ※性名がある場合間にスペースを開けてください。</label><br />
<input type="text" name="author" value="${comic.author}"/>
<br /><br />

<input type="hidden" name="_token" value="${_token}"/>
<button type="submit">登録</button>