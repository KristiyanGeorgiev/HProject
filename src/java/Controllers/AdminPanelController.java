package Controllers;

import beans.Product;
import beans.ProductService;
import com.sun.xml.internal.ws.util.StringUtils;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class AdminPanelController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String type = request.getParameter("type");
          
         System.out.println(type);
        float price = Float.valueOf(request.getParameter("price"));
        String update = request.getParameter("update");
        String delete = request.getParameter("delete");

        String id = request.getParameter("id");

        Part filePart = request.getPart("photo");

        System.out.println("update:" + update);
        System.out.println("delete:" + delete);

        System.out.println("ID:" + id);
        ProductService productService = new ProductService();
        if (update != null) {
            if (productService.update(id, name, price)) {
                request.setAttribute("edit", "successfully updated product");
            } else {
                request.setAttribute("edit", "there was an error while updating the product");
            }
            System.out.println("updatinggggggggggggg");

        }
        if (delete != null) {
            if (productService.delete(id)) {
                request.setAttribute("edit", "successfully deleted product");
            } else {
                request.setAttribute("edit", "there was an error while deleting the product");

            }
            System.out.println("deletingggggggg");
        }

        if (!name.equals("") && price != 0 && filePart.getSize() > 0 && filePart != null) {

            InputStream inputStream = null; // input stream of the upload file
            int size = 1024 * 1024 * 10;//1MB
            if (filePart.getSize() > 1000) {
                inputStream = filePart.getInputStream();

                if (inputStream != null && filePart.getSize() <= size) {

                    Product product = new Product(name, price, inputStream, type);
                    boolean success = false;
                    success = product.save();
                    if (success == true) {
                        request.setAttribute("result", "successfully added a product");
                        // out.print("successfully added a product");
                    } else {
                        request.setAttribute("result", "There was a problem when adding the product");
                        out.println("Something went wrong");
                    }
                }
            } else {

            }
        }
        
        

        System.out.println(productService.getAllProducts().size());
        request.setAttribute("allProducts", productService.getAllProducts());

        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/admin.jsp");
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
