<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>ISTS</title>
        <style>
            html,body
            {
                min-width: 400px;
            background: #f0f0f0;
            }
            
            *{
                box-sizing:border-box;
                margin: 0px;
                padding: 0px;
            }
            
            .header {
                height: 150px;
                background: #f2f2f2;
                position: relative;
                
            }
            .header img{
                position: absolute;
                float: left;
                width: 15%;
                height: 100%;
            }
            .header #login{
                position: absolute;
                float: right;
                font-size: 1.5vw;
                padding: 1.3vw;
                right: 20px;
                top: 46px;
                border:2px solid #ff0000;
                text-decoration: none;
                color: #000000;
                border-radius:10%;
            }
            #login:hover{
                color:white;
                background: #ff0000;
                
            }
            
            .header .head{
                position: absolute;
                float: left;
                font-size: 4.5vw;
                left: 16%;
                top: 25%;
            }
            
            .facility{
                margin: 0.8vw 0px 0.8vw 0.8vw;
                width: 23vw;
/*                border:0.1vw solid black; */
                min-height: 33vh;
                float: left;
                background: white;
                border: 1px solid black;
                
            }
            .facility h2{
                text-align: center;
                letter-spacing: .5px;
            }
            .facility p{
                padding-left: 10px;
                letter-spacing: .8px;
            }
            
            .overview{
                margin:0.8vw;
                width:73.3vw;
                border: 1px solid black;                
/*                border:0.1vw solid black; */
                float: left;
                min-height: 33vh;
                background: white;
                position: relative;
            }
            .overview h2{
                text-align: center;
                letter-spacing: .5px;
            }
            .overview p{
                padding-left: 10px;
                padding-right: 10px;
                letter-spacing: .8px;
            }
            .contact{
                margin: 0.8vw 0 0.8vw 0.8vw;
                width: 74vw;
/*                border:0.1vw solid black; */
                float: left;
                min-height: 20vh;
                background: white;
                border: 1px solid black;
            }
            .about{
                width: 23vw;
  /*              border:0.1vw solid black; */
                margin: 0.8vw 0px 0.8vw 0.8vw;
                min-height: 20vh;
                float: left;
                background: white;
                border: 1px solid black;
            }
            .btn {
                position: absolute;
                left: 38%;
                bottom: 0;
            }
            .contentbtn{
                padding: .8vw;
                display: inline-block;
                margin-bottom: 1vw;
                font-size: 1.2vw;
                border: 2px solid #008CBA;
                background: #f1f1f1;
                border-radius:10%;

            }
            .contentbtn:hover{
                cursor: pointer;
                opacity:0.8;
                color: white;
                background: #008CBA; 
            }
            .footer{
                position: relative;
                width: 98%;
                left: 1%;
                background: white;
                min-height: 9vh;
                float: left;
                margin-top: 10px;
            }
                .footleft{
                    float: left;
                    width: 70%;
                /*    border: 1px solid black;
                  */  min-height: 11vh;
                    padding-left: 20px;
               
                }
                .footright{
                    float: left;
                    width: 30%;
              /*      border: 1px solid black;
                */    min-height: 11vh;
                    
              
                }
                .footright h3{
                    position: absolute;
                    bottom: 5px;
                    right: 10px;
                    
                }
            
            .fa {
                padding: 1.5vw;
                font-size: 2vw;
                text-align: center;
                text-decoration: none;
                 margin: .6vw .2vw;
                 border-radius: 50%;
                }

            .fa:hover {
                opacity: 0.7;
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
            /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media (max-width: 800px) {
    .facility, .overview, .contact, .about {   
        width: 100%;
        padding: 0;
    }
    .footer{
        width:100%;
    }
    
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media (max-width: 400px) {
    
    
}
                
            
        </style>
    </head>
    
    <body>

        <div class="header">
             <a id="logo" href="index.jsp"><img src="image/ISTS_logo.jpg"></img></a>
             <p class="head"><i>Intelligent Skill Test System</i></p>
             <a id="login" href="login.jsp">Login</a>
        </div>
        <hr style=" border: 1px solid black; " ></hr>
        
        <!-- Header Ends Here -->
<!--        <div class="clearfix">
-->
        <div class="facility">
            <h2>Facilities</h2></br>
            <p>
•	No repeated questions to any candidate.</br>
•	User friendly interface.</br>
•	No static pages.</br>
•	Question wise analysis.</br>
•	Student preparation level wise question generation.</br>
•	Dynamic profile score for each user.</br>
•	Full mock test is also available.</br>
</p>
            </br>
        </div>
        <div class="overview">
            <h2>Overview</h2></br>
            <p>ISTS is a web-app built for students appearing in various 
                competitive exams such as CAT,GATE,GRE,etc. It focuses on the improving 
                performances  of the students, especially those who are  suffering from exam 
                phobia. It provides a platform for the students to better their performances and 
                analyze their performances in the previous attempts. It has a unique way of 
                providing questions on the basis of the level of preparation off the students. 
                Along with this it  also provides question wise analysis to the students. 
                This has a user friendly and very interactive
                UI which will help users to gain maximum profit from this web-app.
            </p>
            <span class="btn">
            <form action="taketest">
                <button type="submit" class="contentbtn" >Demo Test</button>
                <button type="submit" class="contentbtn" formaction="signup.jsp" >Sign Up</button>
            </form>
            </span>
            
        </div>
<!--        </div>
-->
        <div class="contact">Contact
        </div>
        
        <div class="about">About
        </div>

        <div class="footer">
            <hr style=" border: 1px solid black "></hr>
            <div class="footleft">
                <a href="http://www.facebook.com" target="_blank" class="fa fa-facebook"></a>
                <a href="http://www.twitter.com" target="_blank" class="fa fa-twitter"></a>
                <a href="http://www.google.com" target="_blank" class="fa fa-google"></a>
            </div>
            <div class="footright">
                <h3>Developed By Unity Coders</h3>
            </div>
        </div>
    </body>
    
</html>
