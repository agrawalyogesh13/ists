package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.regex.Pattern;

public final class testhistory_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    String qid=null,question=null,option1=null,option2=null,option3=null,option4=null,answer=null,solution=null,avgtime=null,nou=null,nocu=null;
    String qtime=null,qresponse=null,qscore=null;
    int test_no=0;
// fetch testno from u<umobile> table
//store nou, nocu,avgtime in qdata table
    String utable_query;
    ResultSet set;
    PreparedStatement ps_utable;
    Connection con;
    
    
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

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");

    //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //


    String umobile=(String)session.getAttribute("umobile");

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
    
    /*handling null and blanks
       if(resp!=null && resp.length()>0 ){ //resp will be null if link open directly, and resp.length() will be zero if no question attempted
        responseArray = resp.split(Pattern.quote("$_$"));
    }
    else if(utype!=null && resp==null && utype.equals("Student")){
        response.sendRedirect("uhome.jsp?alerttitle=You have not attempted the test");
        responseArray = new String[1]; //Just for initializing the array so that no error comes for array not initialized
    }
       else if(utype!=null && utype.equals("Student")){
        responseArray = new String[1]; //Just for initializing the array so that no error comes for array not initialized
        response.sendRedirect("uhome.jsp?alerttitle=You have not responded to any question");//If user have not given the test and still trying to access testresult.jsp        
    }
       else{
        responseArray = new String[1]; //Just for initializing the array so that no error comes for array not initialized
        
       }
    */


      out.write("\n");
      out.write("\n");
      out.write("    ");
      out.write('\n');

    String testno = request.getParameter("testno");
    if(testno==null && utype!=null && utype.equals("Student")){
        response.sendRedirect("uhome.jsp?alerttitle=Please Select A Test!");
    }
       else if(utype!=null && utype.equals("Student"))
           test_no = Integer.parseInt(testno);
//        out.print(test_no);
    
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ISTS","root","root");

       //utable select query u<umobile>
        utable_query="select * from u"+umobile+" where testno="+test_no;
        ps_utable = con.prepareStatement(utable_query);
        set = ps_utable.executeQuery();
       //utable select query u<umobile>
        
        if(set.next()){}// cursor for resultset object set has moved to index 0 from index -1, iff if block executes
        else{
            response.sendRedirect("uhome.jsp?alerttitle=Test Not Found!");
        }
        
        }
        catch(Exception e){
            out.print(e);
        }


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Result</title>\n");
      out.write("        <style>\n");
      out.write("            *{\n");
      out.write("                box-sizing:border-box;\n");
      out.write("                padding: 0;\n");
      out.write("                margin: 0;\n");
      out.write("            }\n");
      out.write("            body{\n");
      out.write("                min-width: 420px;\n");
      out.write("                padding: 10px;\n");
      out.write("                background: white;\n");
      out.write("            }\n");
      out.write("            p{\n");
      out.write("                font-size: 17px;\n");
      out.write("            }\n");
      out.write("            body::-webkit-scrollbar {\n");
      out.write("                width: .6em;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            body::-webkit-scrollbar-track {\n");
      out.write("                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);\n");
      out.write("            }\n");
      out.write("                    \n");
      out.write("            body::-webkit-scrollbar-thumb {\n");
      out.write("                background-color: #1aa3ff;\n");
      out.write("                outline: 1px solid slategrey;\n");
      out.write("                border-radius:20%;\n");
      out.write("            }\n");
      out.write("            .home{\n");
      out.write("                width: 5%;\n");
      out.write("                height: 60px;\n");
      out.write("                min-width: 20px;\n");
      out.write("                position: fixed;\n");
      out.write("                right: 10px;\n");
      out.write("                bottom: 10px;\n");
      out.write("                border: 1px solid #0e90d2;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            .home a img{\n");
      out.write("                display: table;\n");
      out.write("                width: 100%;\n");
      out.write("                height: 100%;\n");
      out.write("            }\n");
      out.write("            .header{\n");
      out.write("                background: white;\n");
      out.write("                width: 100%;\n");
      out.write("                height: 150px;\n");
      out.write("                min-width: 400px;\n");
      out.write("            }\n");
      out.write("            .header img{\n");
      out.write("                height: 100%;\n");
      out.write("                width: 15%;\n");
      out.write("                float: left;\n");
      out.write("            }\n");
      out.write("            #title{\n");
      out.write("                text-align: center;\n");
      out.write("                height: 100%;\n");
      out.write("                width: 65%;\n");
      out.write("                padding: 40px;\n");
      out.write("                float: left;\n");
      out.write("            }\n");
      out.write("            #test_no{\n");
      out.write("                float: left;\n");
      out.write("                width: 20%;\n");
      out.write("                text-align: center;\n");
      out.write("                padding-top: 40px;\n");
      out.write("            }\n");
      out.write("            .container{\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .leftcolumn{\n");
      out.write("                width: 75%;\n");
      out.write("                background: #1aa3ff;\n");
      out.write("                float: left;\n");
      out.write("                padding: 10px 10px 0px 10px;\n");
      out.write("            }\n");
      out.write("            .card table{;\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("            td{\n");
      out.write("                padding-bottom: 10px;\n");
      out.write("                text-align: left;\n");
      out.write("            }\n");
      out.write("            .rightcolumn{\n");
      out.write("                width: 25%;\n");
      out.write("                background: #1aa3ff;\n");
      out.write("                float: left;\n");
      out.write("                padding: 10px;\n");
      out.write("            }\n");
      out.write("               .card {\n");
      out.write("                background-color: white;\n");
      out.write("                padding: 20px;\n");
      out.write("                }\n");
      out.write("                .footer{\n");
      out.write("                    width: 75%;\n");
      out.write("                    margin-top: 20px;\n");
      out.write("                    background: gray;\n");
      out.write("                    padding: 10px;\n");
      out.write("                    text-align: center;\n");
      out.write("                }\n");
      out.write("                .btn{\n");
      out.write("                    padding: 10px;\n");
      out.write("                    margin: 0px 10px;\n");
      out.write("                }\n");
      out.write("                .row{\n");
      out.write("                    \n");
      out.write("                }\n");
      out.write("                .solution{\n");
      out.write("                    display:none;\n");
      out.write("                }\n");
      out.write("                .showbtn{\n");
      out.write("                    padding: 10px;\n");
      out.write("                }\n");
      out.write("            \n");
      out.write("            .row:after{\n");
      out.write("                content: \"\";\n");
      out.write("                display: table;\n");
      out.write("                clear: both;\n");
      out.write("            }\n");
      out.write("            /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */\n");
      out.write("@media (max-width: 800px) {\n");
      out.write("    .leftcolumn, .rightcolumn {   \n");
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
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        <div class=\"home\">\n");
      out.write("            <a title=\"Back To Home\" href=\"uhome.jsp\"><img src=\"image/home.png\" alt=\"ISTS\" ></a>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"header\">\n");
      out.write("            <a href=\"uhome.jsp\"><img src=\"image/ISTS_logo.jpg\"></a>\n");
      out.write("            <h1 id=\"title\" >Test Analysis</h1>\n");
      out.write("        <h2 id=\"test_no\" >Test No. </br>");
      out.print(test_no);
      out.write("</h2>\n");
      out.write("        </div>        \n");
      out.write("\n");
      out.write("        ");

        int i=0;
        try{
        do{
            // will run upto no of questions attempted, as 14 fields are appended
            // Below code will fetch the 14 fields w.r.t each question
                
                qid = set.getString("qid");
                
                qtime = set.getString("qtime");
                
                qresponse = set.getString("qresponse");
                
                qscore = set.getString("pscore");
                
                question = set.getString("ques");
                
                option1 = set.getString("option1");
                
                option2 = set.getString("option2");
                
                option3 = set.getString("option3");
                
                option4 = set.getString("option4");
                
                answer = set.getString("answer");
                
                solution = set.getString("solution");
                
                avgtime = set.getString("avgtime");
                
                nou = set.getString("nou");
                
                nocu = set.getString("nocu");
        
      out.write("\n");
      out.write("                <!--html code here-->\n");
      out.write("        <div class=\"row\">\n");
      out.write("            \n");
      out.write("            <div class=\"leftcolumn\">\n");
      out.write("                <div class=\"card\">\n");
      out.write("                    <h2>Q. ");
      out.print(i+1);
      out.write("</h2></br>\n");
      out.write("                    <p>");
      out.print(question);
      out.write("</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card\" style=\"padding-bottom: 0px;padding-top: 0px\" >\n");
      out.write("                    <p><strong>A.</strong>&nbsp;");
      out.print(option1);
      out.write("</p></br>\n");
      out.write("                    <p><strong>B.</strong>&nbsp;");
      out.print(option2);
      out.write("</p></br>\n");
      out.write("                    <p><strong>C.</strong>&nbsp;");
      out.print(option3);
      out.write("</p></br>\n");
      out.write("                    <p><strong>D.</strong>&nbsp;");
      out.print(option4);
      out.write("</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card\">\n");
      out.write("                    <button class=\"showbtn\" id=\"btnsolution");
      out.print(i+1);
      out.write("\" onclick=\"show(");
      out.print(i+1);
      out.write(")\" >Show Solution</button>\n");
      out.write("                    <div class=\"solution\" id=\"solution");
      out.print(i+1);
      out.write("\">\n");
      out.write("                        <p></br>");
      out.print(solution);
      out.write("</p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("                    ");

                    String qstatus="Incorrect";
                    if(qresponse.equals(answer)){
                        qstatus="Correct";
                        
      out.write("\n");
      out.write("                        <div class=\"rightcolumn\" style=\"background: #32CD32\" >\n");
      out.write("                     ");

                    }
                    else if("Not Answered".equals(qresponse)){
                        qstatus="N/A";
                        
      out.write("\n");
      out.write("                        <div class=\"rightcolumn\" style=\"padding-left: 0px\" >\n");
      out.write("                     ");

                    }
                    else{
                        
      out.write("\n");
      out.write("                        <div class=\"rightcolumn\" style=\"background: #ff6347\" >\n");
      out.write("                     ");

                    }
                    
                    
      out.write("\n");
      out.write("                <div class=\"card\">\n");
      out.write("                    <p>");
      out.print(qstatus);
      out.write("</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card\" style=\"padding-top: 0px\" >\n");
      out.write("                <p>Your Response&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;");
      out.print(qresponse);
      out.write("</p>\n");
      out.write("                <p>Correct Response&nbsp;:&nbsp;");
      out.print(answer);
      out.write("</p>\n");
      out.write("                <p>Profile Score&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;");
      out.print(qscore);
      out.write("</p>\n");
      out.write("                <p>Question ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ");
      out.print(qid);
      out.write("</p>\n");
      out.write("                <p>Your Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ");
      out.print(qtime);
      out.write(" Sec</p>\n");
      out.write("                <p title=\"Average Time Taken By Correct Users\" >Users Avg Time &nbsp;: ");
      out.print(avgtime);
      out.write(" Sec</p>\n");
      out.write("                <p>Attempts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ");
      out.print(nou);
      out.write("</p>\n");
      out.write("                <p>Correct Attempts : ");
      out.print(nocu);
      out.write("</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("                <!--html code here-->\n");
      out.write("                ");

            i++;
        }
        while(set.next());
            // do while loop ends here
                con.close();
        }
        catch(Exception e){
            out.print(e);
        }
                
      out.write("\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        \n");
      out.write("        function show(x){\n");
      out.write("            var button = document.getElementById(\"btnsolution\"+x);\n");
      out.write("            \n");
      out.write("            if(button.innerHTML==\"Show Solution\"){\n");
      out.write("                button.innerHTML=\"Hide Solution\";\n");
      out.write("                document.getElementById(\"solution\"+x).style.display = \"table\";\n");
      out.write("            }\n");
      out.write("            else{\n");
      out.write("                button.innerHTML=\"Show Solution\";\n");
      out.write("                document.getElementById(\"solution\"+x).style.display = \"none\";\n");
      out.write("            }   \n");
      out.write("        }\n");
      out.write("        \n");
      out.write("    </script>\n");
      out.write("        \n");
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
