package controller.user;

import entity.Cart;
import entity.CartItem;
import entity.OrderDetail;
import entity.Product;
import entity.ShopOrder;
import entity.User;
import entity.Variation;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.CartDAO;
import model.CartItemDAO;
import model.OrderDetailDAO;
import model.ShopOrderDAO;
import model.VariationDAO;

@WebServlet(name = "RebuyController", urlPatterns = {"/rebuy"})
public class RebuyController extends HttpServlet {

    private static final String CONTENT_TYPE = "text/html;charset=UTF-8";
    private static final String ATTR_ACC = "acc";
    private static final String ATTR_CURRENT_CART = "currentCart";
    private static final String ATTR_CART_ITEM_LIST = "cartItemList";
    private static final String ATTR_CART_ITEM_LIST_2 = "cartItemList2";
    private static final String PARAM_PRODUCT_ID = "ProductID";
    private static final String PARAM_COLOR_NAME = "color_Name";
    private static final String PARAM_SIZE_NAME = "size_name";
    private static final String CART_ERROR_LOGIN = "Please Login to perform this action!";
    private static final String CART_ERROR_EXIST = "Product has already been in cart!!!";
    private static final String CART_SUCCESS = "Product has been added to cart!!!";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RebuyController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RebuyController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        HttpSession session = request.getSession();
        User currUser = (User) session.getAttribute("acc");
        if (currUser == null) {
            response.sendRedirect("login-servlet");
            return;
        }
        try {
            int idOrder = Integer.parseInt(request.getParameter("orderId"));
            ShopOrderDAO shopOrderDao = new ShopOrderDAO();
            ShopOrder shopOrder = shopOrderDao.getOrderId(idOrder);
            if (shopOrder != null) {
                CartDAO cartDao = new CartDAO();
                OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                List<OrderDetail> orderDetails = orderDetailDao.getOrderItems(idOrder + "");
                VariationDAO varionDao = new VariationDAO();
                for (OrderDetail orderDetail : orderDetails) {
                    Variation v = varionDao.getVariationByProductID(orderDetail.getProductID());
                    this.handleAddToCart(request, response, session, currUser, orderDetail.getProductID() + "", v);
                }
                response.sendRedirect("cart");
            } else {
                response.sendRedirect("OrderListUserServlet?error=Can not found this order");
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
            response.sendRedirect("cart?error=Have a error");
        }
    }

    private void handleAddToCart(HttpServletRequest request, HttpServletResponse response, HttpSession session, User currUser, String productID, Variation variation)
            throws ServletException, IOException {
        // Create a CartItemDAO object to interact with cart items
        CartItemDAO cartItemDAO = new CartItemDAO();
        String buyerID = String.valueOf(currUser.getUserID());
        // Check if the product is already in the cart
        if (cartItemDAO.checkCartItemExist(productID, String.valueOf(variation.getVariationID()), buyerID)) {
//            addProductToCart(session, currUser, productID, variation);
        } else {
            // Add the product to the cart and redirect back to the referrer
            addProductToCart(session, currUser, productID, variation);
        }
    }
    
//    private void redirectToProductDetailWithError(HttpServletRequest request, HttpServletResponse response, String errorMsg)
//            throws ServletException, IOException {
//        // Set the error message attribute and forward to the product detail servlet
//        request.setAttribute("CartMessError", errorMsg);
//        request.getRequestDispatcher("productDetail-servlet").forward(request, response);
//    }

    /**
     * Adds the specified product and variation to the user's cart.
     *
     * @param session the HttpSession object
     * @param currUser the current User object
     * @param productID the product ID
     * @param variation the Variation object
     */
    private void addProductToCart(HttpSession session, User currUser, String productID, Variation variation) {
        // Create DAO objects for Cart and CartItem
        CartDAO cd = new CartDAO();
        CartItemDAO cartItemDAO = new CartItemDAO();
        String buyerID = String.valueOf(currUser.getUserID());

        // Retrieve the current cart from the session or create a new one
        Cart currentCart = (Cart) session.getAttribute(ATTR_CURRENT_CART);
        if (currentCart == null) {
            // Get user cart items and insert a new cart if empty
            List<Product> cartItemList = cartItemDAO.getUserItem(currUser.getUserID());
            if (cartItemList.isEmpty()) {
                cd.insertProductIntoCart(buyerID);
            }
        }

        // Retrieve the updated cart and set it in the session
        Cart curCart = cd.getCart(buyerID);
        session.setAttribute(ATTR_CURRENT_CART, curCart);

        // Insert the product into the cart
        cartItemDAO.insert(String.valueOf(curCart.getCartID()), productID, String.valueOf(variation.getVariationID()));

        // Update the session with the user's cart items
        updateSessionCartItems(session, currUser);
    }

    private void updateSessionCartItems(HttpSession session, User currUser) {
        // Create a CartItemDAO object to retrieve cart items
        CartItemDAO cartItemDAO = new CartItemDAO();

        // Get the user's cart items and update the session attributes
        List<Product> cartItemList = cartItemDAO.getUserItem(currUser.getUserID());
        List<CartItem> cartItemList2 = cartItemDAO.getListCartItemByUserId(currUser.getUserID());
        session.setAttribute(ATTR_CART_ITEM_LIST, cartItemList);
        session.setAttribute(ATTR_CART_ITEM_LIST_2, cartItemList2);
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

}
