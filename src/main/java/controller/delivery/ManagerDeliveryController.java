/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.delivery;

import entity.OrderDetail;
import entity.OrderStatus;
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
import model.OrderDetailDAO;
import model.OrderStatusDAO;
import model.ProductDAO;
import model.ShopOrderDAO;
import model.VariationDAO;

@WebServlet(name = "ManagerDeliveryController", urlPatterns = {"/delivery-manager"})
public class ManagerDeliveryController extends HttpServlet {

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
            out.println("<title>Servlet ManagerDeliveryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerDeliveryController at " + request.getContextPath() + "</h1>");
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
        User user = (User) session.getAttribute("acc");
        if (user == null || (user != null && user.getRole() != 6)) {
            response.sendRedirect("login-servlet");
            return;
        }
        ShopOrderDAO orderDAO = new ShopOrderDAO();
        OrderStatusDAO osd = new OrderStatusDAO();
        List<ShopOrder> listOrder = orderDAO.findAllForDelivery();
        List<OrderStatus> listOrderStatus = osd.findAll();
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("listOrderStatus", listOrderStatus);
        request.getRequestDispatcher("deliveryOrder.jsp").forward(request, response);

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
        HttpSession session = request.getSession();
        User curUser = (User) session.getAttribute("acc");
        ShopOrderDAO orderDAO = new ShopOrderDAO();
        if (curUser != null && curUser.getRole() == 6) {
            int id = Integer.parseInt(request.getParameter("id"));
            int status = Integer.parseInt(request.getParameter("status"));
            orderDAO.updateStatusOrder(status, id);
            if (status == 7) {
                VariationDAO varionDao = new VariationDAO();
                    orderDAO.updateStatusOrder(7, id);
                    ShopOrder sop = orderDAO.getOrderId(id);
                    OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                    List<OrderDetail> orderDetails = orderDetailDao.getOrderItems(sop.getShop_orderID() + "");
                    ProductDAO productDao = new ProductDAO();
                    for (OrderDetail orderDetail : orderDetails) {
                        System.out.println("Product: " + orderDetail.getProductID() + " " + "Warranty: " + orderDetail.getVariationID() + " " + orderDetail.getQuantity());
                        Variation v = varionDao.getVariationByProductID(orderDetail.getProductID());
                        productDao.increaseQuantityOfProduct(orderDetail.getProductID() + "", orderDetail.getVariationID() + "", orderDetail.getQuantity());
                    }
                session.setAttribute("msg", "Status update successfully !");
                response.sendRedirect("delivery-manager");
            } else {
                try {
                    orderDAO.updateStatusOrder(status, id);
                    session.setAttribute("msg", "Status update successfully !");
                } catch (Exception e) {
                    session.setAttribute("err", "Status update Failed : " + e.getMessage());
                }
                response.sendRedirect("delivery-manager");
            }

        } else {
            response.sendRedirect("login-servlet");
        }
    }
}
