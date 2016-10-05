<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="META-INF/subviews/header.jsp">
    <jsp:param name="banner_subtitle" value="login" />
</jsp:include>
<% if ("GET".equalsIgnoreCase(request.getMethod())) {%>
<%} %>
<div id="article" style="height:450px">
   Hello
</div>    
<%@include  file="META-INF/subviews/footer.jsp" %>

