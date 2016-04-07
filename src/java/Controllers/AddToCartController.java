package Controllers;

import beans.Product;
import beans.ProductService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AddToCartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");

        ProductService productService = new ProductService();
        Product product = productService.getProductById(id);
        HttpSession session = request.getSession();

        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            // this is the first visit (of this servlet) by this user
            cart = new ArrayList<Product>();
        }
       
        for (int i = 0; i < Integer.parseInt(quantity); i++) {
            cart.add(product);
        }
        session.setAttribute("cart", cart);
        request.setAttribute("msg", "Item " + product.getName() + " successfully added to cart.");

    
        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/ProductsController");
        dispatch.forward(request, response);
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
