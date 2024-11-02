package controller.Marketer;

import model.MarketingDAO;
import dto.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "EditProductServlet", urlPatterns = {"/editProductMarketing"})
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int variationID = Integer.parseInt(request.getParameter("variationID"));

        try {
            MarketingDAO dao = new MarketingDAO();
            ProductListDTO product = dao.getProductByVariationID(variationID);
            List<CategoryDTO> categories = dao.getAllCategories();
            List<CollectionDTO> collections = dao.getAllCollections();
            List<ColorDTO> colors = dao.getAllColors();
            List<SizeDTO> sizes = dao.getAllSizes();

            request.setAttribute("product", product);
            request.setAttribute("categories", categories);
            request.setAttribute("collections", collections);
            request.setAttribute("colors", colors);
            request.setAttribute("sizes", sizes);
            request.getRequestDispatcher("/marketingEditProduct.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int variationID = Integer.parseInt(request.getParameter("variationID"));
        String categoryID = request.getParameter("category");
        String collectionID = request.getParameter("collection");
        String colorID = request.getParameter("color");
        String sizeID = request.getParameter("size");
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String thumbnail = request.getParameter("thumbnail");

        MarketingDAO dao = new MarketingDAO();

        try {
            // Cập nhật Product
            dao.updateProduct(variationID, Integer.parseInt(categoryID), productName, Integer.parseInt(collectionID), description, thumbnail);

            // Cập nhật Variation
            dao.updateVariation(variationID, Integer.parseInt(colorID), Integer.parseInt(sizeID));

            response.sendRedirect("marketing2");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while updating the product.");
            request.getRequestDispatcher("/marketingEditProduct.jsp").forward(request, response);
        }
    }
}
