<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <style>
            .preview {
                display: flex;
                flex-wrap: wrap;
            }
            .preview img {
                max-width: 150px;
                margin: 10px;
            }
            .error {
                color: red;
                font-size: 0.9em;
            }
        </style>
    </head>
    <body>
        <form id="apartmentForm" action="addApartment" method="post" enctype="multipart/form-data" >
            <div class="container">
                <div class="row">
                    <script src="https://esgoo.net/scripts/jquery.js"></script>
                    <style type="text/css">
                        .css_select_div {
                            text-align: center;
                        }
                        .css_select {
                            display: inline-table;
                            width: 25%;
                            padding: 5px;
                            margin: 5px 2%;
                            border: solid 1px #686868;
                            border-radius: 5px;
                        }
                    </style>
                    <script>
                        $(document).ready(function () {
                            // Fetch provinces
                            $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
                                if (data_tinh.error == 0) {
                                    $.each(data_tinh.data, function (key_tinh, val_tinh) {
                                        $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                                    });
                                    $("#tinh").change(function (e) {
                                        var idtinh = $(this).val();
                                        $("#hidden_tinh").val($("#tinh option:selected").text());
                                        // Fetch districts
                                        $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                                            if (data_quan.error == 0) {
                                                $("#quan").html('<option value="0">Quận Huyện</option>');
                                                $("#phuong").html('<option value="0">Phường Xã</option>');
                                                $.each(data_quan.data, function (key_quan, val_quan) {
                                                    $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                                                });
                                                // Fetch wards
                                                $("#quan").change(function (e) {
                                                    var idquan = $(this).val();
                                                    $("#hidden_quan").val($("#quan option:selected").text());
                                                    $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                                                        if (data_phuong.error == 0) {
                                                            $("#phuong").html('<option value="0">Phường Xã</option>');
                                                            $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                                                $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                                                            });
                                                            $("#phuong").change(function (e) {
                                                                $("#hidden_phuong").val($("#phuong option:selected").text());
                                                            });
                                                        }
                                                    });
                                                });
                                            }
                                        });
                                    });
                                }
                            });
                        });
                    </script> 

                    <table class="col-md-8">
                        <thead>
                            <tr>
                                <th class="col-md-4"><h2 style="color: royalblue">I. Thông tin cơ bản</h2></th>
                                <th class="col-md-5"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Tên căn hộ</td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input required placeholder="Điền tên căn hộ" type="text" name="name_apartment" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="name_apartment_error"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Loại căn hộ</td>
                                <td>
                                    <select required class="form-select" name="apartment_type" aria-label="Default select example">
                                        <option value="">Chọn loại hình căn hộ</option>
                                        <c:forEach items="${requestScope.apartment_types_list}" var="at">
                                            <option value="${at.id}">${at.name}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="error" id="apartment_type_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Tỉnh/Thành phố</td>
                                <td>      
                                    <select required class="form-select" id="tinh" aria-label="Default select example">
                                        <option value="0">Tỉnh Thành</option>
                                    </select>
                                    <div class="error" id="tinh_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Quận/Huyện</td>
                                <td>
                                    <select required class="form-select" id="quan" aria-label="Default select example">
                                        <option value="0">Quận huyện</option>
                                    </select>
                                    <div class="error" id="quan_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Xã/Phường</td>
                                <td>
                                    <select required class="form-select" id="phuong" aria-label="Default select example">
                                        <option value="0">Phường xã</option>
                                    </select>
                                    <div class="error" id="phuong_error"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>Địa chỉ cụ thể</td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input required placeholder="Điền địa chỉ cụ thể như số nhà, ngõ, đường,..." type="text" name="address" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="address_error"></div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="hidden" name="tinh" id="hidden_tinh">
                    <input type="hidden" name="quan" id="hidden_quan">
                    <input type="hidden" name="phuong" id="hidden_phuong">
                </div>
                <hr>
                <br>
                <div class="row">
                    <table border="0" class="col-md-12">
                        <thead>
                            <tr>
                                <th class="col-md-3"><h2 style="color: royalblue">II. Thông tin mô tả</h2></th>
                                <th class="col-md-4"></th>
                                <th class="col-md-2"></th>
                                <th class="col-md-3"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Giá tiền (VNĐ)</td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input required type="text" name="price" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="price_error"></div>
                                    </div>
                                </td>
                                <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Diện tích (m2)*</td>
                                <td>
                                    <div class="input-group mb-3">
                                        <input required type="text" name="area" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="area_error"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Số lượng phòng ngủ</td>
                                <td> 
                                    <div class="input-group mb-3">
                                        <input required type="text" name="number_of_bedroom" class="form-control" aria-label="Text input with checkbox">
                                        <div class="error" id="number_of_bedroom_error"></div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <hr>
                <br>
                <div class="row">
                    <h2 class="col-md-12" style="color: royalblue">III. Thông tin hình ảnh</h2>
                    <div class="col-md-12" style="border: 1px solid #686868;">
                        <p style="justify-items: center;">Tin đăng có hình ảnh thường hiệu quả hơn 59% tin đăng không có hình ảnh.<br></p>

                        <input type="file" id="imageInput" name="images" multiple accept="image/*"><br><br>
                        <div class="preview" id="imagePreview"></div><br>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <h2 class="col-md-12" style="color: royalblue">IV. Thông tin bổ sung</h2>
                    <h4 class="col-md-12" style="color: royalblue">Phòng Khách</h4>
                    <c:forEach items="${requestScope.propertys_List_livingroom}" var="pll">
                        <span class="col-md-2">
                            <div class="form-check">
                                <input name="property" class="form-check-input" type="checkbox" value="${pll.id}" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    ${pll.name}
                                </label>
                            </div>
                        </span>
                    </c:forEach>

                    <h4 class="col-md-12" style="color: royalblue">Phòng Ngủ</h4>
                    <c:forEach items="${requestScope.propertys_List_bedroom}" var="pll">
                        <span class="col-md-2">
                            <div class="form-check">
                                <input name="property" class="form-check-input" type="checkbox" value="${pll.id}" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    ${pll.name}
                                </label>
                            </div>
                        </span>
                    </c:forEach>
                    <h4 class="col-md-12" style="color: royalblue">Phòng Bếp</h4>
                    <c:forEach items="${requestScope.propertys_List_kitchen}" var="pll">
                        <span class="col-md-2">
                            <div class="form-check">
                                <input name="property" class="form-check-input" type="checkbox" value="${pll.id}" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    ${pll.name}
                                </label>
                            </div>
                        </span>
                    </c:forEach>
                    <h4 class="col-md-12" style="color: royalblue">Phòng Tắm</h4>
                    <c:forEach items="${requestScope.propertys_List_bathroom}" var="pll">
                        <span class="col-md-2">
                            <div class="form-check">
                                <input name="property" class="form-check-input" type="checkbox" value="${pll.id}" id="flexCheckDefault">
                                <label class="form-check-label" for="flexCheckDefault">
                                    ${pll.name}
                                </label>
                            </div>
                        </span>
                    </c:forEach>
                </div>
                <hr>
            </div>
            <div style="display: flex; justify-content: center;">
                <input class="btn btn-primary btn-lg" type="submit" value="Lưu thông tin căn hộ">  
            </div>
        </form>

        <script>
            document.getElementById('imageInput').addEventListener('change', function (event) {
                const files = event.target.files;
                const previewContainer = document.getElementById('imagePreview');
                previewContainer.innerHTML = '';

                Array.from(files).forEach(file => {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        previewContainer.appendChild(img);
                    };
                    reader.readAsDataURL(file);
                });
            });

            document.getElementById('apartmentForm').addEventListener('submit', function (event) {
                event.preventDefault();
                const form = event.target;
                let isValid = true;

                // Custom validation messages
                if (!form.name_apartment.value) {
                    isValid = false;
                    document.getElementById('name_apartment_error').textContent = 'Vui lòng điền tên căn hộ';
                } else {
                    document.getElementById('name_apartment_error').textContent = '';
                }

                if (!form.apartment_type.value) {
                    isValid = false;
                    document.getElementById('apartment_type_error').textContent = 'Vui lòng chọn loại căn hộ';
                } else {
                    document.getElementById('apartment_type_error').textContent = '';
                }

                if (form.tinh.value == "0") {
                    isValid = false;
                    document.getElementById('tinh_error').textContent = 'Vui lòng chọn tỉnh/thành phố';
                } else {
                    document.getElementById('tinh_error').textContent = '';
                }

                if (form.quan.value == "0") {
                    isValid = false;
                    document.getElementById('quan_error').textContent = 'Vui lòng chọn quận/huyện';
                } else {
                    document.getElementById('quan_error').textContent = '';
                }

                if (form.phuong.value == "0") {
                    isValid = false;
                    document.getElementById('phuong_error').textContent = 'Vui lòng chọn xã/phường';
                } else {
                    document.getElementById('phuong_error').textContent = '';
                }

                if (!form.address.value) {
                    isValid = false;
                    document.getElementById('address_error').textContent = 'Vui lòng điền địa chỉ cụ thể';
                } else {
                    document.getElementById('address_error').textContent = '';
                }

                if (!form.price.value) {
                    isValid = false;
                    document.getElementById('price_error').textContent = 'Vui lòng điền giá tiền';
                } else {
                    document.getElementById('price_error').textContent = '';
                }

                if (!form.area.value) {
                    isValid = false;
                    document.getElementById('area_error').textContent = 'Vui lòng điền diện tích';
                } else {
                    document.getElementById('area_error').textContent = '';
                }

                if (!form.number_of_bedroom.value) {
                    isValid = false;
                    document.getElementById('number_of_bedroom_error').textContent = 'Vui lòng điền số lượng phòng ngủ';
                } else {
                    document.getElementById('number_of_bedroom_error').textContent = '';
                }

                if (isValid) {
                    form.submit();
                }
            });
        </script>
        <br><br>
        <jsp:include page="Footer.jsp"/>
    </body>
</html>
