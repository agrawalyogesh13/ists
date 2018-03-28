<%-- 
    Document   : login
    Created on : Feb 22, 2018, 3:31:02 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%
    //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //
    
    String alerttitle=request.getParameter("alerttitle");
    
    // Checking whether user is already logged in
    String uexisttype = (String)session.getAttribute("utype");
    
    if(uexisttype!=null){                        //whether user exists, if yes, then utype must be set
        if(uexisttype.equals("Admin")){         //if the existing user is admin, redirecting to ahome.jsp
            response.sendRedirect("ahome.jsp");
        }
        else {
            response.sendRedirect("uhome.jsp");
        }
    }
    // Checking whether user is already logged in
    
    %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"  />
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
    min-width: 320px;
    padding: 10px;
}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 22%;
    height: 200px;
}

.container {
    width: 50%;
    margin: auto;
}

span.psw {
    float: right;
    padding-top: 6px;
}
/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media (max-width: 800px) {
    .container, #logo, #signup{
        margin:0;
        width:100%;
    }
     .imgcontainer {
        width:100%;
        margin:auto;
        display:table;
    }
    img.avatar{
        width:50%;
    }
    span.psw {
       display: block;
       float: right;
       margin-right:10px;
    }
    form {border: none;}

    
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
</head>
<body >

<form action="login" method="post">
    <div class="imgcontainer" >
      <a href="index.jsp"><img src="image/ISTS_logo.jpg" alt="ISTS" class="avatar"></a>
  </div>

  <div class="container">
      
    <label for="utype"><b>User Type</b></label></br></br>
    <select style="width:100%;height: 25px" name="utype" required>
        <option>Student</option>
        <option>Admin</option>        
    </select>
    </br>
    </br>
    <label for="uname"><b>E-mail or Mobile</b></label>
    <input type="text" placeholder="E-mail or Mobile" name="uname" required>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <button type="submit">Login</button>
    
    <input type="hidden" id="alerttitle" value="<%=alerttitle%>"></input>
<!--    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
-->

  
<!--
  <div class="container" style="background-color:#f1f1f1">
    
      <button type="button" class="cancelbtn">Cancel</button>
    
    <span class="psw">Don't have an account? <a href="signup.jsp">Signup</a></span>
  </div>
-->
<span class="psw">Don't have an account? <a href="signup.jsp">Signup</a></span>
</div>
</form>

<!--          <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>

 
        <!-- Alert Box Designing JS & CSS imported sheets -->
    <script src="alert/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/sweetalert.css">
        <!-- Alert Box Designing JS & CSS imported sheets -->
<script>
            var title = document.getElementById("alerttitle").value;
        //Function For Alert Box When The Login Page Loads, Starts Here
            function loginConfirm(){
                swal({   title: title,   
                //text: "Please Login Here",   
                type: "warning",   
                showCancelButton: false,//cancel button is not displayed     
                confirmButtonColor: "#DD6B55",   
                confirmButtonText: "Login Here!",   
                //cancelButtonText: "No, I Am not!",   
                closeOnConfirm: true,   
                closeOnCancel: false }, //no cancel button
                function(isConfirm){   
                    if (isConfirm) {
                        //task to perform when user clicks on confirm button
                        location.href="login.jsp";
                    }
                    });
            }
            //Function For Alert Box When The Login Page Loads, Ends Here
            
            function checkTitle(){
                if(title!="null"){
                    loginConfirm();
                }
            }
            checkTitle();
        </script>
</body>
</html>
