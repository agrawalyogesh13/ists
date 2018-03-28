import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class profile extends HttpServlet {
    
    String umail,utype,email,profilequery,name,mobile,password;
    // umail will hold either mobile or email of the respective user
    // on click of profile link, utype will find type of user
    Connection con;
    ResultSet rs;
    PreparedStatement ps;
    HttpSession session;
    PrintWriter out;
    boolean flag;

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
        
        // Getting current user session
        session = request.getSession();
        umail = (String) session.getAttribute("umail");
        utype = (String) session.getAttribute("utype");
        if(utype!=null){
        
        if(flag=utype.equals("Admin")){
        profilequery = "select * from admindata where email ='"+umail+"' or mobile ='"+umail+"'";
        }
        else{
        profilequery = "select * from userdata where email ='"+umail+"' or mobile ='"+umail+"'";        
        }
        try {
            ps = con.prepareStatement(profilequery);
            rs = ps.executeQuery();
            if(rs.next()) {
            name = rs.getString("name");
            mobile= rs.getString("mobile");
            password = rs.getString("password");
            email=rs.getString("email");
            
            out.println("<html><head><title>"+name.toUpperCase()+"</title></head><body><h2><center>Hi, "+name.toUpperCase()+"</center></h2><br/>");
               //out.println("<form action="+"mail"+">");
               out.println("<pre><h2>             Name          <input type="+"text "+"value="+ name +" readonly ></h2></pre>");
               out.println("<pre><h2>             Email-ID      <input type="+"text "+"value="+email+" readonly ></h2></pre>");
               out.println("<pre><h2>             Mobile No.    <input type="+"text "+"value="+mobile+" readonly> </h2></pre>");
               out.println("<pre><h2>             Password      <input type="+"text "+"value="+password+" readonly> </h2></pre>");
               
               if(flag)
               out.println("<pre><h2>                           <a href=ahome.jsp>Home</a></h2></pre>");
               else{
               out.println("<pre><h2>                           <a href=uhome.jsp>Home</a></h2></pre>");                   
               out.println("</body></html>");
               }
            
            
            }
//            else{
  //              response.sendRedirect("login.jsp?alerttitle=You are not logged in!");
//         out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
  //       out.print("<center>You are not logged in");
    //     out.print("</br><a href=login.jsp>Login</a></center></h2></body></html>");
    //        }
        }
        catch(Exception e)
        {
            out.print(e);
        }
        finally {            
            out.close();
        }
    }
        else{
            response.sendRedirect("login.jsp?alerttitle=You are not logged in!");
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
