<%-- 
    Document   : modifyquestion
    Created on : Mar 18, 2018, 11:36:28 PM
    Author     : hp
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <%!
     Connection con;
    %>
    <%
    //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //
    
    
    //String uname = (String)session.getAttribute("uname");
    //String utype = (String)session.getAttribute("utype");
    //int flag=0;
    //        if(uname!=null || utype!=null)
    //            if(utype.equals("Admin"))
    //                flag=1;
    //if(flag==0)
    //    response.sendRedirect("login.jsp?alerttitle=You Are Not Logged In!");
    //Authetication Code For Student, Starts Here//This code checks whether the user is a valid user//String uname = (String)session.getAttribute("uname"); Only utype is sufficient
    String utype = (String)session.getAttribute("utype");
    String uscore = (String)session.getAttribute("uscore");
    int uexistflag=0,uflag=0;
            if(utype!=null){
                uexistflag=1;
                if(utype.equals("Student")){ //if its a student, uscore will be either -1 or between 1-100 but never null
                    if("-1".equals(uscore)){
                        response.sendRedirect("profiletest.jsp");
                    }
                    else{
                        response.sendRedirect("uhome.jsp");
                    }
                }
            }
                    
           if(uexistflag==0)
               response.sendRedirect("login.jsp?alerttitle=You Are Not Logged In!");
    //Authetication Code For Student, Ends Here
    
    String search_qid=request.getParameter("qid");
    if(search_qid==null && "Admin".equals(utype)){
        response.sendRedirect("ahome.jsp?alerttitle=You have to search QID to modify questions");
    }
    String question=null,option1=null,option2=null,option3=null,option4=null,answer=null,solution=null;
    String subject=null, topic=null, level=null,query2=null;
    String query = "select * from qdata where qid='"+search_qid+"'";
   
    ResultSet rs;
    PreparedStatement ps,ps2;
     try{
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ists","root","root");
            ps = con.prepareStatement(query);
            rs =ps.executeQuery();
            if(rs.next()){
            question=rs.getString("ques");
            option1=rs.getString("option1");
            option2=rs.getString("option2");
            option3=rs.getString("option3");
            option4=rs.getString("option4");
            answer=rs.getString("answer");
            solution=rs.getString("solution");
        


%>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            *{
                box-sizing:border-box;
                padding: 0;
                margin: 0;
            }
            body{
                min-width: 420px;
            }
            .container{
                width: 65%;
                margin: auto;
            }
            .leftcolumn{
                width:22%;
                float: left;
                margin-top: 10%;
                margin-right: 20px;
                text-align: center;
            }
            #qid{
                padding: 10px;
            }
            .rightcolumn{
                margin-left: 20px;
                width: 70%;
                float: left;
            }
            .qsection{
                width:100%;
                float: left;
                
            }
            
            .row:after{
                content: "";
                display: table;
                clear: both;
            }
            /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media (max-width: 800px) {
    .leftcolumn, .rightcolumn {   
        width: 100%;
        padding: 0;
    }
}
            
        </style>
        
    </head>
    <body>
        <div class="row container" >
        <div class="leftcolumn">
            <form action="#" name="form">
                <input type="text" readonly id="qid" value="<%=search_qid%>" name="qid"></input></br></br>
                <input type="submit" disabled value="Search" ></input>
            </form>
        </div>
        <div class="rightcolumn">
        <form action=update method="post" id="addques">
          <!--  <div class="menu">     
        </br></br>  
        <label for="subject"><b>Subject</b></label>        
        <select style="width: 50%" id="subjectID" name="subject" >
            <option value="" selected disabled >SELECT</option>
            <option value="APTI" >Aptitude</option>
        </select>
        </br>
        
        </br>
        
        <label for="topic"><b>Topic</b></label>
        &nbsp;&nbsp;
        <select style="width: 50%"id="topicID" name="topic" >
            <option value="TW" >Time & Work</option>
            <option value="NSYS" >Number System</option>
            <option value="SDT" >Speed, Distance & Time</option>
            <option value="PL" >Profit & Loss</option>
            <option value="PC" >P & C</option>
            <option value="PRO" >Probability</option>
        </select>
        </br></br> 
        <label for="level"><b>Level</b></label>
        &nbsp;&nbsp;

        <select style="width: 50%" id="levelID" name="level" >
            <option>01</option>
            <option>02</option>
            <option>03</option>
        </select>
        </div>
        
          -->
        <div class="qsection">
            </br>
            <label for="ques"><b>Question</b></label>
            <textarea style="width: 70%;min-height: 50px" name="ques" required form="addques"><%= question%></textarea>
        </br></br>
        <label><b>Correct <br> answer</b></label>
        <input style="width:68%;margin-left: 4%" type="text-area" required value="<%= answer%>" readonly></input>
        </br></br>
        <textarea style="width:72%;margin-left: 4%" type="text-area" hidden name="qid" readonly ><%= search_qid%></textarea>
        
        
        <input type="radio" required name="answer" value="A"></input>
         
        <label><b>A.</b></label>
        <input style="width:71%;margin-left: 4%" type="text-area" required name="option1" value="<%= option1%>"></input>
        </br></br>
        <input type="radio" name="answer" value="B" ></input>
        <label><b>B.</b></label>
        <input style="width:71%;margin-left: 4%" type="text-area" required name="option2" value="<%= option2%>"></input>
        </br></br>
        <input type="radio" name="answer" value="C"></input>
        <label><b>C.</b></label>
        <input style="width:71%;margin-left: 4%" type="text-area" required name="option3" value="<%= option3%>"></input>
        </br></br>
        <input type="radio" name="answer" value="D"></input>
        <label><b>D.</b></label>
        <input style="width:71%;margin-left: 4%" type="text-area" required name="option4" value="<%= option4%>"></input>
        </br></br>
        <label for="solution"><b>Solution/Hint</b></label>
        <textarea style="width:64.5%;min-height: 50px" name="solution" required form="addques" ><%= solution%></textarea>        
        </br>
<!--        <label for="">Preview   Image   PDF</label>
    -->    </br>
    
    <%
    con.close();
    %>
    <input style="width:30%;margin-bottom: 2%;background: #55ACEE;padding: 10px" type="submit" value="Update" ></input>
           <button style="width:30%;margin-bottom: 2%;background: #55ACEE;padding: 10px" type="submit" formaction=deleteQuestion>Delete</button>
       
        </div>
        
        </form>
            
        </div>
            
        </div>
<%
}//if (rs.next()) ends here
            else{
                response.sendRedirect("modify.jsp?alerttitle=Please Enter A Valid QID");
            }

     }
     catch(Exception e){out.println(e);}
%>
</body>
</html>
