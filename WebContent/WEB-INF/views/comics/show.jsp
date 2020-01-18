<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app.jsp">
   <c:param name="content">
      <c:choose>
         <c:when test="${comic !=null}">
            <h2>${comic.title} の詳細ページ</h2>

            <table>
              <tbody>
                 <tr>
                    <th>作品タイトル</th>
                    <td><c:out value="${comic.title}"/></td>
                 </tr>
                 <tr>
                    <th>作者名</th>
                    <td><c:out value="${comic.author}"/></td>
                 </tr>
                 <tr>
                    <th>登録日時</th>
                     <td>
                        <fmt:formatDate value="${comic.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                     </td>
                 </tr>
                 <tr>
                    <th>更新日時</th>
                     <td>
                        <fmt:formatDate value="${comic.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                     </td>
                 </tr>
              </tbody>
            </table>

            <p><a href="<c:url value='/comics/edit?id=${comic.id}' />">この作品情報を編集する</a></p>
         </c:when>
         <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
         </c:otherwise>
      </c:choose>
      <p><a href="<c:url value='/comics/index' />">一覧に戻る</a></p>
   </c:param>
</c:import>