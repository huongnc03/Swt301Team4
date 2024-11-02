<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>
<style>
    .custom-table {
        margin-top: 20px;
        width: 100%;
        border-collapse: collapse;
    }
    .custom-table thead {
        background-color: #f8f9fa;
    }
    .custom-table th, .custom-table td {
        padding: 15px;
        text-align: center;
        vertical-align: middle;
    }
    .custom-table img {
        max-width: 100px;
        height: auto;
    }
    .quantity-control {
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .quantity-control button {
        border: 1px solid #ced4da;
        background-color: #fff;
        color: #333;
        font-size: 16px;
        width: 30px;
        height: 30px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease;
    }
    .quantity-control button:hover {
        background-color: #007bff;
        color: #fff;
    }
    .quantity-control input {
        border: 1px solid #ced4da;
        max-width: 60px;
        height: 30px;
        text-align: center;
        font-size: 16px;
        margin: 0 5px;
    }
    .subtotal_container {
        display: flex;
        justify-content: space-between;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .btn-block {
        width: 100%;
    }
    .text-decoration-line-through {
        text-decoration: line-through;
    }
    
    .btn-custom {
        background-color: #007bff;
        border: none;
        color: white;
        padding: 10px 20px;
        font-size: 16px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }
    
    .btn-custom.btn-custom-success {
        background-color: #000000;
    }

    .btn-custom:hover {
        background-color: #000324; 
    }
</style>
<body>
    <section class="container mt-5" style="max-width: 1200px; margin: 0 auto">
        <div class="cart_list">
            <br>
            <h1>Your cart</h1>

            <c:set var="totalValue" value="0"/>
            <c:set var="totalCartItem" value="0"/>
            <span style="color: red">${pageScope.error}</span>
            <table class="table custom-table">
                <thead>
                    <tr>
                        <th scope="col">Product Image</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Size & Color</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                        <th scope="col">Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.cartItemList}" var="item">
                        <c:forEach items="${sessionScope.cartItemList2}" var="o">
                            <c:if test="${o.getProductID() == item.getProductID() && o.getVariationID() == item.getVariationID()}">
                                <tr>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/webImage/productImg/${item.getThumbnail()}" class="img-fluid" alt="${item.getProductName()}">
                                    </td>
                                    <td>${item.getProductName()}</td>
                                    <td>${item.getSize_Name()} | ${item.getColor_Name()}</td>
                                    <td>
                                        <c:if test="${item.getDiscount() != 0}">
                                            <p class="text-decoration-line-through">₫${item.getPrice()}</p>
                                            <p class="text-success">₫${item.getDiscount()}</p>
                                        </c:if>
                                        <c:if test="${item.getDiscount() == 0}">
                                            <p>₫${item.getPrice()}</p>
                                        </c:if>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/adjustQuantity" method="post">
                                            <div class="input-group quantity-control">
                                                <button class="btn btn-outline-secondary" name="choice" value="minus">-</button>
                                                <input type="text" class="form-control text-center" value="${o.getQuantity()}" readonly>
                                                <button class="btn btn-outline-secondary" name="choice" value="plus">+</button>
                                            </div>
                                            <input type="hidden" name="ProductID" value="${o.getProductID()}">
                                            <input type="hidden" name="VariationID" value="${o.getVariationID()}">
                                            <input type="submit" style="display: none;">
                                        </form>
                                    </td>
                                    <td>₫${item.getDiscount() != 0 ? item.getDiscount() * o.getQuantity() : item.getPrice() * o.getQuantity()}</td>
                                    <td>
                                        <a href="DeleteFromCart?ProductID=${item.getProductID()}&variationID=${item.getVariationID()}" class="btn btn-danger btn-sm">
                                            <i class="bx bx-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                                <c:set var="totalCartItem" value="${totalCartItem + o.getQuantity()}"/>
                                <c:set var="totalValue" value="${totalValue + (item.getDiscount() != 0 ? item.getDiscount() * o.getQuantity() : item.getPrice() * o.getQuantity())}"/>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>
            <a href="${pageContext.request.contextPath}/productList-servlet?categoryID=2&color_ID=all" class="btn btn-primary btn-custom">Choose More Products</a>
        </div>

        <div class="checkout_container mt-5">
            <div class="card">
                <div class="card-body">
                    <div class="subtotal_container">
                        <p>Subtotal (${totalCartItem} items)</p>
                        <p>₫${totalValue}</p>
                    </div>
                    <a class="btn btn-sm-success btn-sm-block btn-custom btn-custom-success" href="${pageContext.request.contextPath}/Checkout?input=3">Continue To Checkout</a>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp"/>
</body>
</html>
