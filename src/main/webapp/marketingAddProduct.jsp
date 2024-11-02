<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Product</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
        <link rel="stylesheet" href="header/header1.css">
        <link rel="stylesheet" href="footer/footer.css">
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
            .btn-primary {
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
            <h4 class="mt-5 text-center">Add Product</h4>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <form id="addProductForm" action="addProduct" method="post" onsubmit="return validateForm()">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="category">Category:</label>
                            <select id="category" name="category" class="form-control">
                                <option value="">--select--</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.categoryID}">${category.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="collection">Collection:</label>
                            <select id="collection" name="collection" class="form-control">
                                <option value="">--select--</option>
                                <c:forEach var="collection" items="${collections}">
                                    <option value="${collection.collectionID}">${collection.collectionName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="color">Color:</label>
                            <select id="color" name="color" class="form-control">
                                <option value="">--select--</option>
                                <c:forEach var="color" items="${colors}">
                                    <option value="${color.color_ID}">${color.color_Name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="size">Size:</label>
                            <select id="size" name="size" class="form-control">
                                <option value="">--select--</option>
                                <c:forEach var="size" items="${sizes}">
                                    <option value="${size.size_ID}">${size.size_Name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="productName">Product Name:</label>
                            <input type="text" id="productName" name="productName" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-6">

                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea id="description" name="description" class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <!--                            <label for="thumbnail">Thumbnail:</label>
                                                        <input type="text" id="thumbnail" name="thumbnail" class="form-control" required>-->

                            <div class="col-md-6">
                                <img src="https://static-00.iconduck.com/assets.00/select-icon-512x512-eynh2v43.png" alt="Product Image" class="img-responsive" id="avatarImage" style="height:300px;width:300px;">
                                <br/>
                                <br/>
                                <button type="button" class="btn btn-primary btn-sm" id="uploadButton">

                                    <i class="fa fa-upload"></i> Upload Image
                                </button>
                                <!-- Input for file selection, hidden from view -->
                                <input type="file" id="fileInput" style="display: none;" accept="image/*">
                            </div>

                            <input type="hidden" id="thumbnail" name="thumbnail" />
                        </div>

                    </div>
                    <button type="submit" class="btn btn-primary">Add Product</button>
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
