package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signup_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        ");

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
        
        
      out.write("\n");
      out.write("        \n");
      out.write("    \n");
      out.write("<style>\n");
      out.write("body {font-family: Arial, Helvetica, sans-serif;\n");
      out.write("      min-width: 360px;\n");
      out.write("      padding: 10px;\n");
      out.write("}\n");
      out.write("* {box-sizing: border-box}\n");
      out.write("\n");
      out.write("/* Full-width input fields */\n");
      out.write("input[type=text], input[type=password], input[type=email], input[type=number]{\n");
      out.write("    width: 100%;\n");
      out.write("    padding: 15px;\n");
      out.write("    margin: 5px 0 10px 0;\n");
      out.write("    display: inline-block;\n");
      out.write("    border: none;\n");
      out.write("    background: #f1f1f1;\n");
      out.write("}\n");
      out.write("p{\n");
      out.write("    color: #ff0000;\n");
      out.write("    font-size: 15px;\n");
      out.write("    padding: 0;\n");
      out.write("    margin: 0;\n");
      out.write("    margin-bottom: 10px;\n");
      out.write("    display: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write("input[type=text]:focus, input[type=password]:focus, input[type=email]:focus, input[type=number]:focus {\n");
      out.write("    border: 1px solid #008CBA;\n");
      out.write("}\n");
      out.write("\n");
      out.write("hr {\n");
      out.write("    border: 1px solid #f1f1f1;\n");
      out.write("    margin-bottom: 25px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Set a style for all buttons */\n");
      out.write("button {\n");
      out.write("    background-color: #4CAF50;\n");
      out.write("    color: white;\n");
      out.write("    padding: 14px 20px;\n");
      out.write("    margin: 8px 0;\n");
      out.write("    border: none;\n");
      out.write("    cursor: pointer;\n");
      out.write("    width: 100%;\n");
      out.write("    opacity: 0.9;\n");
      out.write("}\n");
      out.write("\n");
      out.write("button:hover {\n");
      out.write("    opacity:1;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Extra styles for the cancel button */\n");
      out.write(".cancelbtn {\n");
      out.write("    padding: 14px 20px;\n");
      out.write("    background-color: #f44336;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Float cancel and signup buttons and add an equal width */\n");
      out.write(".cancelbtn, .signupbtn {\n");
      out.write("  float: left;\n");
      out.write("  width: 100%;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Add padding to container elements */\n");
      out.write(".container {\n");
      out.write("    padding: 16px;\n");
      out.write("    width: 75%;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Clear floats */\n");
      out.write(".clearfix:after {\n");
      out.write("    content: \"\";\n");
      out.write("    clear: both;\n");
      out.write("    display: table;\n");
      out.write("}\n");
      out.write("\n");
      out.write("#logo{\n");
      out.write("    width: 25%;\n");
      out.write("    float: left;\n");
      out.write("}\n");
      out.write("#logo a img{\n");
      out.write("    width: 100%;\n");
      out.write("    min-width: 180px;\n");
      out.write("    min-height:150px;\n");
      out.write("    display: table;\n");
      out.write("}\n");
      out.write("#signup{\n");
      out.write("    margin-left: 10%;\n");
      out.write("    float: left;\n");
      out.write("    width: 65%;\n");
      out.write("}\n");
      out.write("span.psw {\n");
      out.write("    float: right;\n");
      out.write("    padding-top: 6px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */\n");
      out.write("@media (max-width: 800px) {\n");
      out.write("    .container, #logo, #signup{\n");
      out.write("        margin:0;\n");
      out.write("        width:100%;\n");
      out.write("    }\n");
      out.write("     #logo a {\n");
      out.write("        width:50%;\n");
      out.write("        margin:auto;\n");
      out.write("        display:table;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("}\n");
      out.write("/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */\n");
      out.write("@media (max-width: 400px) {\n");
      out.write("    \n");
      out.write("}\n");
      out.write("\n");
      out.write("</style>\n");
      out.write("</head>   \n");
      out.write("\n");
      out.write("<body>\n");
      out.write("<div class=\"container clearfix\">\n");
      out.write("    <form action=\"signup\" onsubmit=\" return checkForm()\" autocomplete>\n");
      out.write("  \n");
      out.write("      <div id=\"logo\">\n");
      out.write("          <a href=\"index.jsp\"> <img src=\"image/ISTS_logo.jpg\"></img></a>\n");
      out.write("      </div>\n");
      out.write("      <div id=\"signup\">\n");
      out.write("    <h1>Sign Up</h1>\n");
      out.write("    <hr>\n");
      out.write("\n");
      out.write("    <label for=\"utype\"><b>User Type</b></label></br></br>\n");
      out.write("    <select style=\"width:100%;height: 25px\" name=\"utype\" required>\n");
      out.write("        <option>Student</option>\n");
      out.write("        <option>Admin</option>        \n");
      out.write("    </select>\n");
      out.write("    </br>\n");
      out.write("    </br>\n");
      out.write("    \n");
      out.write("    <label for=\"name\"><b>Name</b></label>\n");
      out.write("    <input type=\"text\" autofocus placeholder=\"Enter name\" id=\"name\" oninput=\"inputName()\" maxlength=\"25\" name=\"name\" required title=\"Name Should Not Be Blank & Can Have Atmost 2 Spaces In between\" >\n");
      out.write("    <p id=\"name_error\" >Name can not be blank</p>\n");
      out.write("\n");
      out.write("    <label for=\"mobile\"><b>Mobile</b></label>\n");
      out.write("    <input type=\"text\" placeholder=\"Enter Mobile\" id=\"mobile\" maxlength=\"10\" name=\"mobile\" required  title=\"Mobile Number Should Be 10 Digit Long\" >\n");
      out.write("    <p id=\"mobile_error\" >Only 0-9 Digits Allowed</p>\n");
      out.write("    \n");
      out.write("    <label for=\"email\"><b>Email</b></label>\n");
      out.write("    <input type=\"email\" placeholder=\"Enter Email\" id=\"email\" maxlength=\"35\" name=\"email\" required   title=\"A valid Email Id Should Be Entered\" >\n");
      out.write("    <p id=\"email_error\" >Please enter a valid email ID</p>\n");
      out.write("\n");
      out.write("    <label for=\"password\"><b>Password</b></label>\n");
      out.write("    <input type=\"password\" placeholder=\"Enter Password\" id=\"password\" maxlength=\"18\" name=\"password\" required autocomplete=\"off\"  title=\"Password Must Be 6-16 Characters Long, with numbers and letters only\" >\n");
      out.write("    <p id=\"password_error\" >Only 0-9 Digits Allowed</p>\n");
      out.write("\n");
      out.write("    <!--\n");
      out.write("    <label>\n");
      out.write("      <input type=\"checkbox\" checked=\"checked\" name=\"remember\" style=\"margin-bottom:15px\"> Remember me\n");
      out.write("    </label>\n");
      out.write("    \n");
      out.write("    <p>By creating an account you agree to our <a href=\"#\" style=\"color:dodgerblue\">Terms & Privacy</a>.</p>\n");
      out.write("    \n");
      out.write("    -->\n");
      out.write("\n");
      out.write("    <div class=\"clearfix\">\n");
      out.write("     <!--\n");
      out.write("     <button type=\"button\" class=\"cancelbtn\">Cancel</button>\n");
      out.write("     -->\n");
      out.write("      <button type=\"submit\" class=\"signupbtn\">Sign Up</button>\n");
      out.write("    </div>\n");
      out.write("    </hr>\n");
      out.write("    <span class=\"psw\">Already have an account? <a href=\"login.jsp\">Login</a></span>\n");
      out.write("\n");
      out.write("      </div>\n");
      out.write("</form>\n");
      out.write("  </div>\n");
      out.write("    \n");
      out.write("    <script>\n");
      out.write("            var nameID      = document.getElementById(\"name\");\n");
      out.write("            var mobileID    = document.getElementById(\"mobile\");\n");
      out.write("            var emailID     = document.getElementById(\"email\");\n");
      out.write("            var passwordID  = document.getElementById(\"password\");\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            function checkForm(){\n");
      out.write("           \n");
      out.write("            var flag=1;\n");
      out.write("            \n");
      out.write("            var name = nameID.value;\n");
      out.write("            var mobile = mobileID.value;\n");
      out.write("            var email = emailID.value;\n");
      out.write("            var password = passwordID.value;\n");
      out.write("\n");
      out.write("//            var nameformat = /(^[a-zA-Z]+)*((\\s){0,1})*([a-zA-Z]+)*((\\s){0,1})*([a-zA-Z]$)/;\n");
      out.write(" //           var nameformat = /^[a-zA-Z][a-zA-Z ]+[a-zA-Z]$/;\n");
      out.write("            var nameformat = /^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$/\n");
      out.write("            var mailformat = /^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$/;\n");
      out.write("            var mobileformat = /[0-9]{10,}/;       \n");
      out.write("            var passwordformat = new RegExp('([a-zA-Z0-9@#$%&*!_]{'+password.length+',})');\n");
      out.write("            \n");
      out.write("            //Check For Name\n");
      out.write("            if (name.match(nameformat)){\n");
      out.write("                document.getElementById(\"name_error\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("            else{\n");
      out.write("                flag=0;\n");
      out.write("                document.getElementById(\"name_error\").innerHTML = \"Name Should Not Be Blank or Start/End With Space or More Than 1 Space b/w 2 Words\";\n");
      out.write("                document.getElementById(\"name_error\").style.display = \"block\";\n");
      out.write("             }\n");
      out.write("            //Check For Name\n");
      out.write("            //Check For mobile             \n");
      out.write("            if (mobile.match(mobileformat)){\n");
      out.write("                document.getElementById(\"mobile_error\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("            else{\n");
      out.write("                flag=0;\n");
      out.write("                document.getElementById(\"mobile_error\").innerHTML = \"Mobile Number Should Contain [0-9] Digits Only & Must Be 10 Digit Long\";\n");
      out.write("                document.getElementById(\"mobile_error\").style.display = \"block\";\n");
      out.write("             }\n");
      out.write("            //Check For mobile             \n");
      out.write("            //Check For email             \n");
      out.write("            if (email.match(mailformat)){\n");
      out.write("                document.getElementById(\"email_error\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("            else{\n");
      out.write("                flag=0;\n");
      out.write("                document.getElementById(\"email_error\").innerHTML = \"Enter A Valid Email ID\";\n");
      out.write("                document.getElementById(\"email_error\").style.display = \"block\";\n");
      out.write("             }\n");
      out.write("            //Check For email             \n");
      out.write("            //Check For password            \n");
      out.write("            if(password.length<6 || password.length>16){\n");
      out.write("                flag=0;\n");
      out.write("                document.getElementById(\"password_error\").innerHTML = \"Password Must Be 6-16 Characters Long\";\n");
      out.write("                document.getElementById(\"password_error\").style.display = \"block\";\n");
      out.write("            }\n");
      out.write("            else if(password.match(passwordformat)){\n");
      out.write("                document.getElementById(\"password_error\").style.display = \"none\";\n");
      out.write("            }\n");
      out.write("            else{\n");
      out.write("                flag=0;\n");
      out.write("                document.getElementById(\"password_error\").innerHTML = \"Password Can Have Numbers, Letters and symbols Only\";\n");
      out.write("                document.getElementById(\"password_error\").style.display = \"block\";\n");
      out.write("            }\n");
      out.write("            //Check For password \n");
      out.write("            \n");
      out.write("            //Final Form Validation\n");
      out.write("            if(flag==0){\n");
      out.write("                alert(\"There Are Some Errors In The Form\");\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            else{\n");
      out.write("                return true;\n");
      out.write("            }\n");
      out.write("            //Final Form Validation\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
