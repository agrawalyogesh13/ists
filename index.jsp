<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="slider/slider.css">
        <title>ISTS</title>
        <style>
            html,body
            {
                min-width: 360px;
                background: white;
                padding:10px;
            
            }
            
            *{
                box-sizing:border-box;
                margin: 0px;
                padding: 0px;
            }
            
            .header {
                width: 100%;   
            }
            #logo{
                height: 150px;
                width:15%;
                float: left;
            }
            #logo img{
                width: 100%;
                height: 100%;
            }
            
            #head{
                height: 150px;
                width:65%;
                float: left;
                text-align: center;
                font-size: 50px;
            }
            #head p{
                margin-top: 5%;
            }
            #login{
                height: 150px;
                width:20%;
                float: left;
                text-align: center;
                
            }
            #login a{
                font-size: 20px;    
                text-decoration: none;
                padding:10px 20px;
                border: 2px solid #1aa3ff;
                border-radius:10%;
                position: relative;
                top: 60px;
            }
            #login a:hover{
                color:white;
                background: #1aa3ff;
            }
            .clearfix{
                margin-top: 10px;
                border-top: 2px solid #ff0000;
            }
            .facility{
                padding:10px;
                width:25%;
                float: left;
                background: white;
            }
            
            .overview{
                width:75%;
                float: left;
                background: white;
            }
            .overview_up{
                float: left;
                width: 100%;
                
            }
            .contentbtn{
                padding: 10px 30px;
                display: inline-block;
                font-size: 20px;
                border: 2px solid #008CBA;
                background: white;
                border-radius:10%;

            }
            .contentbtn:hover{
                cursor: pointer;
                opacity:0.8;
                color: white;
                background: #1aa3ff;
            }
            .about{
                width:75%;
                float: left;
                background: white;
                padding: 10px;
            }
            .contact{
                width: 25%;
                float: left;
                background: white;
                padding: 10px;
            }
            #icon:hover{
                color:#008CBA;
                cursor: pointer;
            }
            
            .footer{
                width:100%;
                background: white;
                min-height: 80px;
                float: left;
                margin-top: 10px;
            }
                .footleft{
                    float: left;
                    width: 70%;
                    min-height: 80px;
                    padding-left: 20px;
                }
                .footright{
                    float: left;
                    width: 30%;
                    min-height: 80px;
                    position: relative;
                }
                .footright h3{
                    position: absolute;
                    bottom: 5px;
                    right: 10px;
                    
                }
            
            .fa {
                padding: 20px;
                font-size: 25px;
                text-align: center;
                text-decoration: none;
                 margin: 10px 10px 0 0;
                 border-radius: 50%;
                 opacity: 0.8;
                }

            .fa:hover {
                opacity: 1;
                }

            .fa-facebook {
                background: #3B5998;
                color: white;
                }

            .fa-twitter {
                background: #55ACEE;
                color: white;
                }

            .fa-google {
                background: #dd4b39;
                color: white;
                }
            .clearfix:after{
                content: "";
                display: table;
                clear: both;
            }

                /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media (max-width: 800px) {
    
    #logo, .facility, .overview, .contact, .about {   
        width: 100%;
    }
    .facility, .contact, .about{
        padding:10px 0px;
    }
    #logo img{
        width:50%;
        height:100%;
        display:table;
        margin:auto;
    }
    #head{
        font-size:30px;
        width:70%;
    }
    
    #head p{
        margin-top: 15%;
    }
    #login{
        width:30%;
    }
    
    .w3-content{
        width:100%;
    }
    .fa{
        padding:10px;
        font-size:20px;
    }
    
    
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media (max-width: 400px) {
    
    
}
                
            
        </style>
    </head>
    
    <body>

        <div class="header clearfix">
            <span id="logo">
             <a href="index.jsp"><img src="image/ISTS_logo.jpg"></img></a>                
            </span>
            <span id="head">
                <p><i>Intelligent Skill Test System</i></p>                
            </span>
            <span id="login">
             <a href="login.jsp">Login</a>                
            </span>
        </div>
      <!--Header Ends Here -->

      
          <div class="clearfix">
              <div class="facility">
                  <div class="card">
                  <h2>Overview</h2></br>
                  <p style="text-align: justify" >Students who want to enhance their preparation level and achieve success in the future, ISTS is
the best option for them. Signup and start evaluating your performances by using our smart
web-application. It provides question suitable just for you on the basis of your profile score. All
the questions will have separate analysis along with detailed solutions.
                  </p>
                      
                  </div>
                  </br>
                  <div class="card" style="text-align: center;margin-top: 10px" >
                    <form action="taketest">
<!--                        <button type="submit" class="contentbtn" >Demo Test</button>
--> 
                   <button type="submit" class="contentbtn" formaction="signup.jsp" >Sign Up</button>
                    </form>
                      
                  </div>
            </div>
            <div class="overview">
                <div class="overview_up">
<div class="w3-content w3-section">
  <img class="mySlides w3-animate-fading" src="image/Slider_1.png" style="width:100%;height: 100%">
  <img class="mySlides w3-animate-fading" src="image/Slider_2.png" style="width:100%;height: 100%">
  <img class="mySlides w3-animate-fading" src="image/Slider_3.png" style="width:100%;height: 100%">
  <img class="mySlides w3-animate-fading" src="image/Slider_4.png" style="width:100%;height: 100%">
  <img class="mySlides w3-animate-fading" src="image/Slider_5.png" style="width:100%;height: 100%">
  <img class="mySlides w3-animate-fading" src="image/Slider_6.png" style="width:100%;height: 100%">
</div>
                </div>
            
        </div>
        
    </div>
      
<!--
<div style="height:25px" class="clearfix" >
    <h2 style="color:#ff0000;"  ><marquee behavior=scroll direction="left" scrollamount="12">This Portal Is Developed Under The Guidance of Asst. Professor Ms. Anubha Sharma</marquee></h2>
</div>
-->      
<div class="clearfix">
        <div class="about">
            <h3>About Us</br></br></h3>
                <p>Designed By Group of 4 Members Pursuing BE (CSE) From SVITS, INDORE.</p></br>
            
            
            <span id="names" >
            <p>PRAMIL JAIN (0802CS141078)</br>RAHUL (0802CS141081)</br>SHUBHAM AGRAWAL (0802CS141100)</br>YOGESH AGRAWAL (0802CS141119)
            </p></span>
            
        </div>
        
        <div class="contact">
            <h3>Contact Us</h3>
            <p><span id="icon" style="font-size: 22px" >&nbsp;&#9872;&nbsp;</span><span style="color:#008CBA">&nbsp;C-20, Chandra Nagar</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MR-9 Square,</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Indore-452009</span></p>
            <p><span id="icon" style="font-size: 22px" >&#x2709;&nbsp;</span><a style="text-decoration: none;color:#008CBA;" href="https://mail.google.com" target="_blank">&nbsp;portal.ists@gmail.com</a></p>
            <p><span id="icon" style="font-size: 22px" >&#x2706;&nbsp;&nbsp;</span><span style="color:#008CBA">0731-2729073</span></p>
        </div>
    
</div>
        <div class="footer">
            <hr style=" border: 1px solid black "></hr>
            <div class="footleft">
                <a href="https://www.facebook.com/ISTS-193128571278627" target="_blank" class="fa fa-facebook"></a>
                <a href="https://twitter.com/ISTS_Poratl" target="_blank" class="fa fa-twitter"></a>
                <a href="https://plus.google.com/u/0/109329877174882956106" target="_blank" class="fa fa-google"></a>
            </div>
            <div class="footright">
                <h3><span style="font-size: 22px" >&#169;</span>&nbsp;Developed By Unity Coders</h3>
            </div>
        </div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 5000);    
}
</script>

    </body>
    
</html>
