package controller.saleManager;

import entity.OrderDetail;
import entity.OrderStatus;
import entity.ShopOrder;
import entity.User;
import entity.Variation;
import java.io.IOException;
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

@WebServlet(name = "SaleServlet", urlPatterns = {"/saler"})
public class SaleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User curUser = (User) session.getAttribute("acc");
        if (curUser != null && curUser.getRole() == 2) {
            ShopOrderDAO orderDAO = new ShopOrderDAO();
            OrderStatusDAO osd = new OrderStatusDAO();
            List<ShopOrder> listOrder = orderDAO.findAllForSale(curUser.getUserID());
            List<OrderStatus> listOrderStatus = osd.findAll();
            request.setAttribute("listOrder", listOrder);
            request.setAttribute("listOrderStatus", listOrderStatus);
            request.getRequestDispatcher("sale.jsp").forward(request, response);
        } else {
            response.sendRedirect("login-servlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User curUser = (User) session.getAttribute("acc");
        ShopOrderDAO orderDAO = new ShopOrderDAO();
        if (curUser != null && curUser.getRole() == 2) {
            int id = Integer.parseInt(request.getParameter("id"));
            int status = Integer.parseInt(request.getParameter("status"));
            try {
                if (status == 2) {
                    orderDAO.updateStatusOrder(status, id);
                    session.setAttribute("msg", "Status update successfully !");
                } else {
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
                    session.setAttribute("msg", "Reject successfully !");
                }
            } catch (Exception e) {
                session.setAttribute("err", "Status update Failed : " + e.getMessage());
            }
            response.sendRedirect("saler");

        } else {
            response.sendRedirect("login-servlet");
        }
    }

}
