<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
   <c:param name="content">
      <c:choose>
         <c:when test="${review !=null}">
            <h2>レビュー　詳細ページ</h2>

            <table>
               <tbody>
                  <tr>
                      <th>作品タイトル</th>
                      <td><c:out value="${review.comic.title}"/></td>
                  </tr>
                  <tr>
                      <th>投稿者</th>
                      <td><c:out value="${review.poster.name}"/></td>
                  </tr>
                  <tr>
                      <th>レビュータイトル</th>
                      <td><c:out value="${review.title}"/></td>
                  </tr>
                  <tr>
                      <th>内容</th>
                      <td>
                         <pre><c:out value="${review.content}" /></pre>
                      </td>
                  </tr>
                  <tr>
                      <th>スコア（1~5点）</th>
                      <td> <c:out value="${review.score}" />　点</td>
                  </tr>
                  <tr>
                      <th>登録日時</th>
                      <td>
                         <fmt:formatDate value="${review.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                      </td>
                  </tr>
                  <tr>
                       <th>更新日時</th>
                       <td>
                         <fmt:formatDate value="${review.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                       </td>
                  </tr>
               </tbody>
            </table>

            <c:if test="${sessionScope.login_poster.id==6}">
               <p><a href="#" onclick="confirmDestroy();">このレビューを削除する</a></p>
                  <form method="POST" action="<c:url value='/reviews/destroy' />">
                    <input type="hidden" name="_token" value="${_token}" />
                  </form>
                  <script>
                      function confirmDestroy() {
                          if(confirm("本当に削除してよろしいですか？")) {
                              document.forms[1].submit();
                        }
                    }
                </script>
             </c:if>



         </c:when>
         <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
         </c:otherwise>
      </c:choose>
      <p><a href="<c:url value="/reviews/userIndex?id=${sessionScope.poster_id.id}" />">一覧に戻る</a></p>
   </c:param>
</c:import>