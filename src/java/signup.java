import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;


public class signup extends HttpServlet {
    Connection con;
    PrintWriter out;
    String utable;
    PreparedStatement userTable;//will make specific user table separately

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        //http://localhost:8084/ISTS/signup?utype=Student&name=dfg&mobile=gdfq&email=gdr&psw=fgd
        String utype = req.getParameter("utype");
        String name = req.getParameter("name");
        String mobile = req.getParameter("mobile");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String ucheck;
        String insert;

        if (utype.equals("Admin"))
        {
        ucheck = "select * from admindata where mobile=? or email=?";
        insert = "insert into admindata values(?,?,?,?,null)";
        utable=null;
        }
        else
        {
        ucheck = "select * from userdata where mobile=? or email=?";
        insert = "insert into userdata values(?,?,?,?,-1,-1)";
        utable = "create table u"+mobile+" (qid varchar(25),qtime int(5), qresponse varchar(20), pscore decimal(5,2), testno int(10), ques TEXT, option1 TEXT, option2 TEXT, option3 TEXT, option4 TEXT, answer varchar(7), solution TEXT, qimage BLOB, avgtime int(5), nou int(20), nocu int(20))";
        }
        //To insert mail id in exam tables directly
        
        HttpSession session=req.getSession();
        boolean flag = false;
        out = resp.getWriter();
        try {
            //Database connectivity
            
            

            /*String insert = "insert into userdata values('yogesh',10,'42342','agrawal@gal','dfdjl')";
            Statement st = con.createStatement();
            int n = st.executeUpdate(insert);
            */
             
            PreparedStatement pscheck = con.prepareStatement(ucheck);
            pscheck.setString(1, mobile);
            pscheck.setString(2, email);
            ResultSet rs = pscheck.executeQuery();
            //Checks if Mobile number or email already exist.
            if(rs.next()){
            out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
            out.print("<center>Mobile Number or Email ID Already Exists.");
            out.print("</br><a href=/ISTS/login.jsp>Login</a></center></h2></body></html>");
            }
            
            else {
            PreparedStatement ps = con.prepareStatement(insert);
            ps.setString(1, name);
            ps.setString(2, mobile);
            ps.setString(3, email);
            ps.setString(4, password);
            int n = ps.executeUpdate();
            
            if( utable == null){}
            else{
                userTable = con.prepareStatement(utable);
            }
    
            
            if(utype.equals("Student"))
            {
              int noftable = userTable.executeUpdate();
            }
            
             flag = true;
            }
        } 
        
        catch(SQLException e) {e.printStackTrace(out);}
        
        if (flag==true){
            
            if(utype.equals("Admin")){
                session.setAttribute("astatus", null);
         out.print("<html><body><h2 style=\" top:25%; position:relative; \">");
         out.print("<center>Your Request Has Been Submitted Successfully!</br>You Will Be Notified Soon!");
         out.print("</br><a href=index.jsp>Home</a></center></h2></body></html>");
            }
            else{
            session.setAttribute("uname",name);
            //session attribute uname consist of name of the signed up user
             session.setAttribute("umail",email);
            //session attribute uname consist of email of the signed up user
             session.setAttribute("umobile",mobile);
            //session attribute uname consist of mobile of the signed up user             
            session.setAttribute("utype", utype);
            //type of user is set
            session.setAttribute("uscore", "-1");
                resp.sendRedirect("uhome.jsp");
            }
        }
    }

    @Override
    public void destroy() {
        

        try {
            con.close();
            out.close();
        } catch (SQLException ex) {
            
        }
    }

    @Override
    public void init() throws ServletException {
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ISTS","root","root");
        }
        catch(Exception e){
        e.printStackTrace(out);
        }
    }
}           