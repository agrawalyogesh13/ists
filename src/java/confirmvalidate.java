import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;



public class confirmvalidate extends HttpServlet {
Connection con;
String s,query,deletequery,email,authorize,delete;
PrintWriter out;
Statement sm,st;
RequestDispatcher r;
    @Override
    public void destroy() {
        try {
            con.close();
        } catch (SQLException ex) {
          out.print(ex);
        }
    }

    @Override
    public void init() throws ServletException {
        try{
           Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ists","root","root");
            
        }catch(Exception e){out.println(e);}
    }

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        try {
            
            String users[]=request.getParameterValues("check");
            
            
            if (users!=null){
            authorize=request.getParameter("authorize");
            delete= request.getParameter("delete");
            
            
            
            //if request is to delete admin
            if(delete!=null){
                
                //r = request.getRequestDispatcher("deladminreq");
                //r.forward(request, response);
                //deleteadminreq servlet deleted as it was no longer needed!
                st= con.createStatement();
                for(int i=0;i<users.length;i++){
                    email = users[i];
                    email = email.replace("%40","@");
                    deletequery="delete from admindata where email = '"+email+"'";
                    st.executeUpdate(deletequery);
                }
                
                out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
                out.print("<center>Admin Requests has been successfully Deleted");
                out.print("</br><a href=ahome.jsp>Home</a></center></h2></body></html>");
                
            }
            else{
            sm = con.createStatement();
                for(int i=0;i<users.length;i++){
                    email = users[i];
                    email = email.replace("%40","@");
                    query="update admindata set valid='yes' where email='"+email+"'";
                    sm.executeUpdate(query);
                }
            
                // Sending new admin a mail confirming his authorization on ExamHub
                //r = request.getRequestDispatcher("adminauthorizemail");
                //r.forward(request, response);            
            out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
            out.print("<center>Admin has been successfully aproved");
            out.print("</br><a href=ahome.jsp>Home</a></center></h2></body></html>");
            
            }
            }
            else{
            out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
            out.print("<center>Please Select an Admin");
            out.print("</br><a href=ahome.jsp>Home</a></center></h2></body></html>");
            
            }
        
        }
        catch(Exception e){
            e.printStackTrace(out);

        }
        finally {            
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
