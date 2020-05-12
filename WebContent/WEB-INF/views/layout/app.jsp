<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>漫画レビュー投稿サイト</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="<c:url value='/css/reset.css'/>">
        <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
        <link rel="stylesheet" href="<c:url value='/css/responsive.css'/>">
        <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
        <script src="<c:url value='https://code.jquery.com/jquery-3.5.1.min.js'/>"></script>
    </head>
    <body>
       <div id="wrapper">
          <div id="header">
           <div class="container headbox">
             <div id="header_menu">
                 <h1><a id="title" href="<c:url value='/' />">漫画レビュー投稿サイト</a></h1>&nbsp;&nbsp;&nbsp;
                 <c:if test="${sessionScope.login_poster !=null}">
                     <a href="<c:url value='/comics/index' />">漫画タイトル一覧</a>&nbsp;
                     <a href="<c:url value='/posters/index' />">投稿者一覧</a>&nbsp;
                 </c:if>
             </div>
               <c:if test="${sessionScope.login_poster !=null}">
                 <div class="icon">
                   <a href="#" class="fas fa-bars menu-icon"></a>
                 </div>
               </c:if>

             <c:if test="${sessionScope.login_poster !=null}">
                <div id="poster_name">
                   <c:out value="${sessionScope.login_poster.name}"/>&nbsp;さん<c:if test="${sessionScope.login_poster.id==6}">(管理者)</c:if>&nbsp;&nbsp;&nbsp;
                   <a href="<c:url value='/reviews/myIndex' />">マイページ</a>&nbsp;&nbsp;&nbsp;
                   <a class="logout" href="<c:url value='/logout' />">ログアウト</a>
                </div>
             </c:if>
            </div>
          </div>

          <div id="content">
            <div class="container mainbox">
             ${param.content}
            </div>
          </div>

          <div id="footer">
           <div class="container">
            <p>by Reo Murata.</p>
           </div>
          </div>
       </div>

       <script src="<c:url value='/JS/script.js'/>"></script>
    </body>
</html>