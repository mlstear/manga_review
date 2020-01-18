<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
  <c:param name="content">
     <c:choose>
         <c:when test="${comic != null}">
                <h2> 作品情報編集ページ</h2>
                <form method="POST" action="<c:url value='/comics/update' />">
                    <c:import url="_form.jsp" />
                </form>


                <c:if test="${sessionScope.login_poster.id==6}">
                  <p><a href="#" onclick="confirmDestroy();">この作品情報を削除する</a></p>
                  <form method="POST" action="<c:url value='/comics/destroy' />">
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
     <p><a href="<c:url value='/comics/index' />">一覧に戻る</a></p>
  </c:param>
</c:import>