package controller.saleManager;

import entity.Category;
import entity.Collection;
import entity.Color;
import entity.Product;
import entity.Size;
import entity.Variation;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.CategoryDAO;
import model.CollectionDAO;
import model.ColorDAO;
import model.ProductDAO;
import model.SizeDAO;

@WebServlet(name = "ProductController", urlPatterns = {"/manage-product"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50)   // 50 MB
public class ProductController extends HttpServlet {

    private CategoryDAO categoryDAO;
    private CollectionDAO collectionDAO;
    private ColorDAO colorDAO;
    private SizeDAO sizeDAO;

    public void init() {
        categoryDAO = new CategoryDAO();
        collectionDAO = new CollectionDAO();
        colorDAO = new ColorDAO();
        sizeDAO = new SizeDAO();
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
        try {
            List<Category> categories = categoryDAO.getAllCategory();
            List<Collection> collections = collectionDAO.getAllCollections();
            List<Color> colors = colorDAO.getAllColors();
            List<Size> sizes = sizeDAO.getAllSizes();

            request.setAttribute("categories", categories);
            request.setAttribute("collections", collections);
            request.setAttribute("colors", colors);
            request.setAttribute("sizes", sizes);
            request.getRequestDispatcher("add-product.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            int collectionId = Integer.parseInt(request.getParameter("collectionId"));
            String description = request.getParameter("description");

            // Get colorIds and sizeIds
            String[] colorIds = request.getParameterValues("colorId");
            String[] sizeIds = request.getParameterValues("sizeId");

            // Process thumbnail and additional images
            Part thumbnailPart = request.getPart("thumbnail");
            String thumbnail = saveFile(thumbnailPart);

            List<Part> additionalImageParts = new ArrayList<>();
            for (Part part : request.getParts()) {
                if ("additionalImages".equals(part.getName())) {
                    additionalImageParts.add(part);
                }
            }
            String[] additionalImages = saveFiles(additionalImageParts);

            // Process variations
            List<Variation> variations = new ArrayList<>();
            if (colorIds != null && sizeIds != null) {
                for (String colorId : colorIds) {
                    for (String sizeId : sizeIds) {
                        Variation variation = new Variation();
                        variation.setColor_ID(Integer.parseInt(colorId));
                        variation.setSize_ID(Integer.parseInt(sizeId));
                        String qtyInStockParam = request.getParameter("qty_in_stock_" + colorId + "_" + sizeId);
                        String productImgParam = request.getParameter("product_img_" + colorId + "_" + sizeId);

                        if (qtyInStockParam != null && !qtyInStockParam.isEmpty()) {
                            variation.setQtu_in_stock(Integer.parseInt(qtyInStockParam));
                        } else {
                            variation.setQtu_in_stock(0); 
                        }

                        if (productImgParam != null && !productImgParam.isEmpty()) {
                            variation.setProduct_img_ID(Integer.parseInt(productImgParam));
                        } else {
                            variation.setProduct_img_ID(0); 
                        }

                        variations.add(variation);
                    }
                }
            }

            Product newProduct = new Product();
            newProduct.setProductName(productName);
            newProduct.setPrice(price);
            newProduct.setCategoryId(categoryId);
            newProduct.setCollectionID(collectionId);
            newProduct.setDescription(description);
            newProduct.setThumbnail(thumbnail);
            newProduct.setAdditionalImages(Arrays.asList(additionalImages));
            newProduct.setVariations(variations);

            ProductDAO productDAO = new ProductDAO();
            productDAO.insertProduct(newProduct);

            response.sendRedirect("success.jsp");

        } catch (NumberFormatException | ServletException | IOException e) {
            e.printStackTrace();
            response.sendRedirect("failure.jsp");
        }
    }

    private String saveFile(Part part) throws IOException {
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        part.write(uploadPath + File.separator + fileName);
        return fileName;
    }

    private String[] saveFiles(List<Part> parts) throws IOException {
        String[] fileNames = new String[parts.size()];
        int index = 0;
        for (Part fileName : parts) {
            fileNames[index++] = saveFile(fileName);
        }
        return fileNames;
    }
}
