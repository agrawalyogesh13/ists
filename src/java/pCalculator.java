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
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class pCalculator extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
    //This code prevents the back button from logging in back after pressing logout button
    response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
    response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
    response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
    response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
    //
    
    //Authetication Code For Student, Starts Here
    
    String uname = (String)session.getAttribute("uname");
    String utype = (String)session.getAttribute("utype");
    String uscore=  (String)session.getAttribute("uscore");
    String umobile=  (String)session.getAttribute("umobile");
    int uexistflag=0,uflag=0;
            if(utype!=null){
                uexistflag=1;
                if(utype.equals("Student")){}
                else{
                    response.sendRedirect("ahome.jsp");
                }        
            }
                    
           if(uexistflag==0)
               response.sendRedirect("login.jsp?alerttitle=You Are Not Logged In!");
    
    //Authetication Code For Student, Ends Here
//http://localhost:8084/ISTS/pCalculator.java?radio1=3&radio2=3&radio3=1&radio4=1&radio5=2&radio6=4&radio7=4&radio8=3&radio9=4&radio10=1&radio11=1&radio12=1&radio13=1&radio14=1&radio15=0&radio16=1&radio17=4&radio18=0&radio19=4&radio20=3    
    
    
    
    PreparedStatement ps;
    Connection con;
    String query = "update userdata set oscore=?,aptiscore=? where mobile='"+umobile+"'";
    String resp[]=new String[20];
    int sum=0;

        try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ISTS","root","root");
        for(int i=0;i<20;i++){
            resp[i] = request.getParameter("radio"+(i+1));
            if(resp[i]!=null){
                sum+=Integer.parseInt(resp[i]);
            }
            else if(utype!=null && utype.equals("Student")){ 
                response.sendRedirect("uhome.jsp");
            }
        }
        
        ps = con.prepareStatement(query);
        ps.setInt(1, sum);
        ps.setInt(2, sum);
        ps.executeUpdate();
        String updated_uscore = Integer.toString(sum);
        session.setAttribute("uscore", updated_uscore); //Updating the session attribute uscore each time user gives a test
        response.sendRedirect("pCalculator.jsp");
        }
        catch(Exception e){
            out.print(e);
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
