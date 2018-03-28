<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%
    //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //
    
    
    String uname = (String)session.getAttribute("uname");
    String utype = (String)session.getAttribute("utype");
    int flag=0;
            if(uname!=null || utype!=null)
                if(utype.equals("Admin"))
                    flag=1;
    if(flag==0)
        response.sendRedirect("login.jsp?alerttitle=You Are Not Logged In!");
    
    String defaultstatus  = (String)session.getAttribute("defaultstatus");
    String subjectindex   = (String)session.getAttribute("subjectindex");
    String topicindex     = (String)session.getAttribute("topicindex");
    String levelindex     = (String)session.getAttribute("levelindex");               
    %>

<html>
    <head>
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        
        <title>Add Question</title>
        
        <style type="text/css">
            
            .container{
                width:80%;
                float: right;
            }
            
            .menu{
                width:40%;
                float: left;
                margin-top: 8%;
            }
            
            .qsection{
                width:59%;
                float: left;
                
            }
            
        </style>
    </head>
    
    
    <body>
       <!--
        <script>alert("HI")</script>
        -->
        <div class="container">
        <form action=addquestion id="addques">
            
            
            <!--
            Printing default values
            
            <h2><%=defaultstatus%><%=subjectindex%><%=topicindex%><%=levelindex%></h2>
            -->
            
            <div class="menu">     
                <label style=" margin-left:3%; " for="defaultstatus">Default</label>
                <input type="checkbox" name="defaultstatus" value="yes"></input>
        <button style="padding:2px 5px;margin-left: 2%"  type="button" onclick="clearit()">Clear</button>
        </br></br>  
        <label for="subject"><b>Subject</b></label>        
        <select style="width: 50%" onchange="fsubject()" id="subjectID" name="subject" >
            <option value="" selected disabled >SELECT</option>
            <option value="APTI" >Aptitude</option>
        </select>
        </br>
        
        </br>
        
        <label for="topic"><b>Topic</b></label>
        &nbsp;&nbsp;
        <select style="width: 50%" onchange="ftopic()" id="topicID" name="topic" >
            <option value="" selected disabled >SELECT</option>
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

        <select style="width: 50%" onchange="flevel()" id="levelID" name="level" >
            <option value="" selected disabled >SELECT</option>
            <option>01</option>
            <option>02</option>
            <option>03</option>
        </select>
        </div>
        
        <div class="qsection">
            </br>
            <label for="ques"><b>Question</b></label>
            <textarea style="width: 70%" name="ques" placeholder="Enter Question Here" required form="addques"></textarea>
        </br></br>
        <input type="radio" required name="answer" value="A"></input>
        
        <label><b>A.</b></label>
        <input style="width:70%;margin-left: 3%" type="text-area" required name="option1"></input>
        </br></br>
        <input type="radio" name="answer" value="B"></input>
        <label><b>B.</b></label>
        <input style="width:70%;margin-left: 3%" type="text-area" required name="option2"></input>
        </br></br>
        <input type="radio" name="answer" value="C"></input>
        <label><b>C.</b></label>
        <input style="width:70%;margin-left: 3%" type="text-area" required name="option3"></input>
        </br></br>
        <input type="radio" name="answer" value="D"></input>
        <label><b>D.</b></label>
        <input style="width:70%;margin-left: 3%" type="text-area" required name="option4"></input>
        </br></br>

        <label for="solution"><b>Solution/Hint</b></label>
        <textarea style="width:65%" name="solution" required placeholder="Enter Solution Here" form="addques"></textarea>        
        </br>
<!--        <label for="">Preview   Image   PDF</label>
    -->    </br>
        <input style="width:30%;margin-bottom: 2%;background: #55ACEE;padding: 10px" type="submit" onclick="validate();" ></input>
        </div>
        
        <input type="hidden" id="subindex" value="<%=subjectindex%>" name="subjectindex"></input>
        <input type="hidden" id="topindex" value="<%=topicindex%>" name="topicindex"></input>
        <input type="hidden" id="levindex" value="<%=levelindex%>" name="levelindex"></input>
        
        
        <input type="hidden" id="previousdefindex" value="<%=defaultstatus%>"></input>        
        <input type="hidden" id="previoussubindex" value="<%=subjectindex%>"></input>
        <input type="hidden" id="previoustopindex" value="<%=topicindex%>"></input>
        <input type="hidden" id="previouslevindex" value="<%=levelindex%>"></input>
        
        </form>
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
        
        <script>
           
           function fsubject(){
            //var subject = $("#subjectID option:selected").val();
           // alert("HI");
            $(document).ready(function(){
               var subject= $("#subjectID option:selected").val();
               //alert(subject);
            document.getElementById("subindex").setAttribute("value", subject);
        });
    }
        
        function ftopic(){
            //alert("hi");
            $(document).ready(function(){
               var topic= $("#topicID option:selected").val();
            document.getElementById("topindex").setAttribute("value", topic);
        });
            
            //alert(topic);

        }
        
        function flevel(){
            //alert("HI");
            $(document).ready(function(){
               var level = $("#levelID option:selected").val();
               document.getElementById("levindex").setAttribute("value", level);
            })
            
            //alert(level);
            
        }
        
        function validate() {
        
        var subjectID = document.getElementById("subjectID");
        var topicID = document.getElementById("topicID");
        var levelID = document.getElementById("levelID");
        if (subjectID.value == ""||topicID.value == ""||levelID.value == "") { 
            //If the "Please Select" option is selected display error.
            alert("Please select an option!");
            event.preventDefault();
            return false;
        }
//        else{
  //          alert("validate called");
    //    }
        return true;
    }
        
        function checkdefault(){
           // alert("checkdefault called");
            //alert("HIIIIIIIIII");
            var str = document.getElementById("previousdefindex").value;
            var str2 = "yes";
          //  alert("Hello");
            //alert(str);
            if(str.localeCompare(str2)==0){
                // Here if strings are equal, value 0 is returned
               // alert("default is yes");
                setdefault();
            }
                
        }
           
           function setdefault(){
          //  alert("default is yes");
            $(document).ready(function(){
                $('#subjectID').val(document.getElementById("previoussubindex").value);
                $('#topicID').val(document.getElementById("previoustopindex").value);
                $('#levelID').val(document.getElementById("previouslevindex").value);
                $('input[name=defaultstatus]').attr('checked', true);
                })
            }
            
            function clearit(){
                //alert("HI");
            $(document).ready(function(){
                    $('input[name=defaultstatus]').attr('checked', false);
                    $('#subjectID').val("");
                    $('#topicID').val("");
                    $('#levelID').val("");
                
                })
            }
           checkdefault();
           
    </script>
    </body>
</html>