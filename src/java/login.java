import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {

    
    ResultSet rs;
    Connection con;
    PrintWriter out;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String utype = req.getParameter("utype");
        String uname = req.getParameter("uname");//email or mobile entered by user at the time of login
        String password = req.getParameter("password");
        String mobile=null;
        String query;
        String name = null,email=null;
        String valid = null;
        boolean flag = false;
        int userexist=0;
        
        
        //Creating Session of current user
        HttpSession session = req.getSession();
        
            
        if (utype.equals("Admin"))
        {
        query = "select * from admindata where email=? or mobile =?";
        }
        else
        {
        query = "select * from userdata where email=? or mobile =?";
        }
        out = resp.getWriter();
        try {
            //Database connectivity
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ists","root","root");
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, uname);
            rs = ps.executeQuery();
            boolean b = rs.next();
            if(b==true)
            {
                userexist=1;
            String pass = rs.getString("password");
                   name = rs.getString("name");
                   email=rs.getString("email");
                   mobile=rs.getString("mobile");
            if(pass.equals(password))
            {
               flag = true;
            }
            else
            {
                flag = false;
            }
            
            }
        }
        catch (Exception e) {}
    if(userexist==1 && flag==true){
        if(utype.equals("Admin"))
        {
         //checking whether admin is valid or not
         try{
             valid = rs.getString("valid");
         }
         catch(SQLException e){
         e.printStackTrace(out);
         }
         //
         if(!(valid==null)){
             session.setAttribute("uname",name);
            // here uname attribute belongs to the session of current user which contains his name
            session.setAttribute("umail",email);
            //session attribute uname consist of email of the signed up user
            session.setAttribute("umobile",mobile);
            //session attribute uname consist of mobile of the signed up user             
            session.setAttribute("utype", utype);
            // this tells us the type of user currently active
             resp.sendRedirect("ahome.jsp");
         }
         else
         {
//         out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
//         out.print("<center>You aren't authorized yet!");
//         out.print("</br><a href=index.jsp>Home</a></center></h2></body></html>");
           resp.sendRedirect("login.jsp?alerttitle=You Aren't Authorized Yet");
         }
        
     }
     else
     {
         String uscore=null;
                try {
                    uscore = rs.getString("oscore");
                } catch (SQLException ex) {
                    Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
                }
             session.setAttribute("uname",name);
            // here uname attribute belongs to the session of current user which contains his name
            session.setAttribute("umail",email);
            //session attribute uname consist of email of the signed up user
            session.setAttribute("umobile",mobile);
            //session attribute uname consist of mobile of the signed up user             
            session.setAttribute("utype", utype);
            // this tells us the type of user currently active
         session.setAttribute("uscore", uscore);
         resp.sendRedirect("uhome.jsp");     
     }
    }
      else if(userexist==1 && flag==false) {
//         out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
//         out.print("<center>Invalid Password");
//         out.print("</br><a href=login.jsp>Login Again</a></center></h2></body></html>");
           resp.sendRedirect("login.jsp?alerttitle=Invalid Password!");

    }
    else if(userexist==0 && flag==false){
//         out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
//         out.print("<center>Invalid Email Id or Mobile Number");
//         out.print("</br><a href=login.jsp>Login Again</a></center></h2></body></html>");
           resp.sendRedirect("login.jsp?alerttitle=Invalid Email Id or Mobile Number!");
    }
            
    
    }

    @Override
    public void destroy() {
        try{
            con.close();
        }
        catch(SQLException e){
        e.printStackTrace(out);
        }
    }



}
