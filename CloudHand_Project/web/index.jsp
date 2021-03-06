<%-- 
    Document   : index
    Created on : 2016/10/4, 下午 06:14:30
    Author     : chenqingqi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<jsp:include page="META-INF/subviews/header.jsp">
    <jsp:param name="banner_subtitle" value="login" />
</jsp:include>

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
    <%        
    %>
 
        <script type="text/javascript" src="jquery.js">
        </script>
        <script type="text/javascript">
            var linkAr = ["google", "apple", "bmw", "yahoo", "canon", "nikon"];
            var index = 0;
            var photoNum = 6;
            var setInt = setInterval(changePhotoHandler, 2000);//
            $(document).ready(init);
            function init()
            {
                for (var i = 1; i <= photoNum; i++) {
                    $(".outer").append("<img src='Image/home0" + i + ".jpg'>");
                    
                    $(".dots").append("<img src='images/light.png' class='dot'>");
                }
                $(".outer img:gt(0)").animate({"opacity": 0}, 0);
                $(".outer img").click(linkHandler);
                $(".dots").width(photoNum * 20);
                $(".dots .dot:first").attr("src", "images/dark.png");
                $(".dot").click(changePhotoHandler);
            }
            function changePhotoHandler(e) {
                // console.log($(this).index());

                if ($(this).index() != -1) {
                //for not click on dot $(this).index()=-1 (interval setting)
                    index = $(this).index();
                    clearInterval(setInt); // remove 碼表
                    setInt = setInterval(changePhotoHandler, 2000); //restart for full 2s
                } else {
                    index++;
                }
                index %= photoNum; // index 1,2,3,4.... %mod for repeat!!!!
                // console.log(index);
                $(".dots .dot").attr("src", "images/light.png");
                $(".dots .dot:eq(" + index + ")").attr("src", "images/dark.png"); // 隔開字串和本來的變數,因為javascript會自己轉換為字串
                $(".outer img").not(".outer img:eq(" + index + ")").animate({"opacity": 0}, 500); 
                //opacity for all of images except for current point
                $(".outer img:eq(" + index + ")").animate({"opacity": 1}, 500);
            }
            function linkHandler() {
                window.location.href = "http://www." + linkAr[index] + ".com";
            }
        </script>        
        
        
        <sectiton id="slide-show">
                <div class="outer">
                </div>
                <div class="dots"></div>
        </sectiton>

        
        <section id="product">
             <div class="section-product">
                 <div class="container">
                    <h2>Our <span class="bold-green">Services</span></h2>
                     <div class="row">
                         <div class="col-sm-4">
                             <p>Business</p>
                             <a href='<%= request.getContextPath() %>/product.jsp'>
                                <figure class="meal-photo">
                                    <img src="Service/business.jpg">
                                </figure>
                             </a>
                         </div>
                         <div class="col-sm-4">
                             <p>design</p>
                             <a href='<%= request.getContextPath() %>/product.jsp'>
                                <figure class="meal-photo">
                                    <img src="Service/design.jpg">
                                </figure>
                             </a>
                         </div>
                         <div class="col-sm-4">
                             <p>programming</p>
                             <a href='<%= request.getContextPath() %>/product.jsp'>
                                <figure class="meal-photo">
                                   <img src="Service/programming.jpg">
                                </figure>
                             </a>
                         </div>                     
                     </div>
                     <br>
                     <div class="row">
                         <div class="col-sm-4">
                             <p>translation</p>
                             <a href='<%= request.getContextPath() %>/product.jsp'>
                                <figure class="meal-photo">
                                   <img src="Service/translation.jpg">
                                </figure>
                             </a>
                         </div>
                         <div class="col-sm-4">
                             <p>video</p>
                             <a href='<%= request.getContextPath() %>/product.jsp'>
                                <figure class="meal-photo">
                                    <img src="Service/video.jpg"> 
                                </figure>
                             </a>
                         </div>
                         <div class="col-sm-4">
                             <p>writer</p>
                             <a href='<%= request.getContextPath() %>/product.jsp'>
                                <figure class="meal-photo">
                                <img src="Service/writer.jpg">
                                </figure>
                             </a>
                         </div>                     
                     </div>                   
                 </div>
             </div>
         </section>
        
        <section id="features">
            <div class="section-features">
                <div class="container">
                    <h2 id="title">What <span class="bold-green">we</span> do?</h2> 
                
                    <div class="row">
                        <div class="col-sm-2 square js-wp-2">
                            <hr class="green-hr">
                            <img src=Image/money.png>
                            <p>Using less 1000NTD to gain extremely great services</p>
                        </div>
                        <div class="col-sm-2 square js-wp-4">
                            <br><img src=Image/efficiency.png>
                            <p id="efficiency">On average, getting services from our websites in 2 days</p>
                        </div>
                        <div class="col-sm-2 square js-wp-4">
                             <hr class="green-hr">
                             <img src=Image/global.png>
                             <br><p>Connecting you with global environment and services</p>
                        </div>
                        <div class="col-sm-2 square js-wp-3">
                            <hr class="green-hr">
                             <img src=Image/safe.png>
                            <p>Safe trade and safe payment methods</p>
                        </div>
                    </div><!-- ROW -->
                </div><!-- CONTAINER -->
            </div><!-- SECTION-FEATURES -->
        </section> <!-- SECTION -->  
        
        
        <section id="numbers">
             <div class="section-numbers">
                 <div class="container">
                     <h2>The <span class="bold-green">numbers</span> don't lie</h2>
                     <div class="col-sm-3">
                         <div class="num">
                             <div class="num-content">
                                 <span class="counter">13,863</span>
                                 <p>services provided</p>
                             </div>
                         </div>
                     </div>
                      <div class="col-sm-3">
                         <div class="num">
                             <div class="num-content">
                                 <span class="counter">6,263</span>
                                 <p>Customers served</p>
                             </div>
                         </div>
                     </div>
                      <div class="col-sm-3">
                         <div class="num">
                             <div class="num-content">
                                 <span class="counter">2,866</span>
                                 <p>Products sold</p>
                             </div>
                         </div>
                     </div>
                      <div class="col-sm-3">
                         <div class="num">
                             <div class="num-content">
                                 <span class="counter">1,562</span>
                                 <p>organization used</p>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>  
         </section>
        
        <h2>What our customers said</h2>
        <section class="section-testimonials">
            <div class="row">
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <blockquote>
                        CloudHand is just awesome! I just launched a startup which leaves me with no time for doing so much work, so CloudHand is a life-saver. Now that I got used to it, I couldn't live without their supports!
                        <cite><img src="Image/customer-1.jpg" alt="Customer 1 photo">Alberto Duncan</cite>
                    </blockquote>
                </div>
                <div class="col-sm-4">
                    <blockquote>
                       Inexpensive, quick and great-quality services, delivered ontime. We have lots of services delivery here in US, but no one comes even close to CloudHand. Me and my family are so in love!
                        <cite><img src="Image/customer-2.jpg" alt="Customer 2 photo">Joana Silva</cite>
                    </blockquote>
                </div>
                <div class="col-sm-4">
                    <blockquote>
                        I was looking for a quick and easy serives delivery service in Taiwan. I tried a lot of them and ended up with CloudHand. Best services and supporting  in everywhere. Keep up the great work!
                    <cite><img src="Image/customer-3.jpg" alt="Customer 3 photo">Milton Chapman</cite>
                    </blockquote>
                </div>
            </div>
        </section>
       
    </body>
</html>
                                
<%@include  file="META-INF/subviews/footer.jsp" %>
