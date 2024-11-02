package controller.Marketer;

import model.MarketingDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AddProductServlet", urlPatterns = {"/addProduct"})
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            MarketingDAO dao = new MarketingDAO();
            request.setAttribute("categories", dao.getAllCategories());
            request.setAttribute("collections", dao.getAllCollections());
            request.setAttribute("colors", dao.getAllColors());
            request.setAttribute("sizes", dao.getAllSizes());
            request.getRequestDispatcher("/marketingAddProduct.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryID = request.getParameter("category");
        String collectionID = request.getParameter("collection");
        String colorID = request.getParameter("color");
        String sizeID = request.getParameter("size");
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("thumbnail");

        MarketingDAO dao = new MarketingDAO();

        try {
            // Tạo Product mới
            int productID = dao.createProduct(Integer.parseInt(categoryID), productName, Integer.parseInt(collectionID), description);

            // Tạo Product Image mới
            int productImgID = dao.createProductImage(thumbnail);

            // Tạo Variation mới
            dao.createVariation(productID, Integer.parseInt(colorID), Integer.parseInt(sizeID), productImgID);

            response.sendRedirect("marketing2");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while adding the product.");
            request.getRequestDispatcher("/marketingAddProduct.jsp").forward(request, response);
        }
    }
}
