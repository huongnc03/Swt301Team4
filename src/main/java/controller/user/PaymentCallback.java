package controller.user;

import entity.OrderDetail;
import entity.Product;
import entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.AddressDAO;
import model.CartItemDAO;
import model.OrderDetailDAO;
import model.ProductDAO;
import model.ShopOrderDAO;

@WebServlet(name = "PaymentCallback", urlPatterns = {"/PaymentCallback"})
public class PaymentCallback extends HttpServlet {

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
        int orderID = 0;
        OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
        ShopOrderDAO shopOrderDAO = new ShopOrderDAO();
        try {
            orderID = Integer.parseInt(session.getAttribute("orderId") + "");
            User user = (User) session.getAttribute("acc");
            String transactionStatus = request.getParameter("vnp_TransactionStatus");
            System.out.println(transactionStatus);
            if ("00".equals(transactionStatus)) {
                int userID = user != null ? user.getUserID() : -1;
                request.setAttribute("OrderMessage", "Order Placed Successfully");
                session.removeAttribute("temporaryAddress");
                session.removeAttribute("PayType");
                session.removeAttribute("shopOrder");
                request.setAttribute("OrderMessage", "Order Placed");
                CartItemDAO cartItemDAO = new CartItemDAO();
                ProductDAO pd = new ProductDAO();
                AddressDAO ad = new AddressDAO();
                List<Product> cartItems = cartItemDAO.getUserItem(userID);
                for (Product cartItem : cartItems) {
                    String productID = String.valueOf(cartItem.getProductID());
                    String variationID = String.valueOf(cartItem.getVariationID());
                    int quantity = cartItem.getQty_in_cart();
                    cartItemDAO.deleteCartItemByProdID(productID, variationID);
                    pd.reduceQuantityOfProduct(productID, variationID, quantity);
                }
                request.getRequestDispatcher("thanks.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
        }
        System.out.println("OrderId: " + orderID);
        ProductDAO productDAO = new ProductDAO();
        List<OrderDetail> orderDetails = orderDetailDAO.getOrderItems(orderID + "");
        for (OrderDetail orderDetail : orderDetails) {
            productDAO.increaseQuantityOfProduct(orderDetail.getProductID() + "", orderDetail.getVariationID() + "", orderDetail.getQuantity());
        }
        orderDetailDAO.deleteOrderDetailsByOrderID(orderID);
        shopOrderDAO.deleteSaleAssignmentByOrderID(orderID);
        shopOrderDAO.deleteOrderByOrderID(orderID);
        response.sendRedirect("cart?error=Payment Failed. Try again");
    }

}
