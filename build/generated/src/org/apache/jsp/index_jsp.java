package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"slider/slider.css\">\n");
      out.write("        <title>ISTS</title>\n");
      out.write("        <style>\n");
      out.write("            html,body\n");
      out.write("            {\n");
      out.write("                min-width: 360px;\n");
      out.write("                background: white;\n");
      out.write("                padding:10px;\n");
      out.write("            \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            *{\n");
      out.write("                box-sizing:border-box;\n");
      out.write("                margin: 0px;\n");
      out.write("                padding: 0px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .header {\n");
      out.write("                width: 100%;   \n");
      out.write("            }\n");
      out.write("            #logo{\n");
      out.write("                height: 150px;\n");
      out.write("                width:15%;\n");
      out.write("                float: left;\n");
      out.write("            }\n");
      out.write("            #logo img{\n");
      out.write("                width: 100%;\n");
      out.write("                height: 100%;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #head{\n");
      out.write("                height: 150px;\n");
      out.write("                width:65%;\n");
      out.write("                float: left;\n");
      out.write("                text-align: center;\n");
      out.write("                font-size: 50px;\n");
      out.write("            }\n");
      out.write("            #head p{\n");
      out.write("                margin-top: 5%;\n");
      out.write("            }\n");
      out.write("            #login{\n");
      out.write("                height: 150px;\n");
      out.write("                width:20%;\n");
      out.write("                float: left;\n");
      out.write("                text-align: center;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            #login a{\n");
      out.write("                font-size: 20px;    \n");
      out.write("                text-decoration: none;\n");
      out.write("                padding:10px 20px;\n");
      out.write("                border: 2px solid #1aa3ff;\n");
      out.write("                border-radius:10%;\n");
      out.write("                position: relative;\n");
      out.write("                top: 60px;\n");
      out.write("            }\n");
      out.write("            #login a:hover{\n");
      out.write("                color:white;\n");
      out.write("                background: #1aa3ff;\n");
      out.write("            }\n");
      out.write("            .clearfix{\n");
      out.write("                margin-top: 10px;\n");
      out.write("                border-top: 2px solid #ff0000;\n");
      out.write("            }\n");
      out.write("            .facility{\n");
      out.write("                padding:10px;\n");
      out.write("                width:25%;\n");
      out.write("                float: left;\n");
      out.write("                background: white;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .overview{\n");
      out.write("                width:75%;\n");
      out.write("                float: left;\n");
      out.write("                background: white;\n");
      out.write("            }\n");
      out.write("            .overview_up{\n");
      out.write("                float: left;\n");
      out.write("                width: 100%;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            .contentbtn{\n");
      out.write("                padding: 10px 30px;\n");
      out.write("                display: inline-block;\n");
      out.write("                font-size: 20px;\n");
      out.write("                border: 2px solid #008CBA;\n");
      out.write("                background: white;\n");
      out.write("                border-radius:10%;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            .contentbtn:hover{\n");
      out.write("                cursor: pointer;\n");
      out.write("                opacity:0.8;\n");
      out.write("                color: white;\n");
      out.write("                background: #1aa3ff;\n");
      out.write("            }\n");
      out.write("            .about{\n");
      out.write("                width:75%;\n");
      out.write("                float: left;\n");
      out.write("                background: white;\n");
      out.write("                padding: 10px;\n");
      out.write("            }\n");
      out.write("            .contact{\n");
      out.write("                width: 25%;\n");
      out.write("                float: left;\n");
      out.write("                background: white;\n");
      out.write("                padding: 10px;\n");
      out.write("            }\n");
      out.write("            #icon:hover{\n");
      out.write("                color:#008CBA;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .footer{\n");
      out.write("                width:100%;\n");
      out.write("                background: white;\n");
      out.write("                min-height: 80px;\n");
      out.write("                float: left;\n");
      out.write("                margin-top: 10px;\n");
      out.write("            }\n");
      out.write("                .footleft{\n");
      out.write("                    float: left;\n");
      out.write("                    width: 70%;\n");
      out.write("                    min-height: 80px;\n");
      out.write("                    padding-left: 20px;\n");
      out.write("                }\n");
      out.write("                .footright{\n");
      out.write("                    float: left;\n");
      out.write("                    width: 30%;\n");
      out.write("                    min-height: 80px;\n");
      out.write("                    position: relative;\n");
      out.write("                }\n");
      out.write("                .footright h3{\n");
      out.write("                    position: absolute;\n");
      out.write("                    bottom: 5px;\n");
      out.write("                    right: 10px;\n");
      out.write("                    \n");
      out.write("                }\n");
      out.write("            \n");
      out.write("            .fa {\n");
      out.write("                padding: 20px;\n");
      out.write("                font-size: 25px;\n");
      out.write("                text-align: center;\n");
      out.write("                text-decoration: none;\n");
      out.write("                 margin: 10px 10px 0 0;\n");
      out.write("                 border-radius: 50%;\n");
      out.write("                 opacity: 0.8;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            .fa:hover {\n");
      out.write("                opacity: 1;\n");
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
      out.write("            .clearfix:after{\n");
      out.write("                content: \"\";\n");
      out.write("                display: table;\n");
      out.write("                clear: both;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("                /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */\n");
      out.write("@media (max-width: 800px) {\n");
      out.write("    \n");
      out.write("    #logo, .facility, .overview, .contact, .about {   \n");
      out.write("        width: 100%;\n");
      out.write("    }\n");
      out.write("    .facility, .contact, .about{\n");
      out.write("        padding:10px 0px;\n");
      out.write("    }\n");
      out.write("    #logo img{\n");
      out.write("        width:50%;\n");
      out.write("        height:100%;\n");
      out.write("        display:table;\n");
      out.write("        margin:auto;\n");
      out.write("    }\n");
      out.write("    #head{\n");
      out.write("        font-size:30px;\n");
      out.write("        width:70%;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    #head p{\n");
      out.write("        margin-top: 15%;\n");
      out.write("    }\n");
      out.write("    #login{\n");
      out.write("        width:30%;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    .w3-content{\n");
      out.write("        width:100%;\n");
      out.write("    }\n");
      out.write("    .fa{\n");
      out.write("        padding:10px;\n");
      out.write("        font-size:20px;\n");
      out.write("    }\n");
      out.write("    \n");
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
      out.write("        <div class=\"header clearfix\" data-scroll-reveal=\"enter from the bottom after 0.1s\">\n");
      out.write("            <span id=\"logo\">\n");
      out.write("             <a href=\"index.jsp\"><img src=\"image/ISTS_logo.jpg\"></img></a>                \n");
      out.write("            </span>\n");
      out.write("            <span id=\"head\">\n");
      out.write("                <p><i>Intelligent Skill Test System</i></p>                \n");
      out.write("            </span>\n");
      out.write("            <span id=\"login\">\n");
      out.write("             <a href=\"login.jsp\">Login</a>                \n");
      out.write("            </span>\n");
      out.write("        </div>\n");
      out.write("      <!--Header Ends Here -->\n");
      out.write("\n");
      out.write("      \n");
      out.write("          <div class=\"clearfix\">\n");
      out.write("              <div class=\"facility\">\n");
      out.write("                  <div class=\"card\">\n");
      out.write("                  <h2>Overview</h2></br>\n");
      out.write("                  <p style=\"text-align: justify\" >Students who want to enhance their preparation level and achieve success in the future, ISTS is\n");
      out.write("the best option for them. Signup and start evaluating your performances by using our smart\n");
      out.write("web-application. It provides question suitable just for you on the basis of your profile score. All\n");
      out.write("the questions will have separate analysis along with detailed solutions.\n");
      out.write("                  </p>\n");
      out.write("                      \n");
      out.write("                  </div>\n");
      out.write("                  </br>\n");
      out.write("                  <div class=\"card\" style=\"text-align: center;margin-top: 10px\" >\n");
      out.write("                    <form action=\"taketest\">\n");
      out.write("<!--                        <button type=\"submit\" class=\"contentbtn\" >Demo Test</button>\n");
      out.write("--> \n");
      out.write("                   <button type=\"submit\" class=\"contentbtn\" formaction=\"signup.jsp\" >Sign Up</button>\n");
      out.write("                    </form>\n");
      out.write("                      \n");
      out.write("                  </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"overview\">\n");
      out.write("                <div class=\"overview_up\">\n");
      out.write("<div class=\"w3-content w3-section\">\n");
      out.write("  <img class=\"mySlides w3-animate-fading\" src=\"image/Slider_1.png\" style=\"width:100%;height: 100%\">\n");
      out.write("  <img class=\"mySlides w3-animate-fading\" src=\"image/Slider_2.png\" style=\"width:100%;height: 100%\">\n");
      out.write("  <img class=\"mySlides w3-animate-fading\" src=\"image/Slider_3.png\" style=\"width:100%;height: 100%\">\n");
      out.write("  <img class=\"mySlides w3-animate-fading\" src=\"image/Slider_4.png\" style=\"width:100%;height: 100%\">\n");
      out.write("  <img class=\"mySlides w3-animate-fading\" src=\"image/Slider_5.png\" style=\"width:100%;height: 100%\">\n");
      out.write("  <img class=\"mySlides w3-animate-fading\" src=\"image/Slider_6.png\" style=\"width:100%;height: 100%\">\n");
      out.write("</div>\n");
      out.write("                </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("<!--\n");
      out.write("<div style=\"height:25px\" class=\"clearfix\" >\n");
      out.write("    <h2 style=\"color:#ff0000;\"  ><marquee behavior=scroll direction=\"left\" scrollamount=\"12\">This Portal Is Developed Under The Guidance of Asst. Professor Ms. Anubha Sharma</marquee></h2>\n");
      out.write("</div>\n");
      out.write("-->      \n");
      out.write("<div class=\"clearfix\">\n");
      out.write("        <div class=\"about\">\n");
      out.write("            <h3>About Us</br></br></h3>\n");
      out.write("                <p>Designed By Group of 4 Members Pursuing BE (CSE) From SVITS, INDORE.</p></br>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <span id=\"names\" >\n");
      out.write("            <p>PRAMIL JAIN (0802CS141078)</br>RAHUL (0802CS141081)</br>SHUBHAM AGRAWAL (0802CS141100)</br>YOGESH AGRAWAL (0802CS141119)\n");
      out.write("            </p></span>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <div class=\"contact\">\n");
      out.write("            <h3>Contact Us</h3>\n");
      out.write("            <p><span id=\"icon\" style=\"font-size: 22px\" >&nbsp;&#9872;&nbsp;</span><span style=\"color:#008CBA\">&nbsp;C-20, Chandra Nagar</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MR-9 Square,</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Indore-452009</span></p>\n");
      out.write("            <p><span id=\"icon\" style=\"font-size: 22px\" >&#x2709;&nbsp;</span><a style=\"text-decoration: none;color:#008CBA;\" href=\"https://mail.google.com\" target=\"_blank\">&nbsp;portal.ists@gmail.com</a></p>\n");
      out.write("            <p><span id=\"icon\" style=\"font-size: 22px\" >&#x2706;&nbsp;&nbsp;</span><span style=\"color:#008CBA\">0731-2729073</span></p>\n");
      out.write("        </div>\n");
      out.write("    \n");
      out.write("</div>\n");
      out.write("        <div class=\"footer\">\n");
      out.write("            <hr style=\" border: 1px solid black \"></hr>\n");
      out.write("            <div class=\"footleft\">\n");
      out.write("                <a href=\"https://www.facebook.com/ISTS-193128571278627\" target=\"_blank\" class=\"fa fa-facebook\"></a>\n");
      out.write("                <a href=\"https://twitter.com/ISTS_Poratl\" target=\"_blank\" class=\"fa fa-twitter\"></a>\n");
      out.write("                <a href=\"https://plus.google.com/u/0/109329877174882956106\" target=\"_blank\" class=\"fa fa-google\"></a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"footright\">\n");
      out.write("                <h3><span style=\"font-size: 22px\" >&#169;</span>&nbsp;Developed By Unity Coders</h3>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("var myIndex = 0;\n");
      out.write("carousel();\n");
      out.write("\n");
      out.write("function carousel() {\n");
      out.write("    var i;\n");
      out.write("    var x = document.getElementsByClassName(\"mySlides\");\n");
      out.write("    for (i = 0; i < x.length; i++) {\n");
      out.write("       x[i].style.display = \"none\";  \n");
      out.write("    }\n");
      out.write("    myIndex++;\n");
      out.write("    if (myIndex > x.length) {myIndex = 1}    \n");
      out.write("    x[myIndex-1].style.display = \"block\";  \n");
      out.write("    setTimeout(carousel, 5000);    \n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("\n");
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