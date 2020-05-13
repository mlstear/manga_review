<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
   <c:param name="content">
      <h2>新規アカウント<span>登録ページ</span></h2>

      <form method="POST" action="<c:url value='/posters/create'/>">
        <c:import url="_form.jsp"/>
      </form><br>
      <a href="<c:url value='/login'/>" >ログイン画面に戻る</a>
      <br>
   </c:param>

</c:import>