<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
   <c:param name="content">
      <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
      </c:if>

      <h2>投稿者 一覧</h2>
      <table id="poster_list">
         <tbody>
            <tr>
               <th>名前</th>
               <th>レビュー</th>
               <th>詳細</th>
            </tr>
            <c:forEach var="poster" items="${posters}" varStatus="status">
               <tr class="row${status.count%2}">
                  <td><c:out value="${poster.name}"/><c:if test="${poster.id==6}">(管理者)</c:if></td>
                  <td>
                     <a href="<c:url value='/reviews/userIndex?id=${poster.id}' />">このユーザーのレビューを見る</a>
                  </td>
                  <td>
                     <a href="<c:url value='/posters/show?id=${poster.id}' />">詳細を表示</a>
                  </td>
               </tr>
            </c:forEach>
         </tbody>
      </table>

      <div id="paginateion">
         (全${posters_count}件)<br />
         <c:forEach var="i" begin="1" end="${((posters_count-1)/15)+1}" step="1">
           <c:choose>
              <c:when test="${1==page}">
                 <c:out value="${i}" />&nbsp;
              </c:when>
              <c:otherwise>
                 <a href="<c:url value='/posters/index?page=${i}'/>" ><c:out value="${i}"/></a>&nbsp;
              </c:otherwise>
           </c:choose>

         </c:forEach>
      </div>
   </c:param>
</c:import>