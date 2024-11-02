<%-- 
    Document   : add-product
    Created on : Jul 11, 2024, 4:43:23 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <h2 class="mt-4">Add New Product</h2>
            <form class="mt-4" method="post" action="manage-product" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="productName">Product Name:</label>
                    <input type="text" class="form-control" id="productName" name="productName" required>
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                </div>
                <div class="form-group">
                    <label for="categoryId">Category:</label>
                    <select class="form-control" id="categoryId" name="categoryId" required>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.categoryID}">${category.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="collectionId">Collection:</label>
                    <select class="form-control" id="collectionId" name="collectionId" required>
                        <c:forEach var="collection" items="${collections}">
                            <option value="${collection.collectionID}">${collection.collectionName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label>Colors and Sizes:</label><br>
                    <c:forEach var="color" items="${colors}">
                        <c:forEach var="size" items="${sizes}">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="variation_${color.color_ID}_${size.size_ID}" name="variations" value="${color.color_ID}-${size.size_ID}">
                                <label class="form-check-label" for="variation_${color.color_ID}_${size.size_ID}">
                                    ${color.color_Name} - ${size.size_Name}
                                </label>
                                <input type="number" class="form-control ml-2" id="qty_in_stock_${color.color_ID}_${size.size_ID}" name="qty_in_stock_${color.color_ID}_${size.size_ID}" placeholder="Quantity">
                            </div>
                        </c:forEach>
                    </c:forEach>
                </div>
                <div class="form-group">
                    <label for="thumbnail">Thumbnail Image:</label>
                    <input type="file" class="form-control-file" id="thumbnail" name="thumbnail" required>
                </div>
                <div class="form-group">
                    <label for="additionalImages">Additional Images:</label>
                    <input type="file" class="form-control-file" id="additionalImages" name="additionalImages" multiple>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Add Product</button>
            </form>
        </div>

    </div>
</body>
</html>
