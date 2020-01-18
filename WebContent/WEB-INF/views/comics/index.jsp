<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
  <c:param name="content">
     <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
     </c:if>
     <h2>漫画タイトル　一覧</h2>
     <table id="comic_list">
            <tbody>
                <tr>
                    <th class="cimic_title">作品タイトル</th>
                    <th class="cimic_review">レビュー</th>
                    <th class="comic_action">レビュー作成</th>
                </tr>
                <c:forEach var="comic" items="${comics}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="cimic_title"><a href="<c:url value='/comics/show?id=${comic.id}' />"><c:out value="${comic.title}" /></a></td>
                        <td class="cimic_review"> <a href="<c:url value='/reviews/onlyIndex?id=${comic.id}' />">この作品のレビューを見る</a></td>
                        <td class="comic_action"><a href="<c:url value='/reviews/edti?id=${comic.id}' />">レビューを書く</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            (全${comics_count}件)<br />
            <c:forEach var="i" begin="1" end="${((comics_count - 1) / 15) + 1}" step="1">
               <c:choose>
                  <c:when test="${i==page}">
                      <c:out value="${i}"/>&nbsp;
                  </c:when>
                  <c:otherwise>
                      <a href="<c:url value='/comics/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                  </c:otherwise>
               </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/comics/new' />">新規タイトルの登録</a></p>
  </c:param>
</c:import>