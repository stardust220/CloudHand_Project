<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="css/animate.css">
        <link rel="stylesheet"  type="text/css" href="css/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="<%= request.getContextPath() %>/js/jquery.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>                      
    </head>
    <body>
        <nav class="navbar navbar-dark bg-inverse navbar-full" id="main-nav">
            <img id="logo" src="CloudHand.png">
            <a class="navbar-brand" >Cloud<span >Hand</span></a>
            <ul class="nav navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="../../cloudhand/index.jsp">Home</a>
                </li> 
                <li class="nav-item">
                    <a class="nav-link" href="#features">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#timeline">Timeline</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="#ContactUs">Contact us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Category">Category</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href='<%= request.getContextPath() %>/product.jsp'>Products</a>
                </li>
 
                
                <li class="nav-item" >
                    <a class="nav-link" id="register" href='<%= request.getContextPath() %>/register.jsp'>Register</a>
                </li>
                <li class="nav-item" >
                    <a class="nav-link" id="login" href='<%= request.getContextPath() %>/login.jsp'>Login</a>
                </li> 
            </ul>

            <form class="form-inline pull-xs-right">
                <input class="form-control" type="text" placeholder="Search">
                <button class="btn btn-success-outline" type="submit">Search</button>
            </form> 
        </nav>
    </body>    
        
        
       