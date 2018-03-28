import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class addquestion extends HttpServlet {
    
    String qid, subject, topic, level, question, option1, option2, option3, option4, answer,solution,qfetch,quesStore;
    String defaultstatus, subjectindex,topicindex,levelindex;
    Connection con;
    ResultSet rs;
    HttpSession session;
    PrintWriter out;
    int qNumber = 1;
        
    @Override
    public void init() throws ServletException {
        try{
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ists","root","root");
        }catch(Exception e){System.out.println(e);}
    }

    @Override
    public void destroy() {
        try{
      con.close();
      }
      catch(Exception e)
      {
      out.println(e);
      }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        try{
// String qid, subject, topic, level, question, option1, option2, option3, option4, answer,solution;   

          //?subject=APTI&topic=TW&level=01&ques=&answer=A&option1=&option2=&option3=&option4=&solution=
            
            subject = request.getParameter("subject");
            topic = request.getParameter("topic");
            level = request.getParameter("level");
            question = request.getParameter("ques");
            option1 = request.getParameter("option1");            
            option2 = request.getParameter("option2");            
            option3 = request.getParameter("option3");
            option4 = request.getParameter("option4");            
            answer = request.getParameter("answer"); 
            solution = request.getParameter("solution");   
            
            //setting default subject, topic, level
            
            defaultstatus = request.getParameter("defaultstatus");
            subjectindex  = request.getParameter("subjectindex");
            topicindex    = request.getParameter("topicindex");
            levelindex    = request.getParameter("levelindex");
            //out.print(subjectindex+" "+topicindex+" "+levelindex);
            session = request.getSession();
            session.setAttribute("defaultstatus", defaultstatus);
            session.setAttribute("subjectindex",subjectindex);
            session.setAttribute("topicindex",topicindex );           
            session.setAttribute("levelindex",levelindex );            
            
            //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //
    
    //Authentication
    String uname = (String)session.getAttribute("uname");
    String utype = (String)session.getAttribute("utype");
    int flag=0;
            if(uname!=null || utype!=null)
                if(utype.equals("Admin"))
                    flag=1;
    if(flag==0)
        response.sendRedirect("loggedoff.jsp");
  //
            
            
            //
            qfetch = "select max(qno) from qdata where subject=? and topic=? and level=?";
            
            PreparedStatement ps = con.prepareStatement(qfetch);
            ps.setString(1,subject);
            ps.setString(2,topic);
            ps.setString(3,level);
            rs = ps.executeQuery();
            if(rs.next()) {
            qNumber = rs.getInt(1);
            qNumber++;
            }
            //Creating the question id by appending Subject code, level, topic, qNumber
            
            qid = subject+level+topic+qNumber;
            
            
            quesStore = "insert into qdata values (?,?,?,?,?,?,?,?,?,?,?,?,null,0,0,0)";
            PreparedStatement psinsert = con.prepareStatement(quesStore);
            psinsert.setString(1, qid);
            psinsert.setString(2, subject);
            psinsert.setString(3, topic);
            psinsert.setInt(4, Integer.parseInt(level));
            psinsert.setInt(5, qNumber);
            psinsert.setString(6, question);
            psinsert.setString(7, option1);
            psinsert.setString(8, option2);
            psinsert.setString(9, option3);
            psinsert.setString(10, option4);
            psinsert.setString(11, answer);
            psinsert.setString(12, solution);
             
            psinsert.executeUpdate();
                
                out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
                out.print("<center>Question Successfully Added!");
                out.print("</br><a href=addquestion.jsp>Add More</a></center></h2></body></html>");
        }
        catch(Exception e){
         
            e.printStackTrace(out);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
