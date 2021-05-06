<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="dto.BbsDTO" %>
<%@ page import="dao.BbsDAO" %>
<%@ page import="java.util.ArrayList" %>
<jsp:include page="navbar.jsp" flush="false">
  <jsp:param name="title" value="메인페이지"/>
</jsp:include>
<%
  String userID = null;
  if (session.getAttribute("userID") != null){
    userID = (String) session.getAttribute("userID");
  }
  int pageNumber = 1;
  if(request.getParameter("pageNumber") != null){
    pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
  }
%>

<div class="container">
  <%
    BbsDAO bbsDAO = new BbsDAO();
    ArrayList<BbsDTO> list = bbsDAO.getList(pageNumber);
    for(int i=0;i<list.size();i++){
  %>
    <article class="media content-section">
      <img src="static/profile_pics/test1.JPG" alt="default_profile" class="rounded-circle article-img">
      <div class="media-body">
      <div class="article-metadata">
        <a href="" class="mr-2"><%= list.get(i).getUserID() %></a>
        <small class="text-muted"><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13)
                + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></small>
      </div>
      <h2 class="article-title"><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></h2>
      <p class="article-content"><%= list.get(i).getBbsContent() %></p>
      </div>
    </article>
  <%
    }
    if(pageNumber != 1){
  %>
  <a href="index.jsp?pageNumber=<%= pageNumber -1%>" class="btn btn-success btn-arrow-left">이전</a>
  <%
    }
    if(bbsDAO.nextPage(pageNumber + 1)){
  %>
  <a href="index.jsp?pageNumber=<%= pageNumber +1%>" class="btn btn-success btn-arrow-right">다음</a>
  <%
    }
  %>
  <a href="write.jsp" class="btn btn-primary pull-right m-4">글쓰기</a>
</div>
<span>ㅋㅋ</span>
<jsp:include page="footer.jsp" flush="false"/>
