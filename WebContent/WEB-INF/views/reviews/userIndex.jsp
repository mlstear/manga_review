<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
  <c:param name="content">
    <c:if test="${flush!=null}">
         <div id="flush_success">
            <c:out value="${flush}"></c:out>
         </div>
    </c:if>
    <h2><c:out value="${posterName}" /> さんのレビュー</h2>

    <table id="review_list">
       <tbody>
          <tr>
             <th class="review_comicTitle">作品タイトル</th>
             <th class="review_poster">投稿者</th>
             <th class="review_Title">レビュー詳細</th>
             <th class="review_score">スコア（1~5点）</th>
             <th class="review_updateTime">登録日時</th>
          </tr>
          <c:forEach var="review" items="${reviews}" varStatus="status">
             <tr class="row${status.count%2}">
                <td class="review_comicTitle"><c:out value="${review.comic.title}"/></td>
                <td class="review_poster"><c:out value="${review.poster.name}"/></td>
                <td Class="review_Title"><a href="<c:url value='/reviews/userShow?id=${review.id}' />">${review.title}</a></td>
                <td Class="review_Score">${review.score}点</td>
                <td class="review_updateTime"><fmt:formatDate value="${review.created_at}" pattern="yyyy-MM-dd HH:mm" /></td>
             </tr>
          </c:forEach>
       </tbody>
    </table>
     <div id="pagination">
            （全 ${reviews_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((reviews_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/index.html?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
       </div>
       <p><a href="<c:url value='/posters/index' />">投稿者一覧に戻る</a></p>
  </c:param>
</c:import>