package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    \n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <title>Home</title>\n");
      out.write("        <style>\n");
      out.write("            *{\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                box-sizing:border-box;\n");
      out.write("            }\n");
      out.write("            body{\n");
      out.write("                background: #f0f0f0;\n");
      out.write("                min-width: 420px;\n");
      out.write("                padding: 10px;\n");
      out.write("            }            \n");
      out.write("            .header {\n");
      out.write("                height: 150px;\n");
      out.write("                background: #f2f2f2;\n");
      out.write("                position: relative;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            .header img{\n");
      out.write("                position: absolute;\n");
      out.write("                float: left;\n");
      out.write("                width: 15%;\n");
      out.write("                height: 100%;\n");
      out.write("            }\n");
      out.write("            .header #login{\n");
      out.write("                position: absolute;\n");
      out.write("                float: right;\n");
      out.write("                font-size: 1.5vw;\n");
      out.write("                padding: 1.3vw;\n");
      out.write("                right: 20px;\n");
      out.write("                top: 46px;\n");
      out.write("                border:2px solid #ff0000;\n");
      out.write("                text-decoration: none;\n");
      out.write("                color: #000000;\n");
      out.write("                border-radius:10%;\n");
      out.write("            }\n");
      out.write("            #login:hover{\n");
      out.write("                color:white;\n");
      out.write("                background: #ff0000;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .header .head{\n");
      out.write("                position: absolute;\n");
      out.write("                float: left;\n");
      out.write("                font-size: 4.5vw;\n");
      out.write("                left: 16%;\n");
      out.write("                top: 25%;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .facility{\n");
      out.write("                margin: 0.8vw 0px 0.8vw 0.8vw;\n");
      out.write("                width: 23vw;\n");
      out.write("/*                border:0.1vw solid black; */\n");
      out.write("                min-height: 33vh;\n");
      out.write("                float: left;\n");
      out.write("                background: white;\n");
      out.write("                border: 1px solid black;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            .facility h2{\n");
      out.write("                text-align: center;\n");
      out.write("                letter-spacing: .5px;\n");
      out.write("            }\n");
      out.write("            .facility p{\n");
      out.write("                padding-left: 10px;\n");
      out.write("                letter-spacing: .8px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .overview{\n");
      out.write("                margin:0.8vw;\n");
      out.write("                width:73.3vw;\n");
      out.write("                border: 1px solid black;                \n");
      out.write("/*                border:0.1vw solid black; */\n");
      out.write("                float: left;\n");
      out.write("                min-height: 33vh;\n");
      out.write("                background: white;\n");
      out.write("                position: relative;\n");
      out.write("                padding: 10px;\n");
      out.write("            }\n");
      out.write("            .overview h2{\n");
      out.write("                text-align: center;\n");
      out.write("                letter-spacing: .5px;\n");
      out.write("            }\n");
      out.write("            .overview p{\n");
      out.write("                padding-left: 10px;\n");
      out.write("                padding-right: 10px;\n");
      out.write("                letter-spacing: .8px;\n");
      out.write("            }\n");
      out.write("            .overview_up{\n");
      out.write("                background: blue;\n");
      out.write("                float: left;\n");
      out.write("                width: 100%;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            .overview_down {\n");
      out.write("                background: red;\n");
      out.write("                width: 100%;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            .contentbtn{\n");
      out.write("                padding: 10px;\n");
      out.write("                display: inline-block;\n");
      out.write("                font-size: 1.2vw;\n");
      out.write("                border: 2px solid #008CBA;\n");
      out.write("                background: #f1f1f1;\n");
      out.write("                border-radius:10%;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            .contentbtn:hover{\n");
      out.write("                cursor: pointer;\n");
      out.write("                opacity:0.8;\n");
      out.write("                color: white;\n");
      out.write("                background: #008CBA; \n");
      out.write("            }\n");
      out.write("            .contact{\n");
      out.write("                margin: 0.8vw 0 0.8vw 0.8vw;\n");
      out.write("                width: 74vw;\n");
      out.write("/*                border:0.1vw solid black; */\n");
      out.write("                float: left;\n");
      out.write("                min-height: 20vh;\n");
      out.write("                background: white;\n");
      out.write("                border: 1px solid black;\n");
      out.write("            }\n");
      out.write("            .about{\n");
      out.write("                width: 23vw;\n");
      out.write("  /*              border:0.1vw solid black; */\n");
      out.write("                margin: 0.8vw 0px 0.8vw 0.8vw;\n");
      out.write("                min-height: 20vh;\n");
      out.write("                float: left;\n");
      out.write("                background: white;\n");
      out.write("                border: 1px solid black;\n");
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
      out.write("            /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */\n");
      out.write("@media (max-width: 800px) {\n");
      out.write("    .facility, .overview, .contact, .about {   \n");
      out.write("        width: 100%;\n");
      out.write("        padding: 0;\n");
      out.write("    }\n");
      out.write("    .footer{\n");
      out.write("        width:100%;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("}\n");
      out.write("\n");
      out.write("/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */\n");
      out.write("@media (max-width: 400px) {\n");
      out.write("    \n");
      out.write("    \n");
      out.write("}\n");
      out.write("                \n");
      out.write("            \n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"header\">\n");
      out.write("             <a id=\"logo\" href=\"index.jsp\"><img src=\"image/ISTS_logo.jpg\"></img></a>\n");
      out.write("             <p class=\"head\"><i>Intelligent Skill Test System</i></p>\n");
      out.write("             <a id=\"login\" href=\"login.jsp\">Login</a>\n");
      out.write("        </div>\n");
      out.write("        <hr style=\" border: 1px solid black; \" ></hr>\n");
      out.write("        \n");
      out.write("        <!-- Header Ends Here -->\n");
      out.write("<!--        <div class=\"clearfix\">\n");
      out.write("-->\n");
      out.write("        <div class=\"facility\">\n");
      out.write("            <h2>Facilities</h2></br>\n");
      out.write("            <p>\n");
      out.write("•\tNo repeated questions to any candidate.</br>\n");
      out.write("•\tUser friendly interface.</br>\n");
      out.write("•\tNo static pages.</br>\n");
      out.write("•\tQuestion wise analysis.</br>\n");
      out.write("•\tStudent preparation level wise question generation.</br>\n");
      out.write("•\tDynamic profile score for each user.</br>\n");
      out.write("•\tFull mock test is also available.</br>\n");
      out.write("</p>\n");
      out.write("            </br>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"overview\">\n");
      out.write("            <div class=\"overview_up\">\n");
      out.write("            <h2>Overview</h2></br>\n");
      out.write("            <p>ISTS is a web-app built for students appearing in various \n");
      out.write("                competitive exams such as CAT,GATE,GRE,etc. It focuses on the improving \n");
      out.write("                performances  of the students, especially those who are  suffering from exam \n");
      out.write("                phobia. It provides a platform for the students to better their performances and \n");
      out.write("                analyze their performances in the previous attempts. It has a unique way of \n");
      out.write("                providing questions on the basis of the level of preparation off the students. \n");
      out.write("                Along with this it  also provides question wise analysis to the students. \n");
      out.write("                This has a user friendly and very interactive\n");
      out.write("                UI which will help users to gain maximum profit from this web-app.\n");
      out.write("            </p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"overview_down\">\n");
      out.write("            <form action=\"taketest\">\n");
      out.write("                <button type=\"submit\" class=\"contentbtn\" >Demo Test</button>\n");
      out.write("                <button type=\"submit\" class=\"contentbtn\" formaction=\"signup.jsp\" >Sign Up</button>\n");
      out.write("            </form>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("<!--        </div>\n");
      out.write("-->\n");
      out.write("        <div class=\"contact\">Contact\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div class=\"about\">About\n");
      out.write("        </div>\n");
      out.write("\n");
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
      out.write("    </body>\n");
      out.write("    \n");
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
