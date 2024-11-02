<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback Order</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="bootstrap/assets/vendor/fonts/boxicons.css"/>

        <!-- Core CSS -->
        <link rel="stylesheet" href="bootstrap/assets/vendor/css/core.css" class="template-customizer-core-css"/>
        <link rel="stylesheet" href="bootstrap/assets/vendor/css/theme-default.css" class="template-customizer-theme-css"/>
        <link rel="stylesheet" href="bootstrap/assets/css/demo.css"/>

        <!-- Vendors CSS -->
        <link rel="stylesheet" href="bootstrap/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css"/>

        <!-- Page CSS -->
        <link rel="stylesheet" href="adminpage/product-list/product-list.css">

        <!-- Helpers -->
        <script src="bootstrap/assets/vendor/js/helpers.js"></script>
        <style>
            .star-rating {
                direction: rtl;
                display: inline-flex;
                justify-content: flex-start;
            }
            .star-rating input {
                display: none;
            }
            .star-rating label {
                color: #ddd;
                font-size: 2em;
                padding: 0 0.1em;
                cursor: pointer;
            }
            .star-rating input:checked ~ label {
                color: #ffc700;
            }
            .star-rating label:hover,
            .star-rating label:hover ~ label {
                color: #deb217;
            }
            .fas.fa-star.filled {
                color: gold;
            }
        </style>
    </head>
    <body>
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->
                <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                    <div class="app-brand demo">
                        <a href="${pageContext.request.contextPath}/home-servlet" class="app-brand-link">
                            <span class="app-brand-logo demo">
                                <img src="webImage/other/logo/logo.png" style="width:128px; height:14px">
                            </span>
                        </a>

                        <a href="dashboardManager.jsp"
                           class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                            <i class="bx bx-chevron-left bx-sm align-middle"></i>
                        </a>
                    </div>

                    <div class="menu-inner-shadow"></div>

                    <ul class="menu-inner py-1">
                        <!-- Account Settings -->
                        <li class="menu-item active">
                            <a href="user-account-detail-servlet" class="menu-link ">
                                <i class='menu-icon tf-icons bx bx-user'></i>
                                <div data-i18n="Account Setting">Account Setting</div>
                            </a>
                        </li>
                        <!-- User List -->
                        <li class="menu-item">
                            <a href="orderListUser.jsp" class="menu-link">
                                <i class='menu-icon tf-icons bx bxs-package'></i>
                                <div data-i18n="Orders & Returns">Orders List</div>
                            </a>
                        </li>

                        <li class="menu-item">
                            <a href="${pageContext.request.contextPath}/changePassword" class="menu-link">
                                <i class='menu-icon tf-icons bx bxs-package'></i>
                                <div data-i18n="Change password">Change password</div>
                            </a>
                        </li>
                        <!-- Forms -->
                        <%--logout--%>
                        <li class="menu-item">
                            <a href="logout-servlet" class="menu-link ">
                                <i class='menu-icon tf-icons bx bx-user'></i>
                                <div data-i18n="Account Setting" style="color:red;">Log out</div>
                            </a>
                        </li>
                    </ul>
                </aside>
                <div class="container mt-5">
                    <h2 class="mb-4">Product Feedback</h2>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">${product.productName}</h5>
                            <img src="webImage/productImg/${product.thumbnail}" alt="${product.productName}" class="img-fluid" width="15%">
                            <div>
                                <p class="card-text">Color: ${product.color_Name}</p>
                                <p class="card-text">Size: ${product.size_Name}</p>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <c:choose>
                        <c:when test="${not empty userReview}">
                            <div class="card">
                                <div class="card-body">
                                    <div class="feedback-container">
                                        <h4>Your Feedback</h4>
                                        <div class="rating-stars">
                                            <c:set var="rating" value="${userReview.ratingValue}" />
                                            <c:forEach var="star" begin="1" end="5">
                                                <i class="fas fa-star${star <= rating ? ' filled' : ''}"></i>
                                            </c:forEach>
                                        </div>
                                        <p>Comment: ${userReview.comment}</p>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <h4>Leave a Review</h4>
                            <form action="feeback-order" method="post">
                                <input type="hidden" name="userID" value="${shopOrder.userID}">
                                <input type="hidden" name="orderDetailID" value="${orderDetail.orderDetailID}">
                                <div class="form-group">
                                    <label for="ratingValue">Rating:</label>
                                    <div class="star-rating">
                                        <input type="radio" id="star5" name="ratingValue" value="5"><label for="star5" title="5 stars"><i class="fas fa-star"></i></label>
                                        <input type="radio" id="star4" name="ratingValue" value="4"><label for="star4" title="4 stars"><i class="fas fa-star"></i></label>
                                        <input type="radio" id="star3" name="ratingValue" value="3"><label for="star3" title="3 stars"><i class="fas fa-star"></i></label>
                                        <input type="radio" id="star2" name="ratingValue" value="2"><label for="star2" title="2 stars"><i class="fas fa-star"></i></label>
                                        <input type="radio" id="star1" name="ratingValue" value="1"><label for="star1" title="1 star"><i class="fas fa-star"></i></label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="comment">Comment:</label>
                                    <textarea class="form-control" id="comment" name="comment" rows="5" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit Review</button>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
