/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class saveResult extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //

    HttpSession session = request.getSession();
    String umobile=(String)session.getAttribute("umobile");

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
    
    String resp = request.getParameter("response");
    String responseArray[];
        
    //handling null and blanks
       if(resp!=null && resp.length()>0 ){ //resp will be null if link open directly, and resp.length() will be zero if no question attempted
        responseArray = resp.split(Pattern.quote("$_$"));
    }
    else if(utype!=null && resp==null && utype.equals("Student")){
        response.sendRedirect("uhome.jsp?alerttitle=You have not attempted the test");
        responseArray = new String[1]; //Just for initializing the array so that no error comes for array not initialized
    }
       else if(utype!=null && utype.equals("Student")){
        responseArray = new String[1]; //Just for initializing the array so that no error comes for array not initialized
        response.sendRedirect("uhome.jsp?alerttitle=You have not responded to any question");//If user have not given the test and still trying to access testresult.jsp        
    }
       else{
        responseArray = new String[1]; //Just for initializing the array so that no error comes for array not initialized
        
       }


    String qid=null,question=null,option1=null,option2=null,option3=null,option4=null,answer=null,solution=null,avgtime=null,nou=null,nocu=null,level=null;
    String qtime=null,qresponse=null,qscore=null;
    int test_no=1;
// fetch testno from u<umobile> table
//store nou, nocu,avgtime in qdata table
    String utable_query, qdata_query, udata_query,utable_testno_query;
    ResultSet set;
    Statement st_test_no;
    PreparedStatement ps_utable,ps_qdata_table,ps_udata_table;
    Connection con;
         
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ISTS","root","root");

        utable_testno_query="select max(testno) from u"+umobile;
        st_test_no = con.createStatement();
        set = st_test_no.executeQuery(utable_testno_query);
        if(set.next()){
            test_no = set.getInt(1);
            test_no++;
        }
 
       //utable updation u<umobile>
        utable_query="insert into u"+umobile+" values (?,?,?,?,?,?,?,?,?,?,?,?,null,?,?,?)";
        ps_utable = con.prepareStatement(utable_query);
        //utable updation u<umobile>

        //qdata table updation        
        qdata_query = "update qdata set avgtime=?,nou=?,nocu=? where qid=?";
        ps_qdata_table = con.prepareStatement(qdata_query);
        //qdata table updation
        
        int length = responseArray.length;
        int index=0;
//        out.print(responseArray);
        for(int i=0;i<(length/14);i++){   // will run upto no of questions attempted, as 14 fields are appended
            // Below code will fetch the 14 fields w.r.t each question
                
                qid = responseArray[index]; 
                index++;
                qtime = responseArray[index];
                index++;
                qresponse = responseArray[index];
                index++;
                qscore = responseArray[index];
                index++;
                question = responseArray[index];
                index++;
                option1 = responseArray[index];
                index++;
                option2 = responseArray[index];
                index++;
                option3 = responseArray[index];
                index++;
                option4 = responseArray[index];
                index++;
                answer = responseArray[index];
                index++;
                solution = responseArray[index];
                index++;
                avgtime = responseArray[index];
                index++;
                nou = responseArray[index];
                index++;
                nocu = responseArray[index];
                index++;
                level = responseArray[index];
                index++;
        
                //utable updation u<umobile>
                ps_utable.setString(1, qid);
                ps_utable.setInt(2, Integer.parseInt(qtime));
                ps_utable.setString(3, qresponse);
                ps_utable.setDouble(4, Double.parseDouble(qscore));
                ps_utable.setInt(5, test_no);
                ps_utable.setString(6, question);
                ps_utable.setString(7, option1);
                ps_utable.setString(8, option2);
                ps_utable.setString(9, option3);
                ps_utable.setString(10, option4);
                ps_utable.setString(11, answer);
                ps_utable.setString(12, solution);
                ps_utable.setInt(13, Integer.parseInt(avgtime));
                ps_utable.setInt(14, Integer.parseInt(nou));
                ps_utable.setInt(15, Integer.parseInt(nocu));
                ps_utable.addBatch();
                //utable updation u<umobile>
                
                //qdata table updation
        
                ps_qdata_table.setInt(1, Integer.parseInt(avgtime));
                ps_qdata_table.setInt(2, Integer.parseInt(nou));
                ps_qdata_table.setInt(3, Integer.parseInt(nocu));
                ps_qdata_table.setString(4, qid);
                ps_qdata_table.addBatch();
                //qdata table updation
               
               }// for loop ends here
                ps_utable.executeBatch();//executing the utable updation batch
                ps_qdata_table.executeBatch(); //executing the qdata table updation batch
                
                udata_query= "update userdata set oscore=?, aptiscore=? where mobile="+umobile;
                ps_udata_table = con.prepareStatement(udata_query);//(int)Double.parseDouble(qscore)
                ps_udata_table.setInt(1, (int)Double.parseDouble(qscore));
                ps_udata_table.setInt(2, (int)Double.parseDouble(qscore));
                ps_udata_table.executeUpdate();
                con.close();
                int upd_uscore = (int)Double.parseDouble(qscore);
                String updated_uscore = Integer.toString(upd_uscore);
                session.setAttribute("uscore", updated_uscore); //Updating the session attribute uscore each time user gives a test
                //request.setAttribute("testno", test_no);
                //request.getRequestDispatcher("testhistory.jsp?testno="+test_no).forward(request, response);
                response.sendRedirect("testhistory.jsp?testno="+test_no);
        
        }
        catch(Exception e){
            out.print(e);
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
