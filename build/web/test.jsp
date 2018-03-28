<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
    <%
            //disabling CTRL key
   /*     document.onkeydown = function(e) {
            if (e.ctrlKey||e.keyCode==123||e.keyCode==116) {
                return false;
            }
            else {
                return true;
            }
};
*
*/
            //disabling CTRL key

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
    %>
    <%!
    String umobile;
    ResultSet set[]=new ResultSet[3];
    PreparedStatement ps_set1,ps_set2,ps_set3;
    Connection con;
    
    %>
    <%
    String questionquery, question=null, option1=null, option2=null, option3=null, option4=null,answer=null, qid=null,solution=null;
    int avgtime, nou, nocu;
    //nou = no of users attempted that ques
    //nocu = no of users correctly attempted that question
    //avgtime = avgtime taken by the users who correctly attempted that question
    umobile = (String)session.getAttribute("umobile");
    
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ISTS","root","root");
        
        questionquery="select * from qdata where level=1 and qid not in (select qid from u" +umobile+") order by rand() limit 10";        
        ps_set1=con.prepareStatement(questionquery);
        set[0] = ps_set1.executeQuery();
        
        questionquery="select * from qdata where level=2 and qid not in (select qid from u"+umobile+") order by rand() limit 10";
        ps_set2 = con.prepareStatement(questionquery);
        set[1] = ps_set2.executeQuery();
        
        questionquery="select * from qdata where level=3 and qid not in (select qid from u"+umobile+") order by rand() limit 10";
        ps_set3 = con.prepareStatement(questionquery);
        set[2] = ps_set3.executeQuery();
      
        %>
        <script>
          //ques, option1, option2, option3, option4, answer, qid, solution, avgtime, nou, nocu
          
           var qarray = new Array(3);
            for (var i = 0; i < qarray.length; ++i) {
                qarray[i] = new Array(10);
                for(var j=0;j<qarray[i].length;++j){
                    qarray[i][j]=new Array(11);
                }
            }

         // var resparray=[[],[],[],[],[],[],[],[],[],[]];//stores QID, RESPONSE TIME, RESPONSE for individual usertable
        </script>
        <%
                int i=0,j;
                for(;i<3;i++){
                    j=0;
                while(set[i].next()){

                             //ques, option1, option2, option3, option4, answer, qid, solution, avgtime, nou, nocu
                    
                    question = set[i].getString("ques");
                    //replacing new line characters entered from windows,mac,linux while adding questions with </br> tag
                    question = question.replaceAll("[\\r\\n|\\r|\\n]", "</br>").replaceAll("[ ]{2,}", "&nbsp;");
                    //replaceAll("[ ]{2,}", "&nbsp;") replaces the white space (atleast 2) with &nbsp
                    
                    option1 = set[i].getString("option1");
                    //replacing new line characters entered from windows,mac,linux while adding questions with </br> tag
                    option1 = option1.replaceAll("[\\r\\n|\\r|\\n]", "</br>").replaceAll("[ ]{2,}", "&nbsp;");
                    
                    option2 = set[i].getString("option2");
                    //replacing new line characters entered from windows,mac,linux while adding questions with </br> tag
                    option2 = option2.replaceAll("[\\r\\n|\\r|\\n]", "</br>").replaceAll("[ ]{2,}", "&nbsp;");
                    
                    option3 = set[i].getString("option3");
                    //replacing new line characters entered from windows,mac,linux while adding questions with </br> tag
                    option3 = option3.replaceAll("[\\r\\n|\\r|\\n]", "</br>").replaceAll("[ ]{2,}", "&nbsp;");
                    
                    option4 = set[i].getString("option4");
                    //replacing new line characters entered from windows,mac,linux while adding questions with </br> tag
                    option4 = option4.replaceAll("[\\r\\n|\\r|\\n]", "</br>").replaceAll("[ ]{2,}", "&nbsp;");
                    
                    answer = set[i].getString("answer");
                    //replacing new line characters entered from windows,mac,linux while adding questions with </br> tag
                    answer = answer.replaceAll("[\\r\\n|\\r|\\n]", "</br>").replaceAll("[ ]{2,}", "&nbsp;");

                    qid = set[i].getString("qid");

                    solution = set[i].getString("solution");
                    //replacing new line characters entered from windows,mac,linux while adding solutions with </br> tag
                    solution = solution.replaceAll("[\\r\\n|\\r|\\n]", "</br>").replaceAll("[ ]{2,}", "&nbsp;");
                    //replaceAll("[ ]{2,}", "&nbsp;") replaces the white space (atleast 2) with &nbsp
                    
                    avgtime = set[i].getInt("avgtime");
                    nou     = set[i].getInt("nou");
                    nocu    = set[i].getInt("nocu");

        %>
        <script>
                        qarray[<%=i%>][<%=j%>][0]="<%=question%>";  //question in qarray[i][j][0]
                        qarray[<%=i%>][<%=j%>][1]="<%=option1%>";   //option1 in qarray[i][j][1]
                        qarray[<%=i%>][<%=j%>][2]="<%=option2%>";   //option1 in qarray[i][j][2]
                        qarray[<%=i%>][<%=j%>][3]="<%=option3%>";   //option1 in qarray[i][j][3]
                        qarray[<%=i%>][<%=j%>][4]="<%=option4%>";   //option1 in qarray[i][j][4]
                        qarray[<%=i%>][<%=j%>][5]="<%=answer%>";    //answer in qarray[i][j][5]
                        qarray[<%=i%>][<%=j%>][6]="<%=qid%>";       //question ID in qarray[i][j][6]
                        qarray[<%=i%>][<%=j%>][7]="<%=solution%>";       //Solution in qarray[i][j][7]
                        qarray[<%=i%>][<%=j%>][8]="<%=avgtime%>";       //avgtime in qarray[i][j][8]
                        qarray[<%=i%>][<%=j%>][9]="<%=nou%>";       //nou in qarray[i][j][9]
                        qarray[<%=i%>][<%=j%>][10]="<%=nocu%>";       //nocu in qarray[i][j][10]
                        
        </script>
        
        <%
                    j++;
             
                }
                
                }
 
        
        
 }
        catch(Exception e){
            out.print(e);
        }
    %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Test Page</title>
        
        <style>
            *{
                box-sizing:border-box;
                padding: 0;
                margin: 0;
            }
            body{
                min-width: 420px;
                padding: 10px;
                background: pink;
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
            .header h1{
                text-align: center;
                height: 100%;
                width: 65%;
                padding: 40px;
                float: left;
                border: 1px solid black;
            }
            .header h2{
                float: left;
                width: 20%;
                text-align: center;
                padding-top: 40px;
            }
            .leftcolumn{
                width: 75%;
                background: red;
                float: right;
                padding: 10px;
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
                background: blue;
                float: right;
                padding: 10px;
            }
               .card {
                background-color: yellow;
                padding: 20px;
                margin-top: 20px;
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
    .footer{
        width:100%;
    }
    
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media (max-width: 400px) {
    
    
}
            
        </style>
        
        
    </head>
    
    <body oncontextmenu=" return false " ><!-- Disabling right click -->
        <p id="score"></p>
        <form action="testResult.jsp" name="form" >
        <div class="header">
            <img src="image/ISTS_logo.jpg"></img>
        <h1>Prepare Module</h1>
        <h2 id="clock" >Time Left </br></h2>
        </div>
        
        <div class="row">
            
            <div class="rightcolumn">
                <div class="card" id="timeout" style=" text-align: center "  >
                </div>
           
            </div>
            <div class="leftcolumn">
                <!-- Question Card -->
                <div class="card" >   
                    <p id="question"><b>Question </b></p>
                </div>  
                
                <div class="card">
                    <table>
                      <colgroup>
                        <col  style="width: 40px;">
                      </colgroup>
                        
                        <tr>
                            <td valign="top" id="radio1" >
                                <input type="radio" required name="answer" id="answer" value="A"></input><label><b>A.</b></label>
                        </td>
                        <td valign="top">
                        <label id="option1" ></label>
                        </td>
                        </tr>
                    
                        <tr>
                            <td valign="top" id="radio2">
                        <input type="radio" name="answer" id="answer" value="B"></input><label><b>B.</b></label>
                        </td>
                        <td valign="top">
                        <label id="option2" ></label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" id="radio3">
                        <input type="radio" name="answer" id="answer" value="C"></input><label><b>C.</b></label>
                        </td>
                        <td valign="top">
                        <label id="option3" ></label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" id="radio4">
                        <input type="radio" name="answer" id="answer" value="D"></input><label><b> D.</b></label>
                        </td>
                        <td valign="top">
                        <label id="option4" ></label>
                        </td>
                        </tr>
                    </table>
                    
                </div>
            </div>
            
        </div>
        
        <div class="footer">
            <input class="btn" id="nextbutton" type="button" onclick="nextQuestion()" value="Next" ></input>
            
            <!--this will take all the user table entries -->
            
            <input type="text" id="response" name="response" ></input>
            
            <!--this will take all the user table entries -->
            <!--
            <button class="btn" type="submit" formaction="testresult.jsp">Leave</buttton>
            -->
        </div>
        
        
        
    </form>
        
        <!-- Alert Box Designing JS & CSS imported sheets -->
          <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
        <!-- Alert Box Designing JS & CSS imported sheets -->

        <script type="text/javascript">
            var no_of_questions = parseInt(10);
            
            var pscore          = <%=uscore%>;                       //taking jsp variable uscore in js as pscore                        
            var avg_pscore = parseFloat(pscore);                     // Will be used to carry average pscore
            var current_pscore = parseFloat(pscore);                 // Will be used to carry current question pscore
            var increment =parseFloat(1);
            var decrement =parseFloat(-1);
            var no_of_obs = 0;
            var previous; // It means 'a' flag
            var next; // It means 'b' flag
            var reset; // It means 'reset' flag
            var g_bound; //Retains the previous bound of the question, c_bound will hold the next question's bound
            var reset_bound;
            
            //just to check profile score changes
            var scoreID = document.getElementById("score");
            scoreID.innerHTML=pscore;
            //just to check profile score changes
            
            var answer; //response given by user for current question
            var level; //level of the question (Dynamic)
            var qno = parseInt(0); //Index starts from 0, thats why
            
            var total_seconds=parseInt(60); //Duration of the test in seconds
            var responsetime=parseInt(0); //Response time of the user per question
            var c_minutes=parseInt(total_seconds/60);
            var c_seconds=parseInt(total_seconds%60);
            var responseID = document.getElementById("response");
            
            //setting level for 1st question
                        
            if(pscore<=33){
                 level=parseInt(0); //index 0 of qarray for level 1
                 g_bound=parseInt(0);//Retains the previous bound of the question
            }
            else if(pscore<=67){
                level=parseInt(1); //index 1 of qarray for level 2
                 g_bound=parseInt(1);//Retains the previous bound of the question
            }
            else{
                    level=parseInt(2); //index 2 of qarray for level 3
                     g_bound=parseInt(0);//Retains the previous bound of the question
                }
            
            //setting level for 1st question
            
            
            function checkTime(){
                
                if(c_minutes<10){//Appending 0 before minutes bcz less than 10
                    if(c_seconds<10){//Appending 0 before minutes & seconds both bcz both are less than 10
                        document.getElementById("clock").innerHTML= 'Time Left </br>0'+c_minutes + ':0'+c_seconds;
                        }
                    else{//Appending 0 before minutes bcz less than 10 but not before seconds
                        document.getElementById("clock").innerHTML= 'Time Left </br>0'+c_minutes + ':'+c_seconds;
                    }
                }
                else{//Not Appending 0 before minutes bcz not less than 10
                    if(c_seconds<10){//Appending 0 before seconds if less than 10 but not before minutes
                        document.getElementById("clock").innerHTML= 'Time Left </br>'+c_minutes + ':0'+c_seconds;
                        }
                    else{//Not Appending 0 before seconds bcz not less than 10 and not before minutes
                        document.getElementById("clock").innerHTML= 'Time Left </br>'+c_minutes + ':'+c_seconds;
                    }
                    }
                    
                    if(total_seconds<0){
                        testStopConfirm();
                    }
                    else{
                        responsetime++;
                        total_seconds=total_seconds-1;
                        c_minutes=parseInt(total_seconds/60);
                        c_seconds=parseInt(total_seconds%60);
                        setTimeout("checkTime()", 1000);
                    }
                }
                function findID(x){
                    return document.getElementById(x);
                }
                
            function nextQuestion(){
                
                var radio1=findID("radio1");        var radio2=findID("radio2");
                var radio3=findID("radio3");        var radio4=findID("radio4");
                var question=findID("question");    var option1=findID("option1");
                var option2=findID("option2");      var option3=findID("option3");
                var option4=findID("option4");      var timeout=findID("timeout");
                
                if(qno==0){ //for 1st question only
                question.innerHTML='<b>Question. '+(qno+1)+'</b></br></br>'+qarray[level][qno][0];
                option1.innerHTML=qarray[level][qno][1];
                option2.innerHTML=qarray[level][qno][2];
                option3.innerHTML=qarray[level][qno][3];
                option4.innerHTML=qarray[level][qno][4];
                timeout.innerHTML="<h2>Question ID</br>"+qarray[level][qno][6] +" </h2>";//Displaying QID in timeout section
                qno++;
                }
                else{ //for rest of the question
                    //resparray[qno-1][1]=responsetime;
                    //responsetime=0;
                    checkAnswer();
                    if(qno==(no_of_questions-1)){
                        document.getElementById("nextbutton").value="Submit";
                    }
                     if(qno>(no_of_questions-1)){
                         testStopConfirm();
                     }
                

                question.innerHTML='<b>Question. '+(qno+1)+'</b></br></br>'+qarray[level][qno][0];
                radio1.innerHTML=
                    '<input type="radio" required name="answer" id="answer" value="A"></input><label><b>A.</b></label>';
                option1.innerHTML=qarray[level][qno][1];
                
                radio2.innerHTML=
                    '<input type="radio" name="answer" id="answer" value="B"></input><label><b>B.</b></label>';
                option2.innerHTML=qarray[level][qno][2];
                
                radio3.innerHTML=
                    '<input type="radio" name="answer" id="answer" value="C"></input><label><b>C.</b></label>';
                option3.innerHTML=qarray[level][qno][3];
                
                radio4.innerHTML=
                    '<input type="radio" name="answer" id="answer" value="D"></input><label><b> D.</b></label>';
                option4.innerHTML=qarray[level][qno][4];
                timeout.innerHTML="<h2>Question ID</br>"+qarray[level][qno][6] +" </h2>";//Displaying QID in timeout section
                qno++;
                }
            }
            function checkAnswer(){
                //store qid of the attempted question
                responseID.value+=qarray[level][qno-1][6]+"$_$";
                //store qtime
                responseID.value+=responsetime+"$_$";
                
                var choices=document.getElementsByName("answer");
                
                for(var i=0;i<choices.length;i++){
                    if(choices[i].checked){
                        answer = choices[i].value;
                    }
                }
                if( answer=="A" || answer=="B" || answer=="C" || answer=="D"){
                    //resparray[qno-1][2]= answer;
                }
                else{
                    //resparray[qno-1][2]="Not Answered";
                    answer="Not Answered";
                }
                //store qresponse
                responseID.value+=answer+"$_$";
                matchAnswer();
             }
             //matchAnswer function checks for answer and calculates new profile score
             function matchAnswer(){
                 alert(answer);
                 //Logic for resetting inc dec if consecutive right then wrong encountered
                 if(qarray[level][qno-1][5]==answer){
                     alert("right");
                     
                     if(qno==1){
                         previous=1;
                     }
                     else{
                         next=1;
                         reset = ((previous&next)|(!previous&!next));//(XNOR = (a&b)|(!a&!b))
                         if(reset==0){
                             no_of_obs=0;
                             increment=1;
                             decrement=-1;
                             avg_pscore=current_pscore;
                         }
                         previous = next;
                     }
                     
                     increment = levelCalculator(increment);//will calculate level and profile score
                        
                        var avgtime    = parseInt(qarray[level][qno-1][8]);
                        var nou        = parseInt((qarray[level][qno-1][9]));
                        var nocu       = parseInt(qarray[level][qno-1][10]);
                        avgtime    =   ((avgtime*nocu)+responsetime)/(nocu+1);
                        nou++;
                        nocu++;
                         responseID.value+= avgtime+"$_$";                              //avgtime
                         responseID.value+= nou+"$_$";                                //nou
                         responseID.value+= nocu+"$_$";                               //nocu                        
                        
                     
                     if(reset_bound==0){
                        alert("reset bounds");
                        no_of_obs =0;
                        increment =1;
                        decrement = -1;
                        avg_pscore=current_pscore;
                        alert("resent ends");
                    }
                     
                     scoreID.innerHTML=current_pscore;
                     answer=undefined;
                 }
                 //Logic for Not Answered question
                 else if(answer.localeCompare("Not Answered")==0){
                     alert("Not Answered");
                     
                     levelCalculator(parseInt(0));//will calculate level and profile score
//
                        var avgtime    = parseInt(qarray[level][qno-1][8]);
                        var nou        = parseInt((qarray[level][qno-1][9]));
                        var nocu       = parseInt(qarray[level][qno-1][10]);
                        nou++;
                         responseID.value+= avgtime+"$_$";                              //avgtime
                         responseID.value+= nou+"$_$";                                //nou
                         responseID.value+= nocu+"$_$";                               //nocu                        

//
                     scoreID.innerHTML=current_pscore;
                     answer=undefined;
                 }
                 //Logic for Not Answered question
                 
                 //Logic for wrong answer
                 else{
                     alert("wrong");
                     
                     if(qno==1){
                         previous=0;
                     }
                     else{
                         next=0;
                         reset = ((previous&next)|(!previous&!next));//(XOR = (a&b)|(!a&!b))
                         if(reset==0){
                             no_of_obs=0;
                             increment=1;
                             decrement=-1;
                             avg_pscore=current_pscore;
                         }
                         previous = next;
                     }
                     
                     decrement = levelCalculator(decrement);//will calculate level and profile score                     
//
                        var avgtime    = parseInt(qarray[level][qno-1][8]);
                        var nou        = parseInt((qarray[level][qno-1][9]));
                        var nocu       = parseInt(qarray[level][qno-1][10]);
                        nou++;
                         responseID.value+= avgtime+"$_$";                              //avgtime
                         responseID.value+= nou+"$_$";                                //nou
                         responseID.value+= nocu+"$_$";                               //nocu                        

//
                     
                     if(reset_bound==0){
                        alert("reset bounds");
                        no_of_obs =0;
                        increment =1;
                        decrement = -1;
                        avg_pscore=current_pscore;
                        alert("resent ends");
                    }

                     scoreID.innerHTML=current_pscore;
                     answer=undefined;
                  }
                  //Logic for wrong answer
                 responsetime=0;
             }
             function levelCalculator(x){
                 var sDeviation=parseFloat(0);
                 var c_bound;//c_bound will hold the next question's bound
                 
                 no_of_obs++;// Incrementing the consecutive occurances of observations
                 current_pscore=current_pscore+x;
                 current_pscore = parseFloat(current_pscore.toFixed(2)); //Rounding off score upto 2 digits
                 
                 //if you wish to have slight varitions just put a limt or change in the value of x
                 //appending current_pscore, ques,op1,op2,op3,op4,answer,sol,avgtime,nou,nocu
                 
                 responseID.value+=current_pscore+"$_$";              //profile score
                 responseID.value+=qarray[level][qno-1][0]+"$_$";     //question
                 responseID.value+=qarray[level][qno-1][1]+"$_$";     //option1
                 responseID.value+=qarray[level][qno-1][2]+"$_$";     //option2
                 responseID.value+=qarray[level][qno-1][3]+"$_$";     //option3
                 responseID.value+=qarray[level][qno-1][4]+"$_$";     //option4
                 responseID.value+=qarray[level][qno-1][5]+"$_$";     //answer
                 responseID.value+=qarray[level][qno-1][7]+"$_$";     //solution, note - qarray[level][qno-1][6] par qid hai
                 
                 
                 if(current_pscore<0){
                     current_pscore=0;
                 }
                 if(current_pscore>100){
                     current_pscore=100;
                 }
                 
                 avg_pscore = ((avg_pscore)*(no_of_obs)+(current_pscore))/(no_of_obs+1);
                 
                    sDeviation = (current_pscore - avg_pscore)/(Math.sqrt(no_of_obs+1));
                    
                    x=x+sDeviation;
                    
            if(current_pscore<=33){
                 level=parseInt(0); //index 0 of qarray for level 1
                 c_bound = parseInt(0);
            }
            else if(current_pscore<=67){
                level=parseInt(1); //index 1 of qarray for level 2
                c_bound=parseInt(1);
            }
            else{
                    level=parseInt(2); //index 2 of qarray for level 3
                 c_bound = parseInt(0);
                }
                reset_bound = ((g_bound&c_bound)|(!g_bound&!c_bound));//(XNOR = (a&b)|(!a&!b))
                g_bound=c_bound;
                return x;
                }
                
                
            //Function For Alert Box When The Test Loads Starts Here
            function testStartConfirm(){
                swal({   title: "Your Test Will Start Now!",   
                text: "Are you ready to proceed?",   
                type: "warning",   
                showCancelButton: true,     
                confirmButtonColor: "#DD6B55",   
                confirmButtonText: "Yes, I Am Ready To Begin!",   
                cancelButtonText: "No, I Am not!",   
                closeOnConfirm: true,   
                closeOnCancel: false }, 
                function(isConfirm){   
                    if (isConfirm) 
                        {
                            checkTime();//Clock is set, and the 1st question is displayed
                            nextQuestion();
                
                        } 
                    else { location.href='uhome.jsp';} });
            }
            //Function For Alert Box When The Test Loads Ends Here
            //
            //Function For Alert Box When The Test Ends, Starts Here
            function testStopConfirm(){
                swal({   title: "Your Test Is Completed!",   
                text: "See Results!",   
                type: "warning",   
                showCancelButton: false,     
                confirmButtonColor: "#DD6B55",   
                confirmButtonText: "Yes",   
                cancelButtonText: "No, I Am not!",   
                closeOnConfirm: false,   
                closeOnCancel: false }, 
                function(isConfirm){   
                    if (isConfirm) 
                        {
                            document.form.submit();//Test is finally submitted here!
                        }
                    }
                );
            }
            //Function For Alert Box When The Test Ends, Ends Here
            
            testStartConfirm();
        </script>
        
    </body>
</html>