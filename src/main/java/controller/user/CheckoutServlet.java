package controller.user;

import entity.Address;
import entity.CartItem;
import entity.Country;
import entity.Product;
import entity.ShopOrder;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Checkout", value = "/Checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) request.getSession().getAttribute("acc");
        if (u == null) {
            response.sendRedirect("login-servlet");
            return;
        }
        String input = request.getParameter("input").trim();
        if (input.equals("1")) {
            session.removeAttribute("temporaryAddress");
        } else if (input.equals("2")) {
            session.removeAttribute("PayType");
        } else {
            session.removeAttribute("temporaryAddress");
            session.removeAttribute("PayType");
        }
        ShopOrderDAO shopOrderDao = new ShopOrderDAO();
        ShopOrder shopOrder = shopOrderDao.getLatestOrderByUserId(u.getUserID());
        AddressDAO addressDao = new AddressDAO();
        Address oldAddress = null;
        if (shopOrder != null) { //afaf
            oldAddress = addressDao.getAddressById(shopOrder.getAddressID());
        }
        if (u == null) {
            request.setAttribute("Message", "Please Login to perform this action!");
            request.getRequestDispatcher("login-servlet").forward(request, response);
        } else {
            request.setAttribute("shopOrder", shopOrder);
            request.setAttribute("oldAddress", oldAddress);
            CartItemDAO cartItemDAO = new CartItemDAO();
            List<Product> cartItemList = cartItemDAO.getUserItem(u.getUserID());
            List<CartItem> cartItemList2 = cartItemDAO.getListCartItemByUserId(u.getUserID());
            List<Country> c = new CountryDAO().getAllCountry();
            List<Address> address = addressDao.getUserAddresses(u.getUserID());
            session.setAttribute("cartItemList", cartItemList);
            session.setAttribute("cartItemList2", cartItemList2);
            session.setAttribute("countryList", c);
            session.setAttribute("addressList", address);
            if (cartItemList.isEmpty()) {
                response.sendRedirect(request.getHeader("referer"));
            } else {
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mod = request.getParameter("mod").trim();
        HttpSession session = request.getSession();
        User currUser = (User) request.getSession().getAttribute("acc");
        if (mod.equals("1")) {
            ShopOrderDAO sod = new ShopOrderDAO();
            AddressDAO ad = new AddressDAO();
            String buyerID = String.valueOf(currUser.getUserID());
            String xCountryID = request.getParameter("CountryID").trim();
            String xRecipentName = request.getParameter("recipient").trim();
            String xPhone = request.getParameter("recipent_phone").trim();
            String xCity = request.getParameter("city").trim();
            String xAddressLine = request.getParameter("address_line").trim();
            String xPostalCode = request.getParameter("postalcode").trim();
            ShopOrder shopOrder = new ShopOrder(Integer.parseInt(buyerID), 1, xRecipentName, xPhone);
            session.setAttribute("shopOrder", shopOrder);
            sod.insertOrder(shopOrder);
            ad.insertAddress(xAddressLine, xCity, xPostalCode, xCountryID);
            Address tempAddress = ad.getAddress(xAddressLine, xCity, xPostalCode, xCountryID);
            session.setAttribute("temporaryAddress", tempAddress);
            ad.setAddressIDtoShopOrder();
            request.setAttribute("ShippMess", "Address has been added Successfully");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else if (mod.equals("3")) {
            AddressDAO ad = new AddressDAO();
            String xCountryID = request.getParameter("CountryID").trim();
            String xCity = request.getParameter("city").trim();
            String xAddressLine = request.getParameter("address_line").trim();
            String xPostalCode = request.getParameter("postalcode").trim();
            String phone = request.getParameter("phone").trim();
            String fullname = request.getParameter("fullname").trim();
            int addressId = ad.addNewAddress(xAddressLine, xCity, xPostalCode, xCountryID, currUser.getUserID(), phone, fullname);
            Address tempAddress = new Address(addressId, xAddressLine, xCity, Integer.parseInt(xPostalCode), Integer.parseInt(xCountryID));
            List<Address> address = ad.getUserAddresses(currUser.getUserID());
            tempAddress.setPhone(phone);
            tempAddress.setFullname(fullname);
            session.setAttribute("addressList", address);
            session.setAttribute("temporaryAddress", tempAddress);
            request.setAttribute("ShippMess", "Address has been added Successfully");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else if (mod.equals("4")) {
            AddressDAO ad = new AddressDAO();
            String addressId = request.getParameter("addressId").trim();
            String xCountryID = request.getParameter("CountryID").trim();
            String xCity = request.getParameter("city").trim();
            String xAddressLine = request.getParameter("address_line").trim();
            String xPostalCode = request.getParameter("postalcode").trim();
            String phone = request.getParameter("phone").trim();
            String fullname = request.getParameter("fullname").trim();
            ad.editAddress(Integer.parseInt(addressId), xAddressLine, xCity, xPostalCode, xCountryID, phone, fullname);
            Address tempAddress = new Address(Integer.parseInt(addressId), xAddressLine, xCity, Integer.parseInt(xPostalCode), Integer.parseInt(xCountryID));
            tempAddress.setPhone(phone);
            tempAddress.setFullname(fullname);
            List<Address> address = ad.getUserAddresses(currUser.getUserID());
            session.setAttribute("addressList", address);
            session.setAttribute("temporaryAddress", tempAddress);
            request.setAttribute("ShippMess", "Address has been edit successfully");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            String PayType = request.getParameter("payment_option");
            session.setAttribute("PayType", PayType);
            request.setAttribute("PayMess", "Saved");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }
}
