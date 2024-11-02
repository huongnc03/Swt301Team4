package controller.user;

import entity.OrderStatus;
import entity.ShopOrder;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.OrderStatusDAO;
import model.ShopOrderDAO;

public class OrderListUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User curUser = (User) session.getAttribute("acc");
        if (curUser == null || (curUser != null && curUser.getRole() != 4)) {
            response.sendRedirect("login-servlet");
            return;
        }
        User u = (User) request.getSession().getAttribute("acc");
        String xUID = String.valueOf(u.getUserID());
        ShopOrderDAO sod = new ShopOrderDAO();
        OrderStatusDAO osd = new OrderStatusDAO();
        List<ShopOrder> Bill = sod.getOrdersByUserID(Integer.parseInt(xUID));
        List<OrderStatus> listOrderStatus = osd.findAll();
        request.setAttribute("listBill", Bill);
        request.setAttribute("listOrderStatus", listOrderStatus);
        request.getRequestDispatcher("orderListUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User curUser = (User) session.getAttribute("acc");
        ShopOrderDAO orderDAO = new ShopOrderDAO();
        if (curUser != null && curUser.getRole() == 4) {
            int id = Integer.parseInt(request.getParameter("id"));
            int status = Integer.parseInt(request.getParameter("status"));
            try {
                orderDAO.updateStatusOrder(status, id);
                session.setAttribute("msg", "Status update successfully !");
                response.sendRedirect("OrderDetail?buyerID=" + curUser.getUserID() + "&OrderID=" + id + "&mod=1");
            } catch (Exception e) {
                session.setAttribute("err", "Status update Failed : " + e.getMessage());
                response.sendRedirect("OrderListUserServlet");
            }
        } else {
            response.sendRedirect("login-servlet");
        }
    }

}
