<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
   <c:param name="content">
      <c:choose>
         <c:when test="${login_poster !=null}">
            <h2>${login_poster.name} さんの登録情報　詳細ページ</h2>

            <table>
               <tbody>
                  <tr>
                     <th>名前</th>
                     <td><c:out value="${login_poster.name}"/><c:if test="${login_poster.id==6}">(管理者)</c:if></td>
                  </tr>
                  <tr>
                     <th>登録日時</th>
                     <td>
                       <fmt:formatDate value="${login_poster.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/>
                     </td>
                  </tr>
                  <tr>
                     <th>更新日時</th>
                     <td>
                       <fmt:formatDate value="${login_poster.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                     </td>
                  </tr>
               </tbody>
            </table>
               <p><a href="<c:url value='/posters/myEdit' />">登録情報を編集する</a></p>
         </c:when>
         <c:otherwise>
            <h2>お探しのデータは見つかりませんでした。</h2>
         </c:otherwise>
      </c:choose>

      <p><a href="<c:url value='/reviews/myIndex' />">マイページトップに戻る</a></p>
   </c:param>
</c:import>