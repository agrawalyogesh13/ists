<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    String umobile = (String)session.getAttribute("umobile");
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
    
    %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mock Test</title>
    </head>
    <body>
    <center><h1>Coming Soon!</h1></br><a style="text-decoration: none" href="instructions.jsp">Back</a>&nbsp;&nbsp;&nbsp;<a style="text-decoration: none" href="uhome.jsp">Home</a></center>
    
    </body>
</html>
