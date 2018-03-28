<%-- 
    Document   : signup
    Created on : Feb 22, 2018, 4:00:54 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%
    //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //
        
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
        
    
<style>
body {font-family: Arial, Helvetica, sans-serif;
      min-width: 360px;
      padding: 10px;
}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password], input[type=email], input[type=number]{
    width: 100%;
    padding: 15px;
    margin: 5px 0 10px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}
p{
    color: #ff0000;
    font-size: 15px;
    padding: 0;
    margin: 0;
    margin-bottom: 10px;
    display: none;
}

input[type=text]:focus, input[type=password]:focus, input[type=email]:focus, input[type=number]:focus {
    border: 1px solid #008CBA;
}

hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

button:hover {
    opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 100%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
    width: 75%;
}

/* Clear floats */
.clearfix:after {
    content: "";
    clear: both;
    display: table;
}

#logo{
    width: 25%;
    float: left;
}
#logo a img{
    width: 100%;
    min-width: 180px;
    min-height:150px;
    display: table;
}
#signup{
    margin-left: 10%;
    float: left;
    width: 65%;
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
     #logo a {
        width:50%;
        margin:auto;
        display:table;
    }
    
}
/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media (max-width: 400px) {
    
}

</style>
</head>   

<body>
<div class="container clearfix">
    <form action="signup" onsubmit=" return checkForm()" autocomplete>
  
      <div id="logo">
          <a href="index.jsp"> <img src="image/ISTS_logo.jpg"></img></a>
      </div>
      <div id="signup">
    <h1>Sign Up</h1>
    <hr>

    <label for="utype"><b>User Type</b></label></br></br>
    <select style="width:100%;height: 25px" name="utype" required>
        <option>Student</option>
        <option>Admin</option>        
    </select>
    </br>
    </br>
    
    <label for="name"><b>Name</b></label>
    <input type="text" autofocus placeholder="Enter name" id="name" oninput="inputName()" maxlength="25" name="name" required title="Name Should Not Be Blank & Can Have Atmost 2 Spaces In between" >
    <p id="name_error" >Name can not be blank</p>

    <label for="mobile"><b>Mobile</b></label>
    <input type="text" placeholder="Enter Mobile" id="mobile" maxlength="10" name="mobile" required  title="Mobile Number Should Be 10 Digit Long" >
    <p id="mobile_error" >Only 0-9 Digits Allowed</p>
    
    <label for="email"><b>Email</b></label>
    <input type="email" placeholder="Enter Email" id="email" maxlength="35" name="email" required   title="A valid Email Id Should Be Entered" >
    <p id="email_error" >Please enter a valid email ID</p>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" id="password" maxlength="18" name="password" required autocomplete="off"  title="Password Must Be 6-16 Characters Long, with numbers and letters only" >
    <p id="password_error" >Only 0-9 Digits Allowed</p>

    <!--
    <label>
      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
    </label>
    
    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
    
    -->

    <div class="clearfix">
     <!--
     <button type="button" class="cancelbtn">Cancel</button>
     -->
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
    </hr>
    <span class="psw">Already have an account? <a href="login.jsp">Login</a></span>

      </div>
</form>
  </div>
    
    <script>
            var nameID      = document.getElementById("name");
            var mobileID    = document.getElementById("mobile");
            var emailID     = document.getElementById("email");
            var passwordID  = document.getElementById("password");
            
            
            function checkForm(){
           
            var flag=1;
            
            var name = nameID.value;
            var mobile = mobileID.value;
            var email = emailID.value;
            var password = passwordID.value;

//            var nameformat = /(^[a-zA-Z]+)*((\s){0,1})*([a-zA-Z]+)*((\s){0,1})*([a-zA-Z]$)/;
 //           var nameformat = /^[a-zA-Z][a-zA-Z ]+[a-zA-Z]$/;
            var nameformat = /^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$/
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            var mobileformat = /[0-9]{10,}/;       
            var passwordformat = new RegExp('([a-zA-Z0-9@#$%&*!_]{'+password.length+',})');
            
            //Check For Name
            if (name.match(nameformat)){
                document.getElementById("name_error").style.display = "none";
            }
            else{
                flag=0;
                document.getElementById("name_error").innerHTML = "Name Should Not Be Blank or Start/End With Space or More Than 1 Space b/w 2 Words";
                document.getElementById("name_error").style.display = "block";
             }
            //Check For Name
            //Check For mobile             
            if (mobile.match(mobileformat)){
                document.getElementById("mobile_error").style.display = "none";
            }
            else{
                flag=0;
                document.getElementById("mobile_error").innerHTML = "Mobile Number Should Contain [0-9] Digits Only & Must Be 10 Digit Long";
                document.getElementById("mobile_error").style.display = "block";
             }
            //Check For mobile             
            //Check For email             
            if (email.match(mailformat)){
                document.getElementById("email_error").style.display = "none";
            }
            else{
                flag=0;
                document.getElementById("email_error").innerHTML = "Enter A Valid Email ID";
                document.getElementById("email_error").style.display = "block";
             }
            //Check For email             
            //Check For password            
            if(password.length<6 || password.length>16){
                flag=0;
                document.getElementById("password_error").innerHTML = "Password Must Be 6-16 Characters Long";
                document.getElementById("password_error").style.display = "block";
            }
            else if(password.match(passwordformat)){
                document.getElementById("password_error").style.display = "none";
            }
            else{
                flag=0;
                document.getElementById("password_error").innerHTML = "Password Can Have Numbers, Letters and symbols Only";
                document.getElementById("password_error").style.display = "block";
            }
            //Check For password 
            
            //Final Form Validation
            if(flag==0){
                alert("There Are Some Errors In The Form");
                return false;
            }
            else{
                return true;
            }
            //Final Form Validation
        }
    </script>

</body>
</html>