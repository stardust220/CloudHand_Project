
<%@page import="java.util.Collection"%>
<%@page import="cloudhand.model.ServiceUpdate"%>
<%@page import="cloudhand.domain.Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if ("GET".equalsIgnoreCase(request.getMethod())) {%>
<jsp:include page="META-INF/subviews/header.jsp">
    <jsp:param name="banner_subtitle" value="login" />
</jsp:include>
<%} %>
<div id="article" style=height:auto>
    <%
        ServiceUpdate update = new ServiceUpdate();
        Collection<Service> list = null;
        list = update.getAll();
    %>


    <% for (Service service : list) {%>
    <div style="display:inline-block;width:250px;height:300px;overflow: auto;box-shadow: 2px 2px 2px gray;padding:5px">
        <h8><%= service.getTitle()%></h7>
            <div style="width: auto;margin:auto;">
                <br>
                <img style ="width:200px;height:200px" src ="<%= service.getPhotoUrl()%>">
            </div>
    </div>
    
<!--    <div>
        <div><b> Author: <%=service.getAuthorname()%> </b> <Span>Category: <%= service.getCategory().getName()%></Span></div>
        <div style = "font-size:small;float:left;width:60%">
            Price: <%=service.getListPrice()%><br>
        </div>
    </div>-->

    <div style="float:left;width:20px">
        <img style="width:48px" src= "images/cart.png">
    </div>
    <% }%>

</div>
<%@include  file="META-INF/subviews/footer.jsp" %>

