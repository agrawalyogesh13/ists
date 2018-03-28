<%-- 
    Document   : modify
    Created on : Feb 22, 2018, 8:15:52 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    
    String alerttitle=request.getParameter("alerttitle");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Question</title>
        
        <style>
            *{
                box-sizing:border-box;
                padding: 0;
                margin: 0;
            }
            body{
                min-width: 420px;
            }
            
            .leftcolumn{
                width:20%;
                margin:10% auto 0 auto;
                text-align: center;
            }
            #qid{
                padding: 10px;
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
}
        </style>
        
    </head>
    <body>
        <div class="leftcolumn">
            <form action="modifyquestion.jsp" name="form">
                <input type="text" required placeholder="Enter QID here" maxlength="20" oninput="qidCaps()" id="qid" name="qid"></input></br></br>
            <input type="submit" value="Search" ></input>
                <input type="hidden" id="alerttitle" value="<%=alerttitle%>"></input>
            </form>
        </div>
        
        <script>
            var qid = document.getElementById("qid");
            
            function qidCaps(){
                var questionID = qid.value.toString().toUpperCase();
                qid.value=questionID;
            }
        </script>

        <!-- Alert Box Designing JS & CSS imported sheets -->
    <script src="alert/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/sweetalert.css">
        <!-- Alert Box Designing JS & CSS imported sheets -->
<script>
            var title = document.getElementById("alerttitle").value;
        //Function For Alert Box When The Login Page Loads, Starts Here
            function modifyConfirm(){
                swal({   title: title,   
                //text: "Please Login Here",   
                type: "warning",   
                showCancelButton: false,//cancel button is not displayed     
                confirmButtonColor: "#DD6B55",   
                confirmButtonText: "OKAY!",   
                //cancelButtonText: "No, I Am not!",   
                closeOnConfirm: true,   
                closeOnCancel: false }, //no cancel button
                function(isConfirm){   
                    if (isConfirm) {
                        //task to perform when user clicks on confirm button
                        
                    }
                    });
            }
            //Function For Alert Box When The Login Page Loads, Ends Here
            function checkTitle(){
                if(title!="null"){
                    modifyConfirm();
                }
            }
            checkTitle();
        </script>

    </body>
</html>
