<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<jsp:include page="navbar.jsp" flush="false">
    <jsp:param name="title" value="메인페이지"/>
</jsp:include>
<div class="content-section">
    <form action="loginAction.jsp" method="post">
        <fieldset class="form-group">
            <legend class="border-bottom mb-4">로그인 정보 입력</legend>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
            </div>
            <input type="submit" class="btn btn-primary form-control" value="로그인">
        </fieldset>
    </form>
</div>
<jsp:include page="footer.jsp" flush="false"/>
