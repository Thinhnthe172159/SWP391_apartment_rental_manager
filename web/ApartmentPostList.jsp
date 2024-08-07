 <%-- 
    Document   : apartmentPostLists
    Created on : Jun 4, 2024, 10:33:18 PM
    Author     : thinh
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">


    <head>

        <script>(function (w, d, s, l, i) {
                w[l] = w[l] || [];
                w[l].push({'gtm.start':
                            new Date().getTime(), event: 'gtm.js'});
                var f = d.getElementsByTagName(s)[0],
                        j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
                j.async = true;
                j.src =
                        '../../../../../../www.googletagmanager.com/gtm5445.html?id=' + i + dl;
                f.parentNode.insertBefore(j, f);
            })(window, document, 'script', 'dataLayer', 'GTM-TNL8QV6');</script>
        <!-- End Google Tag Manager -->
        <title>The Nest - Real Estate HTML Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/animate.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-submenu.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">
        <link rel="stylesheet" href="css/leaflet.css" type="text/css">
        <link rel="stylesheet" href="css/map.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/flaticon/font/flaticon.css">
        <link type="text/css" rel="stylesheet" href="fonts/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" type="text/css" href="fonts/linearicons/style.css">
        <link rel="stylesheet" type="text/css"  href="css/jquery.mCustomScrollbar.css">
        <link rel="stylesheet" type="text/css"  href="css/dropzone.css">
        <link rel="stylesheet" type="text/css"  href="css/magnific-popup.css">
        <link rel="stylesheet" type="text/css"  href="css/slick.css">
        <link rel="stylesheet" type="text/css" href="css/initial.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" id="style_sheet" href="css/skins/default.css">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" >
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPlayfair+Display:400,700%7CRoboto:100,300,400,400i,500,700">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;600;700;900&amp;family=Roboto:wght@400;500;700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@100;300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/ie10-viewport-bug-workaround.css">
        <script src="js/ie-emulation-modes-warning.js"></script>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-villa-agency.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <br><br><br><br>
        <div class="page-heading header-text">  
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <form class="search row justify-content-center" method="get" action="ApartmentPostList">
                            <i class="fa fa-search"></i>
                            <input style="border-radius: 20px;height: 40px;z-index: 1;" name="name" type="text" class="col-md-9" placeholder="Find apartment post title"> 
                            <button class="btn btn-primary col-md-1" style="border-radius: 20px; z-index: 10;background:" type="submit" id="submit">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                                </svg> Search
                            </button>
                        </form>
                        <div><br></div>
                        <span class="breadcrumb"><a href="#">Apartment</a></span>
                        <h3>For you</h3>
                    </div>
                </div>
            </div>
        </div>

        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TNL8QV6"
                          height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
        <!-- End Google Tag Manager (noscript) -->
 


        <!-- Properties section body start -->
        <div class="properties-section-body content-area">
            <div class="container">
                <div class="row col-md-12">
                    <div class="col-lg-8 col-md-12 col-xs-12">
                        <!-- Option bar start -->
                        <div class="option-bar">
                            <div class="row">
                                <div class="col-lg-5 col-md-5 col-sm-5">
                                    <h4>
                                        <span class="heading-icon">
                                            <i class="fa fa-th-list"></i>
                                        </span>
                                        <span class="title">Properties List</span>
                                    </h4>
                                </div>

                            </div>
                        </div>
                        <!-- Option bar end -->
                        <div class="pagination-box text-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <c:if test="${page_index > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="ApartmentPostList?name=${name}&apartmentType=${apartmentType}&type=${type}&tinh=${tinh}&quan=${quan}&phuong=${phuong}&moneyUp=${moneyUp}&moneyDown=${moneyDown}&bedroom=${bedroom}&areaUp=${areaUp}&areaDown=${areaDown}&page_index=${page_index-1}">Prev</a>
                                        </li>
                                    </c:if>
                                    <c:forEach items="${pageList}" var="i">
                                        <li class="page-item">
                                            <a href="ApartmentPostList?name=${name}&apartmentType=${apartmentType}&type=${type}&tinh=${tinh}&quan=${quan}&phuong=${phuong}&moneyUp=${moneyUp}&moneyDown=${moneyDown}&bedroom=${bedroom}&areaUp=${areaUp}&areaDown=${areaDown}&page_index=${i}" class="page-link ${i == page_index ? 'active' : ''}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${page_index < pageList.size()}">
                                        <li class="page-item">
                                            <a class="page-link" href="ApartmentPostList?name=${name}&apartmentType=${apartmentType}&type=${type}&tinh=${tinh}&quan=${quan}&phuong=${phuong}&moneyUp=${moneyUp}&moneyDown=${moneyDown}&bedroom=${bedroom}&areaUp=${areaUp}&areaDown=${areaDown}&page_index=${page_index+1}">Next</a>
                                        </li>
                                    </c:if>
                                </ul>


                            </nav>
                        </div>
                        <!-- Property start -->

                        <c:forEach items="${requestScope.apartmentPostList}" var="ap">
                            <div class="property row g-0 fp2 clearfix wow fadeInUp delay-03s">
                                <div class="col-lg-5 col-md-5 col-sm-12">
                                    <!-- Property img -->
                                    <div class="property-img">
                                        <div class="property-tag button alt featured" style="<c:if test="${ap.payment_id.id == 1}" >
                                             background: black;
                                            </c:if>
                                            <c:if test="${ap.payment_id.id == 2}" >
                                                background: blue;
                                            </c:if>
                                            <c:if test="${ap.payment_id.id == 3}" >
                                                background: #99cc00;
                                            </c:if>
                                            <c:if test="${ap.payment_id.id == 4}" >
                                                background: red;
                                            </c:if>">Vip ${ap.payment_id.name}</div>
                                        <div class="property-tag button sale">${ap.apartment_type.name}</div>
                                        <div class="property-price"><fmt:formatNumber value="${ap.price}" pattern="#,###"/>vnd</div>
                                        <img src="uploads/${ap.first_image}" alt="fp-list" class="img-responsive hp-1">
                                        <div class="property-overlay">
                                            <a href="ApartmentDetail?Apartment_id=${ap.apartment_id.id}&apartment_post_id=${ap.id}" class="overlay-link">
                                                <i class="fa fa-link"></i>
                                            </a>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7 col-md-7 col-sm-12 property-content">
                                    <div class="info">
                                        <!-- title -->
                                        <h1 class="title">
                                            <a href="ApartmentDetail?Apartment_id=${ap.apartment_id.id}&apartment_post_id=${ap.id}">    
                                                <c:if test="${ap.payment_id.id == 1}" >
                                                    <h6 style="color: black">${ap.title}</h6>
                                                </c:if>
                                                <c:if test="${ap.payment_id.id == 2}" >
                                                    <h5 style="color: blue;">${ap.title}</h5>
                                                </c:if>
                                                <c:if test="${ap.payment_id.id == 3}" >
                                                    <h4 style="color: #99cc00;font-style: italic;" >${ap.title.toUpperCase()}</h4>
                                                </c:if>
                                                <c:if test="${ap.payment_id.id == 4}" >
                                                    <h3 style="font-style: italic; color: red;">${ap.title.toUpperCase()}</h3>
                                                </c:if></a>
                                        </h1>
                                        <!-- Property address -->
                                        <h3 class="property-address">
                                            <a href="ApartmentDetail?Apartment_id=${ap.apartment_id.id}&apartment_post_id=${ap.id}">
                                                <i class="fa fa-map-marker"></i>${ap.city},${ap.district},${ap.commune}
                                            </a>
                                        </h3>
                                        <!-- Facilities List -->
                                        <ul class="facilities-list clearfix">
                                            <li>
                                                <i class="flaticon-square-layouting-with-black-square-in-east-area"></i>
                                                <span>${ap.area} m2</span>
                                            </li>
                                            <li>
                                                <i class="flaticon-bed"></i>
                                                <span>${ap.number_of_bedroom} bedroom</span>
                                            </li>
                                            <li>
                                                <!-- thêm vào danh sách yêu thích -->

                                                <span><a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-heart" viewBox="0 0 16 16">
                                                        <path fill-rule="evenodd" d="M8 4.41c1.387-1.425 4.854 1.07 0 4.277C3.146 5.48 6.613 2.986 8 4.412z"/>
                                                        <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z"/>
                                                        </svg>Lưu</a></span>
                                            </li>

                                        </ul>
                                        <!-- Property footer -->
                                    </div>
                                    <div class="property-footer">
                                        <span class="left">
                                            <a href="#"><i class="fa fa-user"></i>${ap.landlord_id.first_name} ${ap.landlord_id.last_name}</a>
                                        </span>
                                        <span class="right">
                                            <i class="fa fa-calendar"></i>${ap.post_start}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- Property end -->

                        <!-- Pagination box start -->
                        <div class="pagination-box text-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <c:if test="${page_index > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="ApartmentPostList?name=${name}&apartmentType=${apartmentType}&type=${type}&tinh=${tinh}&quan=${quan}&phuong=${phuong}&moneyUp=${moneyUp}&moneyDown=${moneyDown}&bedroom=${bedroom}&areaUp=${areaUp}&areaDown=${areaDown}&page_index=${page_index-1}">Prev</a>
                                        </li>
                                    </c:if>
                                    <c:forEach items="${pageList}" var="i">
                                        <li class="page-item">
                                            <a href="ApartmentPostList?name=${name}&apartmentType=${apartmentType}&type=${type}&tinh=${tinh}&quan=${quan}&phuong=${phuong}&moneyUp=${moneyUp}&moneyDown=${moneyDown}&bedroom=${bedroom}&areaUp=${areaUp}&areaDown=${areaDown}&page_index=${i}" class="page-link ${i == page_index ? 'active' : ''}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${page_index < pageList.size()}">
                                        <li class="page-item">
                                            <a class="page-link" href="ApartmentPostList?name=${name}&apartmentType=${apartmentType}&type=${type}&tinh=${tinh}&quan=${quan}&phuong=${phuong}&moneyUp=${moneyUp}&moneyDown=${moneyDown}&bedroom=${bedroom}&areaUp=${areaUp}&areaDown=${areaDown}&page_index=${page_index+1}">Next</a>
                                        </li>
                                    </c:if>
                                </ul>


                            </nav>
                        </div>
                        <!-- Pagination box end -->
                    </div>
                    <div class="col-lg-4 col-md-12 col-xs-12">
                        <!-- Advanced search start -->
                        <div class="sidebar-widget advanced-search">
                            <div class="main-title-4">
                                <h1>Advanced  Search</h1>
                            </div>
                            <form action="ApartmentPostList" method="GET">
                                <div class="form-group">
                                    <select class="form-select" name="apartmentType" aria-label="Default select example">
                                        <option value="0">Loại căn hộ</option>
                                        <c:forEach items="${requestScope.apartment_types_list}" var="atl">
                                            <option value="${atl.id}">${atl.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select  class="form-select" id="tinh" aria-label="Default select example">
                                        <option value="0">Tỉnh Thành</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select  class="form-select" id="quan" aria-label="Default select example">
                                        <option value="0">Quận huyện</option><hr>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <select    class="form-select " id="phuong" aria-label="Default select example">
                                        <option value="0">Xã Phường</option>
                                        <hr>
                                    </select>
                                </div>
                                <input type="hidden" name="tinh" id="hidden_tinh">
                                <input type="hidden" name="quan" id="hidden_quan">
                                <input type="hidden" name="phuong" id="hidden_phuong">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <select class="form-select" name="bedroom">
                                                <option value="0">Số phòng ngủ</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <select class="form-select" name="type">
                                                <option value="0">Sắp xếp theo giá</option>
                                                <option value="1">Tăng dần</option>
                                                <option value="2">Giảm dần</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <style>
                                    .range-slider {
                                        margin: 20px 0;
                                    }

                                    .ui-slider {
                                        width: 100%;
                                    }

                                    .clearfix::after {
                                        content: "";
                                        display: table;
                                        clear: both;
                                    }
                                </style>

                                <div class="range-slider">
                                    <label>Diện tích</label>
                                    <div id="ArearangeSlider" data-min="0" data-max="500" data-unit="m2" class="range-slider-ui ui-slider"></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <input id="areaUp" class="selectpicker search-fields" type="number" name="areaUp" placeholder="0">
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <input id="areaDown" class="selectpicker search-fields" type="number" name="areaDown" placeholder="100">
                                    </div>
                                </div>

                                <!-- Include jQuery and jQuery UI -->
                                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
                                <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

                                <script>
            $(document).ready(function () {
                var $slider = $("#ArearangeSlider");
                var $minInput = $("#areaUp");
                var $maxInput = $("#areaDown");

                $slider.slider({
                    range: true,
                    min: 0,
                    max: 500,
                    values: [0, 500],
                    slide: function (event, ui) {
                        $minInput.val(ui.values[0]);
                        $maxInput.val(ui.values[1]);
                    }
                });

                $minInput.val($slider.slider("values", 0));
                $maxInput.val($slider.slider("values", 1));

                function updateSlider() {
                    var min = parseInt($minInput.val(), 10);
                    var max = parseInt($maxInput.val(), 10);

                    if (min > max) {
                        min = max;
                        $minInput.val(min);
                    }
                    if (max < min) {
                        max = min;
                        $maxInput.val(max);
                    }

                    $slider.slider("values", 0, min);
                    $slider.slider("values", 1, max);
                }

                $minInput.on("input", function () {
                    clearTimeout(this.delay);
                    this.delay = setTimeout(function () {
                        updateSlider();
                    }.bind(this), 1500);
                });

                $maxInput.on("input", function () {
                    clearTimeout(this.delay);
                    this.delay = setTimeout(function () {
                        updateSlider();
                    }.bind(this), 1500);
                });
            });
                                </script>



                                <div class="range-slider">
                                    <label>Giá tiền khoảng</label>
                                    <div id="rangeSlider" data-min="0" data-max="100" data-unit="triệu vnd" class="range-slider-ui ui-slider"></div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <input id="priceUp" class="selectpicker search-fields" type="number" name="moneyUp" placeholder="0">
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <input id="priceDown" class="selectpicker search-fields" type="number" name="moneyDown" placeholder="100">
                                    </div>
                                </div>
                                <!-- Include jQuery and jQuery UI -->
                                <!-- Include jQuery and jQuery UI -->
                                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
                                <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

                                <script>
            $(document).ready(function () {
                var $slider = $("#rangeSlider");
                var $minInput = $("#priceUp");
                var $maxInput = $("#priceDown");

                $slider.slider({
                    range: true,
                    min: 0,
                    max: 100,
                    values: [0, 100],
                    slide: function (event, ui) {
                        $minInput.val(ui.values[0]);
                        $maxInput.val(ui.values[1]);
                    }
                });

                $minInput.val($slider.slider("values", 0));
                $maxInput.val($slider.slider("values", 1));

                function updateSlider() {
                    var min = parseInt($minInput.val(), 10);
                    var max = parseInt($maxInput.val(), 10);

                    if (min > max) {
                        min = max;
                        $minInput.val(min);
                    }
                    if (max < min) {
                        max = min;
                        $maxInput.val(max);
                    }

                    $slider.slider("values", 0, min);
                    $slider.slider("values", 1, max);
                }

                $minInput.on("input", function () {
                    clearTimeout(this.delay);
                    this.delay = setTimeout(function () {
                        updateSlider();
                    }.bind(this), 1500);
                });

                $maxInput.on("input", function () {
                    clearTimeout(this.delay);
                    this.delay = setTimeout(function () {
                        updateSlider();
                    }.bind(this), 1500);
                });
            });
                                </script>



                                <div class="form-group mb-0">
                                    <button type="submit" class="button-md button-theme btn-3 w-100" style="">Search</button>
                                </div>
                            </form>
                        </div>
                     

                        <!-- Popular posts start -->
                        <div class="sidebar-widget popular-posts">
                            <div class="main-title-4">
                                <h1>Recent Properties</h1>
                            </div>
                            <c:forEach items="${ApartmentPopular}" var="app">
                                <ul style="text-decoration: dotted;">
                                    <li><a href="ApartmentDetail?Apartment_id=${app.apartment_id.id}&apartment_post_id=${app.id}" style="color: blue">* ${app.title}</a></li>
                            </ul></c:forEach>
                        </div>
                      
                    </div>



                </div>
            </div>
        </div>
        <!-- Properties section body end -->
        <jsp:include page="Footer.jsp"/>
        <!-- Partners strat -->

        <!-- Footer end -->




        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script  src="js/bootstrap-submenu.js"></script>
        <script src="js/rangeslider.js"></script>
        <script src="js/jquery.mb.YTPlayer.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.scrollUp.js"></script>
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/leaflet.js"></script>
        <script src="js/leaflet-providers.js"></script>
        <script src="js/leaflet.markercluster.js"></script>
        <script src="js/dropzone.js"></script>
        <script src="js/jquery.filterizr.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/maps.js"></script>
        <script src="js/sidebar.js"></script>
        <script src="js/app.js"></script>
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

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="js/ie10-viewport-bug-workaround.js"></script>
        <!-- Custom javascript -->
        <script src="js/ie10-viewport-bug-workaround.js"></script>

    </body>

    <!-- Mirrored from storage.googleapis.com/theme-vessel-items/checking-sites/nest-2-html/HTML/main/properties-list-rightside.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 04 Jun 2024 15:11:30 GMT -->
</html>

