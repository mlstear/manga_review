<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
  <c:param name="content">
    <c:if test="${flush!=null}">
         <div id="flush_success">
            <c:out value="${flush}"></c:out>
         </div>
    </c:if>
    <h2>漫画レビューサイトへようこそ</h2>
    <h4>レビューを投稿したい作品が無い場合は「漫画タイトル一覧」より作品を新規追加してください。</h4><br />
  </c:param>
</c:import>