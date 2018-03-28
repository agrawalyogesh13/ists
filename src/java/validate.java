import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class validate extends HttpServlet {
    HttpSession session;
    ResultSet rs;
    Statement s;
    Connection con;
    String query,email;
    PrintWriter out;

    @Override
    public void init() throws ServletException {
        try{
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ists","root","root");
            
        }catch(Exception e){out.println(e);}
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
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        try {
            
            query = "select * from admindata where valid is null";
            s = con.createStatement();
            rs=s.executeQuery(query);
            if(rs.next()){
                out.println("<html><head><title>Validate Admin</title></head><body><form action=\"confirmvalidate\"><h2><center>Hi, Admin</center></h2><br/>");
               
                do{
                    email = rs.getString(3);
               out.println("<pre><h2>               <input type="+"checkbox "+"value="+email+" name=\"check\"><label>Name : "+rs.getString(1)+"   Mobile : "+rs.getString(2)+"   Email : "+email+" </h2></pre>");
               }
                while(rs.next());
                out.println("<pre><h2>               <input type=\"submit\" value=\"authorize\" name=\"authorize\"/>   <input type=\"submit\" value=\"delete\" name=\"delete\"/></pre>");
                out.println("<pre><h2>                <a href=ahome.jsp>Home</a></h2></pre>");
               out.println("</form></body></html>");
            
            }
            else{
                out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
                out.print("<center>No Admin Requests");
                out.print("</br><a href=ahome.jsp>Home</a></center></h2></body></html>");
            }
        }catch(Exception e){
            e.printStackTrace(out);
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
