import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class deleteQuestion extends HttpServlet {
    
    String qid,quesDelete;
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
            
              
            qid= request.getParameter("qid");
            
          
           quesDelete= "delete from qdata where qid=?";
            
            PreparedStatement ps = con.prepareStatement(quesDelete);
            ps.setString(1, qid);
            ps.executeUpdate();
            
            //Creating the question id by appending Subject code, level, topic, qNumber
            
                out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
                out.print("<center>Deleted!");
                out.print("</br><a href=modify.jsp>Delete More</a></center></h2></body></html>");
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
