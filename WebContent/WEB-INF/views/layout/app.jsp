<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>漫画レビュー投稿サイト</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
        <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
        <script src="<c:url value='https://code.jquery.com/jquery-3.5.1.min.js'/>"></script>
    </head>
    <body>
       <div id="wrapper">
          <div id="header">
             <div id="header_menu">
                 <h1><a href="<c:url value='/' />">漫画レビュー投稿サイト</a></h1>&nbsp;&nbsp;&nbsp;
                 <c:if test="${sessionScope.login_poster !=null}">
                     <a href="<c:url value='/comics/index' />">漫画タイトル一覧</a>&nbsp;
                     <a href="<c:url value='/posters/index' />">投稿者一覧</a>&nbsp;
                 </c:if>
             </div>
             <c:if test="${sessionScope.login_poster !=null}">
                <div id="poster_name">
                   <c:out value="${sessionScope.login_poster.name}"/>&nbsp;さん<c:if test="${sessionScope.login_poster.id==6}">(管理者)</c:if>&nbsp;&nbsp;&nbsp;
                   <a href="<c:url value='/reviews/myIndex' />">マイページ</a>&nbsp;&nbsp;&nbsp;
                   <a href="<c:url value='/logout' />">ログアウト</a>
                </div>
             </c:if>
          </div>
          <div id="content">
           ${param.content}
          </div>
          <div id="footer">
           by Reo Murata.
          </div>
       </div>

       <script src="<c:url value='/JS/script.js'/>"></script>
    </body>
</html>