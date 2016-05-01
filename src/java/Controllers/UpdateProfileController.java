package Controllers;

import beans.User;
import beans.UsersService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateProfileController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //request.setAttribute("allImages", galleryService.getAllImages());
        HttpSession session = request.getSession();
        String loggedUsername = (String) session.getAttribute("user");
        UsersService usersService = new UsersService();
        User loggedUser = usersService.getUserByUsername(loggedUsername);

        loggedUser.setUsername(request.getParameter("username"));
        loggedUser.setFirstname(request.getParameter("firstname"));
        loggedUser.setLastname(request.getParameter("lastname"));
        loggedUser.setCountry(request.getParameter("country"));
        loggedUser.setUsername(request.getParameter("username"));
        loggedUser.setStreet(request.getParameter("street"));
        loggedUser.setPostcode(request.getParameter("postcode"));
        loggedUser.setEmail(request.getParameter("email"));
         loggedUser.setPassword(request.getParameter("password"));
        usersService.updateUser(loggedUser, loggedUsername);
        
        request.setAttribute("loggedUser", loggedUser);
        
        session.setAttribute("user", loggedUser.getUsername());

        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/editprofile.jsp");
        dispatch.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
