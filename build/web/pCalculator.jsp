<%-- 
    Document   : pCalculator
    Created on : Mar 22, 2018, 5:49:11 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    String umobile=  (String)session.getAttribute("umobile");
    int uexistflag=0,uflag=0;
            if(utype!=null){
                uexistflag=1;
                if(utype.equals("Student")){}
                else{
                    response.sendRedirect("ahome.jsp");
                }        
            }
                    
           if(uexistflag==0)
               response.sendRedirect("login.jsp?alerttitle=You Are Not Logged In!");
    
    //Authetication Code For Student, Ends Here

%>    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Complete</title>
    </head>
    <body>
        
        <!-- Alert Box Designing JS & CSS imported sheets -->
    <script src="alert/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/sweetalert.css">
        <!-- Alert Box Designing JS & CSS imported sheets -->
        <script>
            
        //Function For Alert Box When The Login Page Loads, Starts Here
            function testComplete(){
                swal({   title: "Congratulations",   
                text: "You Have Completed The Profile Test",   
                type: "success",   
                showCancelButton: false,//cancel button is not displayed     
                confirmButtonColor: "#DD6B55",   
                confirmButtonText: "Proceed!",   
                //cancelButtonText: "No, I Am not!",   
                closeOnConfirm: true,   
                closeOnCancel: false }, //no cancel button
                function(isConfirm){   
                    if (isConfirm) {
                        //task to perform when user clicks on confirm button
                        location.href="uhome.jsp";
                    }
                    });
            }
            //Function For Alert Box When The Login Page Loads, Ends Here
            
            testComplete();
        </script>    

        
    </body>
</html>
