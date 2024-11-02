package controller.user;

import entity.OrderDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.OrderDetailDAO;
import entity.Product;
import entity.ShopOrder;
import entity.User;

import java.io.IOException;
import java.util.List;
import model.ShopOrderDAO;

@WebServlet(name = "OrderDetail", value = "/OrderDetail")

public class OrderDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String mod = request.getParameter("mod");
        OrderDetailDAO odd = new OrderDetailDAO();
        if (mod.equals("1")) {
            User currUser = (User) request.getSession().getAttribute("acc");
            String xOrderID = request.getParameter("OrderID");
            ShopOrderDAO shopOrderDao = new ShopOrderDAO();
            ShopOrder shopOrder = shopOrderDao.getOrderId(Integer.parseInt(xOrderID));
            OrderDetailDAO orderDetailDao = new OrderDetailDAO();
            List<OrderDetail> orderDetails = orderDetailDao.getOrderItems(xOrderID);
            request.setAttribute("shopOrder", shopOrder);
            request.setAttribute("orderDetails", orderDetails);
            List<Product> userOrder = odd.getUserOrder(xOrderID);
            request.setAttribute("userOrder", userOrder);
            request.getRequestDispatcher("orderDetailUser.jsp").forward(request, response);
        } else {
            String userOname = request.getParameter("buyerName");
            String buyerID = request.getParameter("buyerID");
            String xOrderID = request.getParameter("OrderID");
            List<Product> userOrder = odd.getUserOrder(xOrderID);
            request.setAttribute("userOrder", userOrder);
            request.setAttribute("userOname", userOname);
            //request.getRequestDispatcher("orderDetailManager.jsp").forward(request,response);
            request.getRequestDispatcher("saleOrderDetail.jsp").forward(request, response);
        }
    }
}
