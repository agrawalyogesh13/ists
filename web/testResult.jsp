
<%-- 
    Document   : test1
    Created on : Mar 14, 2018, 5:37:55 PM
    Author     : hp
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
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
    
    String resp = request.getParameter("response");
    String responseArray[];
        
    //handling null and blanks
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

%>

    <%!
    String qid=null,question=null,option1=null,option2=null,option3=null,option4=null,answer=null,solution=null,avgtime=null,nou=null,nocu=null,level=null;
    String qtime=null,qresponse=null,qscore=null;
    int test_no=1;
// fetch testno from u<umobile> table
//store nou, nocu,avgtime in qdata table
    String utable_query, qdata_query, udata_query,utable_testno_query;
    ResultSet set;
    Statement st_test_no;
    PreparedStatement ps_utable,ps_qdata_table,ps_udata_table;
    Connection con;
    
    %>
<%
    
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ISTS","root","root");

        utable_testno_query="select max(testno) from u"+umobile;
        st_test_no = con.createStatement();
        set = st_test_no.executeQuery(utable_testno_query);
        if(set.next()){
            test_no = set.getInt(1);
            test_no++;
        }
 
       //utable updation u<umobile>
        utable_query="insert into u"+umobile+" values (?,?,?,?,?,?,?,?,?,?,?,?,null,?,?,?)";
        ps_utable = con.prepareStatement(utable_query);
        //utable updation u<umobile>

        //qdata table updation        
        qdata_query = "update qdata set avgtime=?,nou=?,nocu=? where qid=?";
        ps_qdata_table = con.prepareStatement(qdata_query);
        //qdata table updation
        
        }
        catch(Exception e){
            out.print(e);
        }

%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Result</title>
        <style>
            *{
                box-sizing:border-box;
                padding: 0;
                margin: 0;
            }
            body{
                min-width: 420px;
                padding: 10px;
                background: white;
            }
            p{
                font-size: 17px;
            }
            body::-webkit-scrollbar {
                width: .6em;
            }
            
            body::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            }
                    
            body::-webkit-scrollbar-thumb {
                background-color: #1aa3ff;
                outline: 1px solid slategrey;
                border-radius:20%;
            }
            .home{
                width: 5%;
                height: 60px;
                min-width: 20px;
                position: fixed;
                right: 10px;
                bottom: 10px;
                border: 1px solid #0e90d2;
                
            }
            .home a img{
                display: table;
                width: 100%;
                height: 100%;
            }
            
            .header{
                background: white;
                width: 100%;
                height: 150px;
                min-width: 400px;
            }
            .header img{
                height: 100%;
                width: 15%;
                float: left;
            }
            #title{
                text-align: center;
                height: 100%;
                width: 65%;
                padding: 40px;
                float: left;
            }
            #test_no{
                float: left;
                width: 20%;
                text-align: center;
                padding-top: 40px;
            }
            .container{
                width: 100%;
            }
            .leftcolumn{
                width: 75%;
                background: #1aa3ff;
                float: left;
                padding: 10px 10px 0px 10px;
            }
            .card table{;
                width: 100%;
            }
            td{
                padding-bottom: 10px;
                text-align: left;
            }
            .rightcolumn{
                width: 25%;
                background: #1aa3ff;
                float: left;
                padding: 10px;
            }
               .card {
                background-color: white;
                padding: 20px;
                }
                .footer{
                    width: 75%;
                    margin-top: 20px;
                    background: gray;
                    padding: 10px;
                    text-align: center;
                }
                .btn{
                    padding: 10px;
                    margin: 0px 10px;
                }
                .row{
                }
                .solution{
                    display:none;
                }
                .showbtn{
                    padding: 10px;
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
        padding:10px 0px;
    }
    .footer{
        width:100%;
    }
    
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media (max-width: 400px) {
    
    
}
        </style>
    </head>
    
    <body>
        <div class="home">
            <a href="uhome.jsp"><img src="image/home.png" alt="ISTS" ></a>
        </div>
        
        <div class="header">
            <a title="Back To Home" href="uhome.jsp"><img src="image/ISTS_logo.jpg"></a>
            <h1 id="title" >Test Analysis</h1>
        <h2 id="test_no" >Test No. </br><%=test_no%></h2>
        </div>        

        <%
        int length = responseArray.length;
        int index=0;
//        out.print(responseArray);
        for(int i=0;i<(length/14);i++){   // will run upto no of questions attempted, as 14 fields are appended
            // Below code will fetch the 14 fields w.r.t each question
                
                qid = responseArray[index]; 
                index++;
                qtime = responseArray[index];
                index++;
                qresponse = responseArray[index];
                index++;
                qscore = responseArray[index];
                index++;
                question = responseArray[index];
                index++;
                option1 = responseArray[index];
                index++;
                option2 = responseArray[index];
                index++;
                option3 = responseArray[index];
                index++;
                option4 = responseArray[index];
                index++;
                answer = responseArray[index];
                index++;
                solution = responseArray[index];
                index++;
                avgtime = responseArray[index];
                index++;
                nou = responseArray[index];
                index++;
                nocu = responseArray[index];
                index++;
                level = responseArray[index];
                index++;
                %>
                <!--html code here-->
        <div class="row">
            
            <div class="leftcolumn">
                <div class="card">
                    <h2>Q. <%=i+1%></h2></br>
                    <p><%=question%></p>
                </div>
                <div class="card" style="padding-bottom: 0px;padding-top: 0px">
                    <p><strong>A.</strong>&nbsp;<%=option1%></p></br>
                    <p><strong>B.</strong>&nbsp;<%=option2%></p></br>
                    <p><strong>C.</strong>&nbsp;<%=option3%></p></br>
                    <p><strong>D.</strong>&nbsp;<%=option4%></p>
                </div>
                <div class="card">
                    <button class="showbtn" id="btnsolution<%=i+1%>" onclick="show(<%=i+1%>)" >Show Solution</button>
                    <div class="solution" id="solution<%=i+1%>">
                        <p></br><%=solution%></p>
                    </div>                    
                </div>
            </div>
                    <%
                    String qstatus="Incorrect";
                    if(qresponse.equals(answer)){
                        qstatus="Correct";
                        %>
                        <div class="rightcolumn" style="background: #32CD32" >
                     <%
                    }
                    else if("Not Answered".equals(qresponse)){
                        qstatus="N/A";
                        %>
                        <div class="rightcolumn" style="padding-left: 0px" >
                     <%
                    }
                    else{
                        %>
                        <div class="rightcolumn" style="background: #ff6347" >
                     <%
                    }
                    
                    %>
                <div class="card">
                    <p><%=qstatus%></p>
                </div>
                 <div class="card" style="padding-top: 0px" >
                <p>Your Response&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=qresponse%></p>
                <p>Correct Response&nbsp;:&nbsp;<%=answer%></p>
                <p>Profile Score&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=qscore%></p>
                <p>Question ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=qid%></p>
                <p>Your Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <%=qtime%> Sec</p>
                <p title="Average Time Taken By Correct Users" >Users Avg Time &nbsp;: <%=avgtime%> Sec</p>
                <p>Attempts&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <%=nou%></p>
                <p>Correct Attempts : <%=nocu%></p>
                </div>
           </div>
            
        </div>
                <!--html code here-->
                <%
                //utable updation u<umobile>
                ps_utable.setString(1, qid);
                ps_utable.setInt(2, Integer.parseInt(qtime));
                ps_utable.setString(3, qresponse);
                ps_utable.setInt(4, (int)Double.parseDouble(qscore));
                ps_utable.setInt(5, test_no);
                ps_utable.setString(6, question);
                ps_utable.setString(7, option1);
                ps_utable.setString(8, option2);
                ps_utable.setString(9, option3);
                ps_utable.setString(10, option4);
                ps_utable.setString(11, answer);
                ps_utable.setString(12, solution);
                ps_utable.setInt(13, Integer.parseInt(avgtime));
                ps_utable.setInt(14, Integer.parseInt(nou));
                ps_utable.setInt(15, Integer.parseInt(nocu));
                ps_utable.addBatch();
                //utable updation u<umobile>
                
                //qdata table updation
        
                ps_qdata_table.setInt(1, Integer.parseInt(avgtime));
                ps_qdata_table.setInt(2, Integer.parseInt(nou));
                ps_qdata_table.setInt(3, Integer.parseInt(nocu));
                ps_qdata_table.setString(4, qid);
                ps_qdata_table.addBatch();
                //qdata table updation
               
               }// for loop ends here
               try{
                ps_utable.executeBatch();//executing the utable updation batch
                ps_qdata_table.executeBatch(); //executing the qdata table updation batch
                   
               }
               catch(Exception ex){
                   out.print(ex);
               }
                
                udata_query= "update userdata set oscore=?, aptiscore=? where mobile="+umobile;
                ps_udata_table = con.prepareStatement(udata_query);//(int)Double.parseDouble(qscore)
                ps_udata_table.setInt(1, (int)Double.parseDouble(qscore));
                ps_udata_table.setInt(2, (int)Double.parseDouble(qscore));
                ps_udata_table.executeUpdate();
                con.close();
                int upd_uscore = (int)Double.parseDouble(qscore);
                String updated_uscore = Integer.toString(upd_uscore);
                session.setAttribute("uscore", updated_uscore); //Updating the session attribute uscore each time user gives a test
                
                %>
    <script type="text/javascript">
        
        function show(x){
            var button = document.getElementById("btnsolution"+x);
            
            if(button.innerHTML=="Show Solution"){
                button.innerHTML="Hide Solution";
                document.getElementById("solution"+x).style.display = "table";
            }
            else{
                button.innerHTML="Show Solution";
                document.getElementById("solution"+x).style.display = "none";
            }   
        }
        
  </script>
        
    </body>
    
</html>
