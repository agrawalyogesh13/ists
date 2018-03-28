package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class uhome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    ");

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
    
    
      out.write("\n");
      out.write("    \n");
      out.write("    <head>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        \n");
      out.write("        <style type=\"text/css\">\n");
      out.write("                        *{\n");
      out.write("                box-sizing:border-box;\n");
      out.write("                padding: 0;\n");
      out.write("                margin: 0;\n");
      out.write("            }\n");
      out.write("            body{\n");
      out.write("                min-width: 420px;\n");
      out.write("                background: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header{\n");
      out.write("                background: white;\n");
      out.write("                width: 100%;\n");
      out.write("                height: 150px;\n");
      out.write("                min-width: 400px;\n");
      out.write("            }\n");
      out.write("            #logo{\n");
      out.write("                height: 150px;\n");
      out.write("                width: 15%;\n");
      out.write("                float:left;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #logo img{\n");
      out.write("                height: 100%;\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #udetail{\n");
      out.write("                height: 150px;\n");
      out.write("                width:85%;\n");
      out.write("                float: left;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #title{\n");
      out.write("                height: 100%;\n");
      out.write("                width: 70.5%;\n");
      out.write("                float: left; \n");
      out.write("                padding: 30px 0px 0px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #welcome{\n");
      out.write("                float: left;\n");
      out.write("                width: 60%;\n");
      out.write("            }\n");
      out.write("            #score{\n");
      out.write("                width:40%;\n");
      out.write("                float: left;\n");
      out.write("            }\n");
      out.write("            #score h1{\n");
      out.write("                width:45%;\n");
      out.write("                background: white;\n");
      out.write("                border:1px solid #ff0000;\n");
      out.write("                border-radius:50%;\n");
      out.write("                transition:all .5s;                \n");
      out.write("            }\n");
      out.write("            #score h1:hover{\n");
      out.write("                color:white;\n");
      out.write("                background: #ff0000;                \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #nav{\n");
      out.write("                height: 100%;\n");
      out.write("                width: 29.5%;\n");
      out.write("                text-align: center;\n");
      out.write("                float: left;\n");
      out.write("            }\n");
      out.write("            .navsection{\n");
      out.write("                width: 100%;\n");
      out.write("                float: left;\n");
      out.write("                height: 50%;\n");
      out.write("                padding-top: 10px;\n");
      out.write("            }\n");
      out.write("            #navbar a{\n");
      out.write("                display: inline-block;\n");
      out.write("                margin-left: 10px;\n");
      out.write("                margin-right: 10px;\n");
      out.write("                padding: 10px;\n");
      out.write("                text-decoration: none;\n");
      out.write("                color: black;\n");
      out.write("                border: 1px solid #ff0000;\n");
      out.write("                transition: all .5s;\n");
      out.write("            }\n");
      out.write("            #navbar a:hover{\n");
      out.write("                color:white;\n");
      out.write("                background: #ff0000;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #history{\n");
      out.write("                width:75%;\n");
      out.write("                margin-left: 12.5%;\n");
      out.write("                margin-bottom: 10px;\n");
      out.write("                float: left;\n");
      out.write("                padding: 15px;\n");
      out.write("                max-height: 170px;\n");
      out.write("                overflow-y: scroll;\n");
      out.write("            }\n");
      out.write("               .card {\n");
      out.write("                background-color: yellow;\n");
      out.write("                padding: 20px;\n");
      out.write("                width:25%;\n");
      out.write("                float: left;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                #taketest{\n");
      out.write("                    text-decoration: none;\n");
      out.write("                    padding: 10px;\n");
      out.write("                    border:1px solid #ff0000;\n");
      out.write("                    color: black;\n");
      out.write("                    transition:all .5s;\n");
      out.write("                }\n");
      out.write("                #taketest:hover{\n");
      out.write("                    background: #ff0000;\n");
      out.write("                    color: white;\n");
      out.write("                }\n");
      out.write("            .leftcolumn{\n");
      out.write("                width: 75%;\n");
      out.write("                background: red;\n");
      out.write("                float: left;\n");
      out.write("                padding: 10px;\n");
      out.write("            }\n");
      out.write("            .rightcolumn{\n");
      out.write("                width: 25%;\n");
      out.write("                background: blue;\n");
      out.write("                float: left;\n");
      out.write("                padding: 10px;\n");
      out.write("            }\n");
      out.write("            .footer{\n");
      out.write("                position: relative;\n");
      out.write("                width: 98%;\n");
      out.write("                left: 1%;\n");
      out.write("                background: white;\n");
      out.write("                min-height: 9vh;\n");
      out.write("                float: left;\n");
      out.write("                margin-top: 10px;\n");
      out.write("            }\n");
      out.write("                .footleft{\n");
      out.write("                    float: left;\n");
      out.write("                    width: 70%;\n");
      out.write("                /*    border: 1px solid black;\n");
      out.write("                  */  min-height: 11vh;\n");
      out.write("                    padding-left: 20px;\n");
      out.write("               \n");
      out.write("                }\n");
      out.write("                .footright{\n");
      out.write("                    float: left;\n");
      out.write("                    width: 30%;\n");
      out.write("              /*      border: 1px solid black;\n");
      out.write("                */    min-height: 11vh;\n");
      out.write("                    \n");
      out.write("              \n");
      out.write("                }\n");
      out.write("                .footright h3{\n");
      out.write("                    position: absolute;\n");
      out.write("                    bottom: 5px;\n");
      out.write("                    right: 10px;\n");
      out.write("                    \n");
      out.write("                }\n");
      out.write("            \n");
      out.write("            .fa {\n");
      out.write("                padding: 1.5vw;\n");
      out.write("                font-size: 2vw;\n");
      out.write("                text-align: center;\n");
      out.write("                text-decoration: none;\n");
      out.write("                 margin: .6vw .2vw;\n");
      out.write("                 border-radius: 50%;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            .fa:hover {\n");
      out.write("                opacity: 0.7;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            .fa-facebook {\n");
      out.write("                background: #3B5998;\n");
      out.write("                color: white;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            .fa-twitter {\n");
      out.write("                background: #55ACEE;\n");
      out.write("                color: white;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            .fa-google {\n");
      out.write("                background: #dd4b39;\n");
      out.write("                color: white;\n");
      out.write("                }\n");
      out.write("            \n");
      out.write("            .clearfix:after{\n");
      out.write("                content: \"\";\n");
      out.write("                display: table;\n");
      out.write("                clear: both;\n");
      out.write("            }\n");
      out.write("            /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */\n");
      out.write("            @media (max-width: 800px) {\n");
      out.write("                     #logo,#udetail {\n");
      out.write("                            width:100%;\n");
      out.write("                            \n");
      out.write("                     }\n");
      out.write("                     #logo a img{\n");
      out.write("                         width:40%;\n");
      out.write("                         margin:auto;\n");
      out.write("                         display:table;\n");
      out.write("                     }\n");
      out.write("                     #score h1{\n");
      out.write("                         width:80%;\n");
      out.write("                     }\n");
      out.write("                     .card,.leftcolumn,.rightcolumn{\n");
      out.write("                         width:100%;\n");
      out.write("                     }\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */\n");
      out.write("@media (max-width: 400px) {\n");
      out.write("    \n");
      out.write("    \n");
      out.write("}\n");
      out.write("\n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </style>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <div class=\"header clearfix\">\n");
      out.write("            <div id=\"logo\">\n");
      out.write("        <a href=\"uhome.jsp\"><img src=\"image\\ISTS_logo.jpg\" alt=\"ISTS Logo\" /></a> \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div id=\"udetail\">\n");
      out.write("                <div id=\"title\">\n");
      out.write("                    <span id=\"welcome\">\n");
      out.write("                        <center>\n");
      out.write("                            <h1>Welcome to ISTS</h1>\n");
      out.write("                        </center>\n");
      out.write("                        \n");
      out.write("                    </span>\n");
      out.write("                    <span id=\"score\">\n");
      out.write("                        <center>\n");
      out.write("                            <h1>Score</br>");
      out.print(uscore);
      out.write("</h1>\n");
      out.write("                        </center>\n");
      out.write("                        \n");
      out.write("                    </span>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"nav\" >\n");
      out.write("                    <span class=\"navsection\" style=\"padding-top:30px\" >\n");
      out.write("                        <h3>Hi, ");
      out.print(uname);
      out.write("</h3>\n");
      out.write("                    </span>\n");
      out.write("\n");
      out.write("                    <div class=\"navsection\" id=\"navbar\">\n");
      out.write("                        <a href=\"profile\">Profile</a>\n");
      out.write("                        <a href=\"logout\">Logout</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>  \n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <!-- Header Ends Here -->\n");
      out.write("        \n");
      out.write("        <div class=\"clearfix\" >\n");
      out.write("            \n");
      out.write("            <div id=\"history\" style=\"margin-top:15px;border:1px solid black\" >\n");
      out.write("                <center><h1>Test History</h1></center>\n");
      out.write("                <div class=\"card\" >\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <div class=\"card\" >\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("                <div class=\"card\" >\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"history\" style=\"overflow:hidden\" >\n");
      out.write("                <center><a id=\"taketest\" href=\"instructions.jsp\">Take Test</a></center>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"leftcolumn\">\n");
      out.write("                <p>hello how are you</p></br>\n");
      out.write("                <p>hello how are you</p></br>\n");
      out.write("                <p>hello how are you</p></br>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"rightcolumn\">\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        <div class=\"footer\">\n");
      out.write("            <hr style=\" border: 1px solid black \"></hr>\n");
      out.write("            <div class=\"footleft\">\n");
      out.write("                <a href=\"http://www.facebook.com\" target=\"_blank\" class=\"fa fa-facebook\"></a>\n");
      out.write("                <a href=\"http://www.twitter.com\" target=\"_blank\" class=\"fa fa-twitter\"></a>\n");
      out.write("                <a href=\"http://www.google.com\" target=\"_blank\" class=\"fa fa-google\"></a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"footright\">\n");
      out.write("                <h3>Developed By Unity Coders</h3>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
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
