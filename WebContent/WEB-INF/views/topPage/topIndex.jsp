<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
  <c:param name="content">
    <c:if test="${flush!=null}">
         <div id="flush_success">
            <c:out value="${flush}"></c:out>
         </div>
    </c:if>
    <h2>最新レビュー</h2>
    <h4>レビューを投稿したい作品が無い場合は「漫画タイトル一覧」より作品を新規追加してください。</h4><br />
    <table id="review_list">
       <tbody>
          <tr>
             <th class="review_comicTitle">作品タイトル</th>
             <th class="review_Title">レビュータイトル</th>
             <th class="review_poster">投稿者</th>
             <th class="review_view">詳細</th>
             <th class="review_score">スコア</th>
          </tr>
          <c:forEach var="review" items="${reviews}" varStatus="status">
             <tr class="row${status.count%2}">
                <td class="review_comicTitle"><c:out value="${review.comic.title}"/></td>
                <td Class="review_Title">${review.title}</td>
                <td class="review_poster"><c:out value="${review.poster.name}"/></td>
                <td class="review_view"><a href="<c:url value='/reviews/show?id=${review.id}' />">レビューを見る</a></td>
                <td Class="review_Score">${review.score}</td>
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
  </c:param>
</c:import>