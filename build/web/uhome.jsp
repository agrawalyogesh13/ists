<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%!
    int test_no=0;
    // fetch testno from u<umobile> table
    
    String utable_testno_query;
    ResultSet set;
    Statement st_test_no;
    Connection con;
    %>
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
    String umobile = (String)session.getAttribute("umobile");
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
<%
    
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ISTS","root","root");

        utable_testno_query="select max(testno) from u"+umobile;
        st_test_no = con.createStatement();
        set = st_test_no.executeQuery(utable_testno_query);
        if(set.next()){
            test_no = set.getInt(1);
        }
        }
        catch(Exception e){
            out.print(e);
        }

%>
    
    <head>
        <link href="https://fonts.googleapis.com/css?family=Crimson+Text|Libre+Baskerville|PT+Sans" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style type="text/css">
                        *{
                box-sizing:border-box;
                padding: 0;
                margin: 0;
            }
            body{
                min-width: 360px;
                background: white;
                font-family: 'Libre Baskerville', serif;
                padding: 10px;
            }
            body::-webkit-scrollbar {
                width: .6em;
            }
            
            body::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            }
                    
            body::-webkit-scrollbar-thumb {
                background-color: #1aa3ff;
                outline: 1px solid slategrey;
                border-radius:20%;
            }

            .header{
                background: white;
                width: 100%;
                height: 150px;
                min-width: 340px;
                font-family: 'Crimson Text', serif;
            }
            #logo{
                height: 150px;
                width: 15%;
                float:left;
            }
            
            #logo img{
                height: 100%;
                width: 100%;
            }
            
            #udetail{
                height: 150px;
                width:85%;
                float: left;
            }
            
            #title{
                height: 100%;
                width: 70.5%;
                float: left; 
                padding: 30px 0px 0px;
            }
            
            #welcome{
                float: left;
                width: 60%;
            }
            #score{
                width:40%;
                float: left;
            }
            #score h1{
                width:45%;
                background: white;
                border:1.5px solid #1aa3ff;
                border-radius:50%;
                transition:all .5s;                
            }
            #score h1:hover{
                color:white;
                background: #1aa3ff;                
            }
            
            #nav{
                height: 100%;
                width: 29.5%;
                text-align: center;
                float: left;
            }
            .navsection{
                width: 100%;
                float: left;
                height: 50%;
                padding-top: 10px;
            }
            #navbar a{
                display: inline-block;
                margin-left: 10px;
                margin-right: 10px;
                padding: 10px;
                text-decoration: none;
                color: black;
                border: 1px solid #1aa3ff;
                transition: all .5s;
            }
            #navbar a:hover{
                color:white;
                background: #1aa3ff;
            }
            
            #history{
                width:75%;
                margin-left: 12.5%;
                margin-bottom: 10px;
                float: left;
                padding: 15px;
                max-height: 200px;
                overflow-y: scroll;
            }
            #history::-webkit-scrollbar {
                width: .3em;
            }
            
            #history::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            }
                    
            #history::-webkit-scrollbar-thumb {
                background-color: #ff6347;
                outline: 1px solid slategrey;
                border-radius:20%;
            }
               .card {
                padding: 15px;
                width:25%;
                float: left;
                font-size: 14px;
                }
                .card a{
                    text-decoration: none;
                    padding: 10px 70px;
                    border: 1px solid #ff6347;
                    color: black;
                    transition: all .5s;
                }
                .card a:hover{
                    background: #ff6347;
                    color: white;
                }
                
                #taketest{
                    text-decoration: none;
                    padding: 10px 15px;
                    border:1px solid #1aa3ff;
                    color: black;
                    transition:all .5s;
                }
                #taketest:hover{
                    background: #1aa3ff;
                    color: white;
                }
            .leftcolumn{
                width: 75%;
                float: left;
                padding: 10px;
            }
            .rightcolumn{
                width: 25%;
                float: left;
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
                     #logo,#udetail {
                            width:100%;
                            
                     }
                     #logo a img{
                         width:40%;
                         margin:auto;
                         display:table;
                     }
                     #score h1{
                         width:80%;
                         font-size:26px;
                     }
                     .card,.leftcolumn,.rightcolumn{
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
            <div id="logo">
        <a href="uhome.jsp"><img src="image\ISTS_logo.jpg" alt="ISTS Logo" /></a> 
            </div>
            
            <div id="udetail">
                <div id="title">
                    <span id="welcome">
                        <center>
                            <h1>Welcome to ISTS</h1>
                        </center>
                        
                    </span>
                    <span id="score">
                        <center>
                            <h1>Score</br><%=uscore%></h1>
                        </center>
                        
                    </span>
                </div>
                <div id="nav" >
                    <span class="navsection" style="padding-top:30px" >
                        <h3>Hi, <%=uname%></h3>
                    </span>

                    <div class="navsection" id="navbar">
                        <a href="profile">Profile</a>
                        <a href="logout">Logout</a>
                    </div>
                </div>  
                
            </div>
        </div>
        
        <!-- Header Ends Here -->
        
        <div class="clearfix" >
            
            <div id="history" style="margin-top:25px;border:2px solid #ccc" >
                <center><h1 style="font-size:1.5em;padding-bottom: 10px">Test History</h1></center>
                <%
                
                if(test_no==0){
                    %>
                    <center><h2>No Test Taken!</h2></center>
                <%
                }
                else{
                    
                    for(int i=1;i<=test_no;i++){
                        %>
                        <div class="card" >
                            <center><a href="testhistory.jsp?testno=<%=i%>" target="_blank">Test <%=i%></a></center>
                        </div>
                        <%
                    }
                }
                
                %>
            </div>
            <div id="history" style="overflow:hidden" >
                <center><a id="taketest" href="instructions.jsp">Take Test</a></center>
            </div>
        </div>
            <div class="clearfix">
            <div class="leftcolumn">
            <h3>About Us</br></br></h3>
                <p>Designed By Group of 4 Members Pursuing BE (CSE) From SVITS, INDORE.</p></br>
            
            
            <span id="names" >
            <p>PRAMIL JAIN (0802CS141078)</br>RAHUL (0802CS141081)</br>SHUBHAM AGRAWAL (0802CS141100)</br>YOGESH AGRAWAL (0802CS141119)
            </p></span>
            </div>
            <div class="rightcolumn">
            <h3>Contact Us</h3>
            <p><span id="icon" style="font-size: 22px" >&nbsp;&#9872;&nbsp;</span><span style="color:#008CBA">&nbsp;C-20, Chandra Nagar</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MR-9 Square,</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Indore-452009</span></p>
            <p><span id="icon" style="font-size: 22px" >&#x2709;&nbsp;</span><a style="text-decoration: none;color:#008CBA;" href="https://mail.google.com" target="_blank">&nbsp;portal.ists@gmail.com</a></p>
            <p><span id="icon" style="font-size: 22px" >&#x2706;&nbsp;&nbsp;</span><span style="color:#008CBA">0731-2729073</span></p>
                
            </div>
                
            </div>
            <div class="clearfix">
        <div class="footer">
            <hr style=" border: 1px solid black "></hr>
            <div class="footleft">
                <a href="https://www.facebook.com/ISTS-193128571278627" target="_blank" class="fa fa-facebook"></a>
                <a href="https://twitter.com/ISTS_Poratl" target="_blank" class="fa fa-twitter"></a>
                <a href="https://plus.google.com/u/0/109329877174882956106" target="_blank" class="fa fa-google"></a>
            </div>
            <div class="footright">
                <h3>Developed By Unity Coders</h3>
            </div>
        </div>
            
            
        </div>
        
        
    </body>

</html>
