<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Product</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"> <!-- Add this line -->

        <style>
            body {
                font-family: Arial, sans-serif;
            }
            h1 {
                color: #333;

            }
            .form-group label {
                color: #555;
                font-weight: bold;
            }
            .btn-primary  {
                background-color: #5cb85c;
                border-color: #4cae4c;
            }
            .btn-primary:hover {
                background-color: #4cae4c;
                border-color: #398439;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <h4 class="mt-5 text-center">Edit Product</h4>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <form id="editProductForm" action="editProductMarketing" method="post" onsubmit="return validateForm()">
                <input type="hidden" name="variationID" value="${product.variationID}">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="category">Category:</label>
                            <select id="category" name="category" class="form-control">
                                <option value="">--select--</option>
                                <c:forEach var="category" items="${categories}">
                                    <c:choose>
                                        <c:when test="${category.categoryName == product.categoryName}">
                                            <option value="${category.categoryID}" selected>${category.categoryName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${category.categoryID}">${category.categoryName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="collection">Collection:</label>
                            <select id="collection" name="collection" class="form-control">
                                <option value="">--select--</option>
                                <c:forEach var="collection" items="${collections}">
                                    <c:choose>
                                        <c:when test="${collection.collectionName == product.collectionName}">
                                            <option value="${collection.collectionID}" selected>${collection.collectionName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${collection.collectionID}">${collection.collectionName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="color">Color:</label>
                            <select id="color" name="color" class="form-control">
                                <option value="">--select--</option>
                                <c:forEach var="color" items="${colors}">
                                    <c:choose>
                                        <c:when test="${color.color_Name == product.colorName}">
                                            <option value="${color.color_ID}" selected>${color.color_Name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${color.color_ID}">${color.color_Name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="size">Size:</label>
                            <select id="size" name="size" class="form-control">
                                <option value="">--select--</option>
                                <c:forEach var="size" items="${sizes}">
                                    <c:choose>
                                        <c:when test="${size.size_Name == product.sizeName}">
                                            <option value="${size.size_ID}" selected>${size.size_Name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${size.size_ID}">${size.size_Name}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="productName">Product Name:</label>
                            <input type="text" id="productName" name="productName" class="form-control" value="${product.productName}" required>
                        </div>
                    </div>
                    <div class="col-md-6">

                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea id="description" name="description" class="form-control" required>${product.description}</textarea>
                        </div>
                        <div class="form-group">

                            <div class="col-md-6">
                                <img src="webImage/productImg/${product.thumbnail}" alt="Product Image" class="img-responsive" id="avatarImage" style="height:300px;width:300px;">
                                <br/>
                                <br/>
                                <button type="button" class="btn btn-info btn-sm" id="uploadButton">
                                    <i class="fa fa-upload"></i> Upload Image
                                </button>
                                <!-- Input for file selection, hidden from view -->
                                <input type="file" id="fileInput" style="display: none;" accept="image/*">
                                <input type="hidden" id="thumbnail" name="thumbnail" value="${product.thumbnail}" />
                            </div>
                        </div>

                    </div>
                    <button type="submit" class="btn btn-primary">Update Product</button>
                </div>
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

        <!-- Script for handling image upload -->
        <script>
                document.getElementById('uploadButton').addEventListener('click', function () {
                    document.getElementById('fileInput').click();
                });

                document.getElementById('fileInput').addEventListener('change', function () {
                    var formData = new FormData();
                    formData.append('file', this.files[0]);

                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', 'upload', true);
                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            var response = JSON.parse(xhr.responseText);
                            var fileName = response.fileName;
                            var avatarImage = document.getElementById('avatarImage');
                            avatarImage.src = 'webImage/productImg/' + fileName; // Update the src of avatarImage
                            console.log(fileName);

                            // Update the hidden input value to save to database
                            document.getElementById('thumbnail').value = fileName;
                        }
                    };
                    xhr.send(formData);
                });
        </script>
        <script>
            function validateForm() {
                let isValid = true;
                let errorMessage = '';

                if ($('#category').val() === '') {
                    isValid = false;
                    errorMessage += 'Please select a category.\n';
                }
                if ($('#collection').val() === '') {
                    isValid = false;
                    errorMessage += 'Please select a collection.\n';
                }
                if ($('#color').val() === '') {
                    isValid = false;
                    errorMessage += 'Please select a color.\n';
                }
                if ($('#size').val() === '') {
                    isValid = false;
                    errorMessage += 'Please select a size.\n';
                }
                if ($('#productName').val().trim() === '') {
                    isValid = false;
                    errorMessage += 'Please enter a product name.\n';
                }
                if ($('#description').val().trim() === '') {
                    isValid = false;
                    errorMessage += 'Please enter a description.\n';
                }
                if ($('#thumbnail').val().trim() === '') {
                    isValid = false;
                    errorMessage += 'Please enter a thumbnail.\n';
                }

                if (!isValid) {
                    toastr.error(errorMessage);
                }

                return isValid;
            }
        </script>
    </body>
</html>
