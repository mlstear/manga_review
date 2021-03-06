<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
   <c:param name="content">
      <c:if test="${hasError}">
         <div id="flush_error">
            名前もしくはパスワードが間違っています。
         </div>
      </c:if>
      <c:if test="${flush!=null}">
         <div id="flush_success">
           <c:out value="${flush}"></c:out>
         </div>
      </c:if>
      <div class="login-modal">
          <h2>ログイン</h2>
          <form method="POST" action="<c:url value='/login'/>">
            <label for="name">名前</label><br />
            <input type="text" name="name" value="${name}"/>
            <br /><br />

            <label for="password">パスワード</label><br />
            <input type="password" name="password" />
            <br /><br />

            <input type="hidden" name="_token" value="${_token}"/>
            <button type="submit">ログイン</button>
          </form>
       </div>

      <p><a class="new_signUp" href="<c:url value='/posters/new' />">新規登録はこちら</a></p>
      <br>
      <p>※切断されたときはページの更新をしてください。</p>
   </c:param>
</c:import>