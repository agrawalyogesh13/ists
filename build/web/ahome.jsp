<!DOCTYPE html>
    <%
    //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //
    
    
    //String uname = (String)session.getAttribute("uname");
    //String utype = (String)session.getAttribute("utype");
    //int flag=0;
    //        if(uname!=null || utype!=null)
    //            if(utype.equals("Admin"))
    //                flag=1;
    //if(flag==0)
    //    response.sendRedirect("login.jsp?alerttitle=You Are Not Logged In!");
    //Authetication Code For Student, Starts Here//This code checks whether the user is a valid user//String uname = (String)session.getAttribute("uname"); Only utype is sufficient
    String utype = (String)session.getAttribute("utype");
    String uscore = (String)session.getAttribute("uscore");
    int uexistflag=0,uflag=0;
            if(utype!=null){
                uexistflag=1;
                if(utype.equals("Student")){ //if its a student, uscore will be either -1 or between 1-100 but never null
                    if("-1".equals(uscore)){
                        response.sendRedirect("profiletest.jsp");
                    }
                    else{
                        response.sendRedirect("uhome.jsp");
                    }
                }
            }
                    
           if(uexistflag==0)
               response.sendRedirect("login.jsp?alerttitle=You Are Not Logged In!");
    //Authetication Code For Student, Ends Here
    

    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <style>
            #logo{
                width: 150px;
                height: 120px;
                position: fixed;
                margin: 20px 0px 0px 20px;
            }#list{
                list-style-type: none;
                position: relative;
                height: 120px;
                float: right;
                right: 2%;
            }
            #list li{
                display: inline-block;
                
            }
            #list li #horbar{
                text-decoration: none;
                padding: 10px ;
                margin: 2px;
                color: blue;
            }
            #list li #horbar:hover{

                background-color: blue;
                color:white;
                cursor: pointer;
            }
            .clearfix:after {
                content: "";
                clear: both;
                display: table;
            }
            #qmanage
            {
                width: 100%;
                min-height: 74vh;
                border: 2px solid black;
                position: relative;
                clear:both;
            }
            
            #qmanage #frame{
                position: absolute;
                height: 83%; 
                width: 90%;
                left: 5%;
                display: none;
            }
            #list2{
                list-style-type: none;
                text-align: center;
                width: 50%;
                position: relative;
                left: 25%;
                
                
            }
            #list2 li{
                display: inline-block;
            }
            #list2 button{
                
                padding: 10px 12px;
                border-radius:10%;
                box-shadow:2px 2px 2px black;
            }
            #list2 button:hover{
                cursor: pointer;
                
            }
           
        </style>
    </head>
    <body>
        <a href="/ISTS/ahome.jsp"><img id="logo" src="image\ISTS_logo.jpg" alt="ISTS Logo" /></a>
        <ul id="list">
            <li><form action="profile">
            <!--    
            <li><h3><a href="profile">Profile</a></h3></li>
            -->
            <h3><button id="horbar" type="submit" name="utype" value="Admin">Profile</button></h3>
            </form></li>
            <li><h3><button id="horbar" type="submit" onclick="location.href='validate';")>Validate Admin</button></h3></li>
            <li><h3><button id="horbar" type="submit" onclick="location.href='logout';">Logout</button></h3></li>
           
        </ul>
        <div  id="qmanage">
            <ul id="list2">
                <a href="addquestion.jsp" target="qmanager"><li><button onclick="showFrame()" style="margin-right:5px" type="button">Add</button></li></a>
                <a href="modify.jsp" target="qmanager"><li><button onclick="showFrame()" style="margin-left:5px" type="button">Modify</button></li></a>
            </ul>
            <iframe id="frame" name="qmanager"></iframe>
        </div>
        
        <script type="text/javascript">
            
            function showFrame(){
                document.getElementById("frame").style.display = "table";
            }
        </script>
        
    </body>
</html>
