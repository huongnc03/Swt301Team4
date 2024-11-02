package controller.user;

import entity.OrderDetail;
import entity.Product;
import entity.ShopOrder;
import entity.User;
import entity.UserReview;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.FeedbackDAO;
import model.OrderDetailDAO;
import model.ProductDAO;
import model.ShopOrderDAO;

@WebServlet(name = "OrderfeedbackController", urlPatterns = {"/feeback-order"})
public class OrderfeedbackController extends HttpServlet {

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
        User curUser = (User) session.getAttribute("acc");
        ShopOrderDAO orderDAO = new ShopOrderDAO();
        OrderDetailDAO orderDetailDao = new OrderDetailDAO();
        if (curUser != null && curUser.getRole() == 4) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String orderDetailID = request.getParameter("orderDetailId");
            OrderDetail orderDetail = orderDetailDao.getOrderItemById(orderDetailID + "");
            ShopOrder shopOrder = orderDAO.getOrderId(orderId);
            if (shopOrder != null && shopOrder.getOrder_status() == 6) {
                if (orderDetail != null) {
                    FeedbackDAO feedbackDao = new FeedbackDAO();
                    ProductDAO productDao = new ProductDAO();
                    Product product = productDao.getProductByID(orderDetail.getProductID() + "");
                    UserReview userReview = feedbackDao.getUserReviewsByOrderDetail(orderDetail.getOrderDetailID());
                    request.setAttribute("userReview", userReview);
                    request.setAttribute("shopOrder", shopOrder);
                    request.setAttribute("orderDetail", orderDetail);
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("feedbackOrder.jsp").forward(request, response);
                } else {
                    response.sendRedirect("OrderListUserServlet?error=You can not feedback this order!");
                }
            } else {
                response.sendRedirect("OrderListUserServlet?error=You can not feedback this order!");
            }
        } else {
            response.sendRedirect("login-servlet");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedbackDAO feedbackDao = new FeedbackDAO();
        int userID = Integer.parseInt(request.getParameter("userID"));
        int ratingValue = Integer.parseInt(request.getParameter("ratingValue"));
        int orderDetailID = Integer.parseInt(request.getParameter("orderDetailID"));
        String comment = request.getParameter("comment");

        UserReview newUserReview = new UserReview();
        newUserReview.setUserID(userID);
        newUserReview.setRatingValue(ratingValue);
        newUserReview.setOrderDetailID(orderDetailID);
        newUserReview.setComment(comment);

        feedbackDao.insertUserReview(newUserReview);
        response.sendRedirect("OrderListUserServlet?success=Feedback successfully");
    }
}
