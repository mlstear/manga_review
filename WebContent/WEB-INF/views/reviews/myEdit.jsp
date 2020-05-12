<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${review != null}">
                <h2>レビュー　編集ページ</h2>
                <form method="POST" action="<c:url value='/reviews/update' />">
                    <c:import url="edit_form.jsp" />
                </form>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
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

        <p><a href="<c:url value="/reviews/myIndex" />">マイページトップに戻る</a></p>
    </c:param>
</c:import>