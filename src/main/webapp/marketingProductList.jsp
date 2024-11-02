<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View List Product</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="header/header1.css">
        <link rel="stylesheet" href="footer/footer.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <h4 class="mt-5 text-center">Manager Product</h4>
            <a href="addProduct" class="btn btn-primary mb-3">Add Product</a>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>VariationID</th>
                        <th>ProductName</th>
                        <th>CategoryName</th>
                        <th>Price</th>
                        <th>CollectionName</th>
                        <th>ColorName</th>
                        <th>SizeName</th>
                        <th>Image</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.variationID}</td>
                            <td>${product.productName}</td>
                            <td>${product.categoryName}</td>
                            <td>${product.price}</td>
                            <td>${product.collectionName}</td>
                            <td>${product.colorName}</td>
                            <td>${product.sizeName}</td>
                            <td><img src="webImage/productImg/${product.thumbnail}" alt="Product Image" width="50"></td>
                            <td><a href="editProductMarketing?variationID=${product.variationID}" class="btn btn-warning">Edit</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <!-- Trang đầu -->
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="marketing2?page=1">1</a>
                        </li>
                    </c:if>

                    <!-- Trang trước -->
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="marketing2?page=${currentPage - 1}">&laquo;</a>
                        </li>
                    </c:if>

                    <!-- Trang hiện tại -->
                    <li class="page-item active">
                        <a class="page-link" href="#">${currentPage}</a>
                    </li>

                    <!-- Trang sau -->
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="marketing2?page=${currentPage + 1}">&raquo;</a>
                        </li>
                    </c:if>

                    <!-- Trang cuối -->
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="marketing2?page=${totalPages}">${totalPages}</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
