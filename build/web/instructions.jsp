<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
    <%
    
    //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //
    
    //Authetication Code For Student, Starts Here
    
    String uname = (String)session.getAttribute("uname");
    String utype = (String)session.getAttribute("utype");
    String uscore=  (String)session.getAttribute("uscore");
    int uexistflag=0,uflag=0;
            if(utype!=null){
                uexistflag=1;
                if(utype.equals("Student")){
                    if("-1".equals(uscore)){
                        response.sendRedirect("profiletest.jsp?alerttitle=Complete Your Profile Test First!");
                    }
                }
                else{
                    response.sendRedirect("ahome.jsp");
                }        
            }
                    
           if(uexistflag==0)
               response.sendRedirect("login.jsp?alerttitle=You Are Not Logged In!");
    
    //Authetication Code For Student, Ends Here
    %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Instructions</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing:border-box;
            }
            body{
                background: white;
                min-width: 360px;
                padding: 10px;
            }
            .header{
                width: 100%;
                min-height: 100px;
                background: wheat;
                text-align: center;
                border: 1px solid black;
            }
            .header h1{
                position: relative;
                top: 30px;
            }
            .leftcolumn{
                border-right: 1px solid #ccc;
                margin-top: 10px;
                background: white;
                width: 50%;
                padding: 1%;
                float: left;
                min-height: 400px;
            }
            .rightcolumn{
                border-left: 1px solid #ccc;
                margin-top: 10px;
                background: white;
                width: 50%;
                padding: 1%;
                float: left;
                min-height: 400px;
            }
            .instructions{
                background: wheat;
                min-height: 350px;
                width: 100%;
                padding: 30px;
                border: 1px solid black;
                float: left;
            }
            .btn{
                background: wheat;
                 min-height: 40px;
                width: 100%;
                border: 1px solid black;
                float: left;
                text-align: center;
            }
            .btn button{
                padding: 10px;
                font-size: 14px;
                transition: linear 0.1s;
            }
            .btn button:hover{
                cursor: pointer;
                background: #008CBA;
                color: #ffffff;
            }

            .row:after{
                content: "";
                display: table;
                clear: both;
            }            
            /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media (max-width: 800px) {
    .leftcolumn, .rightcolumn {   
        width: 100%;
        padding: 0;
        border:none;
    }
    .footer{
        width:100%;
    }
    
}
            
        </style>
    </head>
    <body>
        <div class="header">
          
        <h1>Instructions</h1>  
        </div>
        <!-- Header Ends Here -->
        
        <div class="row">
          
        <div class="leftcolumn">
         <span class="instructions">
         
        <h1>Prepare</h1></br> 
        <ul>
            <li>
                <p>
                   The following test will make you prepare for the topic you have chosen by leveling up or leveling down difficulty level of question. 

                </p>
            </li>
            <li>
                <p>
                   A set of 10 questions with 4 multiple options given one by one starting with the level suggested by your current profile score.
 
                </p>
            </li>
            <li>
                <p>
                    Select the appropriate option and click submit button to go for next question.

                </p>
            </li>
            <li>
                <p>
                    Each question has a fixed timeout of 60 secs therefore the test will automatically be submitted after 10 mins.

                </p>
            </li>
            <li>
                <p>
                    Any time you can leave the test by clicking “Leave test” button.

                </p>
            </li>
            <li>
                <p>
                    Your score and detailed analysis will be automatically generated when you complete or leave the test.

                </p>
            </li>
            <li>
                <p>
                    
                </p>
            </li>
        </ul>
         </span>
        <span class="btn">
            
        <form>
        <button type="submit" formaction="prepare.jsp">Prepare</button>
        </form>
        </span>
        </div>
        
            
        <div class="rightcolumn">
            <span class="instructions">
         
        <h1>Mock</h1></br>
        <ul>
            
            <li>
                <p>
                    This test has a set of 30 questions with 4 multiple options given one by one to provide actual interface for online test.

                </p>
            </li>
            <li>
                <p>
                    Select the appropriate option and click submit button to go for next question.

                </p>
            </li>
            <li>
                <p>
                    Each question has a fixed timeout of 60 secs therefore the test will automatically be submitted after 30 mins.

                </p>
            </li>
            <li>
                <p>
                    Any time you can leave the test by clicking “Leave test” button.

                </p>
            </li>
            <li>
                <p>
                    Your score will be automatically generated when you “Submit” or leave the test.

                </p>
            </li>
        </ul>
         </span>
         <span class="btn">
        <form>
        <button type="submit" formaction="mocktest.jsp" >Mock Test</button>
        </form>
         </span>
        </div>
            <span class="btn">
                
                <center><button type="button" onclick="location.href='uhome.jsp';">Home</button>
            </span>
        </div>
        
        
        
    </body>
</html>
