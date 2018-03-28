import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class update extends HttpServlet {
    
    String qid, question,option1,option2, option3, option4, answer,solution ,quesUpdate;
    Connection con;
  
    PrintWriter out;
        
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
            
            question = request.getParameter("ques");
            option1 = request.getParameter("option1");
            option2 = request.getParameter("option2");
            option3 = request.getParameter("option3");
            option4= request.getParameter("option4");                      
            answer = request.getParameter("answer"); 
            solution = request.getParameter("solution");   
            qid= request.getParameter("qid");
            
          
            quesUpdate = "update qdata set ques=?,option1=?,option2=?,option3=?,option4=?,answer=?,solution=? where qid=?";
            
            PreparedStatement ps = con.prepareStatement(quesUpdate);
            ps.setString(1,question);
            ps.setString(2,option1);
            ps.setString(3, option2);
            ps.setString(4,option3);
            ps.setString(5, option4);
            ps.setString(6, answer);
            ps.setString(7, solution);
            ps.setString(8, qid);
            ps.executeUpdate();
            
            //Creating the question id by appending Subject code, level, topic, qNumber
            
                out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
                out.print("<center>updated!");
                out.print("</br><a href=modify.jsp>Update More</a></center></h2></body></html>");
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
