package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class hide_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<head>\n");
      out.write("    <style type=\"text/css\">\n");
      out.write("        .solution{\n");
      out.write("            display:none;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("    <button id=\"btnsolution1\" onclick=\"show(1)\" >Show Solution</button>\n");
      out.write("    <div class=\"solution\" id=\"solution1\">\n");
      out.write("        <p>Solution1</p>\n");
      out.write("    </div>\n");
      out.write("    <button id=\"btnsolution2\" onclick=\"show(2)\">Show Solution</button>\n");
      out.write("    <div class=\"solution\" id=\"solution2\">\n");
      out.write("        <p>Solution2</p>\n");
      out.write("    </div>\n");
      out.write("    <button id=\"btnsolution3\" onclick=\"show(3)\">Show Solution</button>\n");
      out.write("    <div class=\"solution\" id=\"solution3\">\n");
      out.write("        <p>Solution3</p>\n");
      out.write("    </div>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        \n");
      out.write("        function show(){\n");
      out.write("            \n");
      out.write("            var button = document.getElementById(\"btnsolution\"+x);\n");
      out.write("            if(button.innerHTML==\"Show Solution\"){\n");
      out.write("                button.innerHTML=\"HideSolution\";\n");
      out.write("                document.getElementById(\"solution\"+x).style.display = \"block\";\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("        }\n");
      out.write("        \n");
      out.write("    </script>\n");
      out.write("    \n");
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
