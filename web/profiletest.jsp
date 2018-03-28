<%-- 
    Document   : profiletest
    Created on : Mar 16, 2018, 10:48:49 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%
        
    //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //
    
    // Exclusive Code for profile test page only   
    //Authetication Code For Student, Starts Here
    //This code checks whether the user is a valid user
    //String uname = (String)session.getAttribute("uname"); Only utype is sufficient
    String utype = (String)session.getAttribute("utype");
    String uscore=  (String)session.getAttribute("uscore");
    int uexistflag=0,uflag=0;
            if(utype!=null){
                uexistflag=1;
                if(utype.equals("Admin")){
                    response.sendRedirect("ahome.jsp");
                }        
            }
                    
           if(uexistflag==0)
               response.sendRedirect("login.jsp?alerttitle=You Are Not Logged In!");
    //Authetication Code For Student, Ends Here
    
        String alerttitle=request.getParameter("alerttitle");
        String defaultalerttitle="Complete Your Profile Test";
        if(alerttitle==null){
            alerttitle=defaultalerttitle;
        }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Test</title>

         <style>
            *{
                box-sizing:border-box;
                padding: 0;
                margin: 0;
            }
            body{
                min-width: 360px;
                background: white;
                padding: 10px;
            }
            
            .header{
                background: white;
                width: 85%;
                height: 150px;
                min-width: 340px;
                float: left;
            }
            .header img{
                height: 100%;
                width: 17.65%;
                float: left;
            }
            #title{
                height: 100%;
                width: 82.35%;
                float: left;
                text-align: center;
                
            }
            #title h1{
                position: relative;
                top: 30%;
            }
            #timer{
                height: 150px;
                width: 15%;
                position: fixed;
                right: 0;
                text-align: center;
                padding-top: 40px;
            }
            #clock{
                
            }
            
            .container{
                margin-left: 15%;
                width: 70%;
                background: #f1f1f1;
                padding: 10px; 
            }
            .card {
                width: 100%;
                border-top: 5px solid #f2dede;
                border-bottom: 5px solid #f2dede;
                background-color: white;
                padding: 30px;
                margin-top: 20px;
                text-align: center;
                }
                
                #section{
                    width: 65%;
                    margin: auto;
                }
                
                #question {
                    width: 100%;
                    margin-bottom: 10px;
                }
                #question img{
                    width: 100%;
                }
                #option{
                    float: left;
                    text-align: center;
                    
                }
                
                
            .card table{
                width: 100%;
                border: 1px solid black;
            }
            td,th{
                padding: 10px;
                text-align: center;
                border: 1px solid black;
                margin: 0;
            }
            
            #btn{
                padding: 10px;
                color: #55ACEE;
                background: white;
                box-shadow: 1px 1px 1px #55ACEE;
            }
            #btn:hover{
                background: #55ACEE;
                color: white;
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
             input[type="radio"]{
                 transform: scale(2);
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
                .btn{
                    padding: 10px;
                    margin: 0px 10px;
                }
                .row{
                    border-bottom: 1px solid black;
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
    }
    input[type="radio"]{
        transform: scale(1.2);
    }
    .container{
        margin:0;
        width:100%;
        padding:0;
    }
    #section{
        width:100%;
    }
    
    #table{
        overflow-x:scroll;
    }
    #timer{
        right:5px;
    }
    
    .footer{
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
    <body oncontextmenu=" return false ">
        <input type="hidden" id="alerttitle" value="<%=alerttitle%>"></input>
        <input type="hidden" id="userscore" value="<%=uscore%>"></input>
    
        <div class="header">
            <a href="uhome.jsp"><img src="image/ISTS_logo.jpg"></a>
            <div id="title" >
            <h1>Profile Test</h1>
            </div>
        </div>
        <div id="timer">
            <h2><span id="clock">Time Left :</span></h2>
        </div>
        <div class="container">
            <form name="form" method="post" action="pCalculator">
            <!-- Question 1 -->
            <div class="card">
                <div id="section" >
                    <div id="question">
                    <img src="image/1.png"></a>
                    </div>
                    <div id="option" style="width:50%" >
                    <input type="radio" required onclick="checkSum(1)" name="radio1" value="2"></input>
                    </div>
                    <div id="option" style="width:50%">
                    <input type="radio" onclick="checkSum(1)" name="radio1" value="3"></input>
                    </div>
                </div>
            </div>
            <!-- Question 1 -->
            <!-- Question 2 -->
              <div class="card">
                  <div id="section">
                      <div id="question">
                          <img src="image/3.png"></a>
                      </div>
                      
                      <div id="option" style="width:50%" >
                              <input type="radio" required onclick="checkSum(2)" name="radio2" value="3"></input>
                      </div>
                      <div id="option" style="width:50%" >
                              <input type="radio" onclick="checkSum(2)" name="radio2" value="2"></input>
                      </div>
                      
                  </div>
              </div>
            <!-- Question 2 -->
            <!-- Question 3 -->
                <div class="card">
                    
                    <div id="section">
                        <div id="question">
                            <img src="image/ans=1.png"></img>
                        </div>
                        <div id="option" style="width:25%" >
                            <input type="radio" required onclick="checkSum(3)" name="radio3" value="4"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(3)" name="radio3" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(3)" name="radio3" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(3)" name="radio3" value="1"></input>
                      </div>  
                    </div>
                </div>
            <!-- Question 3 -->
            <!-- Question 4 -->
            <div class="card">
                    
                    <div id="section">
                        <div id="question">
                            <img src="image/ans=3.png"></img>
                        </div>
                        <div id="option" style="width:25%" >
                            <input type="radio" required onclick="checkSum(4)" name="radio4" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(4)" name="radio4" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(4)" name="radio4" value="4"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(4)" name="radio4" value="1"></input>
                      </div>  
                    </div>
                </div>
            <!-- Question 4 -->
            <!-- Question 5 -->
            <div class="card">
                    
                    <div id="section">
                        <div id="question">
                            <p>Which vowel is halfway between C and P?</p>
                        </div>
                        <div id="option" style="width:25%" >
                            <label>A</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(5)" required name="radio5" value="0"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <label>E</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(5)" name="radio5" value="2"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <label>I</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(5)" name="radio5" value="4"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <label>O</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(5)" name="radio5" value="2"></input>
                      </div>  
                    </div>
                </div>
            <!-- Question 5 -->
            <!-- Question 6 -->
            <div class="card">
                    <div id="section">
                        <div id="question">
                            <p>Add the even numbers in this list: 452, 224, 696, 8811, 45218, 54537, 88838. </br>Is the sum an even number or odd number?</p>
                        </div>
                        <div id="option" style="width:50%" >
                            <label>Even</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(6)" required name="radio6" value="4"></input>
                      </div>
                      <div id="option" style="width:50%" >
                          <label>Odd</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(6)" name="radio6" value="0"></input>
                      </div> 
                    </div>
                </div>
            <!-- Question 6 -->
            <!-- Question 7 -->
            <div class="card">
                    
                    <div id="section">
                        <div id="question">
                            <p>Jacob was 27th in line at the airport. He was also 27th from the back of the line. How many people were in line?</p>
                        </div>
                        <div id="option" style="width:25%" >
                            <label>52</label>&nbsp;&nbsp;&nbsp;<input type="radio" required onclick="checkSum(7)" name="radio7" value="0"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <label>53</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(7)" name="radio7" value="4"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <label>54</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(7)" name="radio7" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <label>55</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(7)" name="radio7" value="0"></input>
                      </div>  
                    </div>
                </div>
            <!-- Question 7 -->
            <!-- Question 8 -->
            <div class="card">
                    <div id="section">
                        <div id="question">
                            <img src="image/2.png"></img>
                        </div>
                        <div id="option" style="width:50%" >
                            <input type="radio" required onclick="checkSum(8)" name="radio8" value="3"></input>
                      </div>
                      <div id="option" style="width:50%" >
                          <input type="radio" onclick="checkSum(8)" name="radio8" value="2"></input>
                      </div> 
                    </div>
              </div>
            <!-- Question 8 -->
            <!-- Question 9 -->
            <div class="card">
                    
                    <div id="section">
                        <div id="question">
                            <img src="image/ans=2.png"></img>
                        </div>
                        <div id="option" style="width:25%" >
                            <input type="radio" required onclick="checkSum(9)" name="radio9" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(9)" name="radio9" value="4"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(9)" name="radio9" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(9)" name="radio9" value="1"></input>
                      </div>  
                    </div>
                </div>
            <!-- Question 9 -->
            <!-- Question 10 -->
            <div class="card">
                    
                    <div id="section">
                        <div id="question">
                            <img src="image/ans=4.png" ></img>
                        </div>
                        <div id="option" style="width:25%" >
                            <input type="radio" onclick="checkSum(10)" required name="radio10" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(10)" name="radio10" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(10)" name="radio10" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <input type="radio" onclick="checkSum(10)" name="radio10" value="4"></input>
                      </div>  
                    </div>
                </div>
            <!-- Question 10 -->
            <!-- Question 11 -->
            <div class="card" id="table" style="text-align:left; padding: 0px;">
                
                <table >
                    <tr>
                        <th></th>
                    <th>Strongly Disagree</th>
                    <th>Disagree</th>
                    <th>Neutral</th>
                    <th>Agree</th>
                    <th>Strongly Agree</th>
                    </tr>
                    <tr>
                        <td>
                            <label>I make friends easily.</label>
                        </td>
                        
                        <td>
                <input type="radio" required onclick="checkSum(11)" name="radio11" value="1"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(11)" name="radio11" value="1"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(11)" name="radio11" value="2"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(11)" name="radio11" value="3"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(11)" name="radio11" value="4"></input>
                            
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <label>I believe in the importance of art.</label>
                        </td>
                        
                        <td>
                            <input type="radio" required onclick="checkSum(12)" name="radio12" value="1"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(12)" name="radio12" value="1"></input>

                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(12)" name="radio12" value="2"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(12)" name="radio12" value="3"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(12)" name="radio12" value="4"></input>                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>I prefer variety to routine.</label>
                        </td>
                        
                        <td>
                <input type="radio" required onclick="checkSum(13)" name="radio13" value="1"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(13)" name="radio13" value="1"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(13)" name="radio13" value="2"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(13)" name="radio13" value="3"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(13)" name="radio13" value="4"></input>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>I like to solve complex problems.</label>
                        </td>
                        
                        <td>
                <input type="radio" onclick="checkSum(14)"  required name="radio14" value="1"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(14)" name="radio14" value="1"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(14)" name="radio14" value="2"></input>
                            
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(14)" name="radio14" value="3"></input>
                           
                        </td>
                        <td>
                <input type="radio" onclick="checkSum(14)" name="radio14" value="4"></input>
                            
                        </td>
                    </tr>
                    
                </table>
                
                </div>
            <!-- Question 11 -->
            <!-- Question 12 -->
            <div class="card">
                    
                    <div id="section">
                        <div id="question">
                            <p>The day after tomorrow will be five days after last Friday. What day is it today?</p>
                        </div>
                        <div id="option" style="width:25%" >
                            <label>Saturday</label>&nbsp;&nbsp;&nbsp;<input type="radio" required onclick="checkSum(15)" name="radio15" value="0"></input>
                      </div>
                      <div id="option" style="width:25%" >
                         <label>Sunday</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(15)" name="radio15" value="0"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <label>Monday</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(15)" name="radio15" value="2"></input>
                      </div>
                      <div id="option" style="width:25%" >
                           <label>Tuesday</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(15)" name="radio15" value="5"></input>
                      </div>  
                    </div>
                    </div>
            <!-- Question 12 -->
            <!-- Question 13 -->
            <div class="card">
                    
                    <div id="section">
                        <div id="question">
                            <p>Julie is a hair stylist. She makes $10.25 an hour, plus $6 extra for every haircut she performs. This week she worked a total of 40 hours and performed 46 haircuts. How much money did she make?</p>
                        </div>
                        <div id="option" style="width:25%" >
                            <label>686 u</label>&nbsp;&nbsp;&nbsp;<input type="radio" required onclick="checkSum(16)" name="radio16" value="6"></input>
                      </div>
                      <div id="option" style="width:25%" >
                         <label>676 u</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(16)" name="radio16" value="1"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <label>724 u</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(16)" name="radio16" value="0"></input>
                      </div>
                      <div id="option" style="width:25%" >
                           <label>692 u</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(16)" name="radio16" value="0"></input>
                      </div>  
                    </div>
            </div>
            <!-- Question 13 -->
            <!-- Question 14 -->
             <div class="card">
                    <div id="section">
                        <div id="question">
                            <p>Bill and Jerry start at the same point. Bill walks due West and Jerry walks due East for 6 meters. They turn right and walk 3 more meters. Who is closer to the North Pole?</p>
                        </div>
                        <div id="option" style="width:50%" >
                            <label>Bill</label>&nbsp;&nbsp;&nbsp;<input type="radio" required onclick="checkSum(17)" name="radio17" value="4"></input>
                      </div>
                      <div id="option" style="width:50%" >
                         <label>Jerry</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(17)" name="radio17" value="1"></input>
                      </div>  
                    </div>
             </div>
            <!-- Question 14 -->
            <!-- Question 15 -->
            <div class="card">
                    
                    <div id="section">
                        <div id="question">
                            <p>Which of these numbers is not like the others?</p>
                        </div>
                        <div id="option" style="width:25%" >
                            <label>81</label>&nbsp;&nbsp;&nbsp;<input type="radio" required onclick="checkSum(18)" name="radio18" value="0"></input>
                      </div>
                      <div id="option" style="width:25%" >
                         <label>196</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(18)" name="radio18" value="0"></input>
                      </div>
                      <div id="option" style="width:25%" >
                          <label>484</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(18)" name="radio18" value="0"></input>
                      </div>
                      <div id="option" style="width:25%" >
                           <label>675</label>&nbsp;&nbsp;&nbsp;<input type="radio" onclick="checkSum(18)" name="radio18" value="5"></input>
                      </div>  
                    </div>
             </div>
            <!-- Question 15 -->
            <!-- Question 16 -->
            <div class="card">
                    <div id="section">
                        <div id="question">
                            <img src="image/4.png" ></a>
                        </div>
                        <div id="option" style="width:33.5%" >
                            <input type="radio" required onclick="checkSum(19)" name="radio19" value="3"></input>
                      </div>
                      <div id="option" style="width:33%" >
                         <input type="radio" onclick="checkSum(19)" name="radio19" value="4"></input>
                      </div>
                      <div id="option" style="width:33.5%" >
                          <input type="radio" onclick="checkSum(19)" name="radio19" value="2"></input>
                      </div>
                    </div>
            </div>
            <!-- Question 16 -->
            <!-- Question 17 -->
            <div class="card">
                    <div id="section">
                        <div id="question">
                            <img src="image/5.png" ></img>
                        </div>
                        <div id="option" style="width:50%" >
                            <input type="radio" required onclick="checkSum(20)" name="radio20" value="3"></input>
                      </div>
                      <div id="option" style="width:50%" >
                         <input type="radio" onclick="checkSum(20)" name="radio20" value="3"></input>
                      </div>
                    </div>
            </div>
            <!-- Question 17 -->
            <div class="card" >
                <center>
                    <input id="btn" type="submit" value="Complete Test" ></input>
                </center>
            </div>
            
            </form>
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
    
    
    
    
    
        
        <!-- Alert Box Designing JS & CSS imported sheets -->
        <script src="alert/sweetalert.min.js"></script>
        <link rel="stylesheet" href="alert/sweetalert.css">
        <!-- Alert Box Designing JS & CSS imported sheets -->

        <script>
            var title = document.getElementById("alerttitle").value;
            var userscore = document.getElementById("userscore").value;
            
            var total_seconds=parseInt(900); //Duration of the test in seconds
            var c_minutes=parseInt(total_seconds/60);
            var c_seconds=parseInt(total_seconds%60);
            
            //counting no. of questions attempted, for timer, if less than 20, user have to reattempt the test
            var count= parseInt(0);
            var qAttempted = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

            
            function checkTime(){
                
                if(c_minutes<10){//Appending 0 before minutes bcz less than 10
                    if(c_seconds<10){//Appending 0 before minutes & seconds both bcz both are less than 10
                        document.getElementById("clock").innerHTML= 'Time Left </br>0'+c_minutes + ':0'+c_seconds;
                        }
                    else{//Appending 0 before minutes bcz less than 10 but not before seconds
                        document.getElementById("clock").innerHTML= 'Time Left </br>0'+c_minutes + ':'+c_seconds;
                    }
                }
                else{//Not Appending 0 before minutes bcz not less than 10
                    if(c_seconds<10){//Appending 0 before seconds if less than 10 but not before minutes
                        document.getElementById("clock").innerHTML= 'Time Left </br>'+c_minutes + ':0'+c_seconds;
                        }
                    else{//Not Appending 0 before seconds bcz not less than 10 and not before minutes
                        document.getElementById("clock").innerHTML= 'Time Left </br>'+c_minutes + ':'+c_seconds;
                    }
                    }
                    
                    if(total_seconds<0){
                        document.getElementById("clock").innerHTML= 'Time Left </br>--:--';
                        testStopConfirm();
                    }
                    else{
                        total_seconds=total_seconds-1;
                        c_minutes=parseInt(total_seconds/60);
                        c_seconds=parseInt(total_seconds%60);
                        setTimeout("checkTime()", 1000);
                    }
                }

            //Function For Alert Box When The Test Ends, Starts Here
            function testStopConfirm(){
                swal({   title: "Your Time Is Over!",   
                text: "",   
                type: "success",   
                showCancelButton: false,     
                confirmButtonColor: "#DD6B55",   
                confirmButtonText: "Proceed",   
                cancelButtonText: "No, I Am not!",   
                closeOnConfirm: false,   
                closeOnCancel: false }, 
                function(isConfirm){   
                    if (isConfirm) 
                        {
                            if(count==20){
                                document.form.submit();//Test is finally submitted here!                                
                            }
                            else{
                                title="You have not attempted all the questions!"
                                total_seconds = 900;
                                c_minutes=parseInt(total_seconds/60);
                                c_seconds=parseInt(total_seconds%60);
                                loginConfirm();
                            }
                        }
                    }
                );
            }
            //Function For Alert Box When The Test Ends, Ends Here

            
        //Function For Alert Box When The Login Page Loads, Starts Here
            function loginConfirm(){
                swal({   title: title,   
                //text: "Please Login Here",   
                type: "warning",   
                showCancelButton: true,//cancel button will become logout button     
                confirmButtonColor: "#DD6B55",
                cancelButtonColor: "blue",
                confirmButtonText: "Complete Now!",   
                cancelButtonText: "Logout!",   
                closeOnConfirm: true,   
                closeOnCancel: true }, //Logout button
                function(isConfirm){   
                    if (isConfirm) {
                        checkTime();//Clock is set, and the 1st question is displayed
                    }
                    else{
                        location.href="logout";
                    }
                    });
            }
            //Function For Alert Box When The Login Page Loads, Ends Here
            function checkTitle(){
                if(userscore!="-1"){
                    alert("You Have Completed the profile test");
                    location.href='uhome.jsp';
                }
                else{
                    loginConfirm();
                }
            }
            
            function checkSum(x){
                if(qAttempted[x-1]==0){
                    qAttempted[x-1]=1;
                    count++;
                }
            }
            checkTitle();
        </script>
        
        <script>
            
            //disabling CTRL key, f5, f12, space
        document.onkeydown = function(e) {
            if (e.ctrlKey||e.keyCode==123||e.keyCode==116||e.keyCode==32) {
                return false;
            }
            else {
                return true;
            }
        };
            //disabling CTRL key, f5, f12, space
            
        </script>
        
    </body>
</html>