<%-- 
    Document   : ApartmentPostList
    Created on : May 28, 2024, 1:05:29 AM
    Author     : thinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.0/mdb.min.css"
            rel="stylesheet"
            />
        <style>
            @media (max-width: 767.98px) {
                .border-sm-start-none {
                    border-left: none !important;
                }
            }
        </style>
    </head>
    <body>
        <section style="background-color: #eee;">
            <div class="container py-5">


                <c:forEach items="${requestScope.apartmentPostList}" var="ap">
                    <div class="row justify-content-center mb-3">
                        <div class="col-md-12 col-xl-10">
                            <div class="card shadow-0 border rounded-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                            <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                                <img src="uploads/${ap.first_image}"
                                                     class="w-100" />
                                                <a href="#!">
                                                    <div class="hover-overlay">
                                                        <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6">
                                            <h5>${ap.title}</h5>
                                            <div class="d-flex flex-row">
                                                <div class="text-danger mb-1 me-2">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <span>310</span>
                                            </div>
                                            <div class="mt-1 mb-0 text-muted small">
                                                <span>100% cotton</span>
                                                <span class="text-primary"> • </span>
                                                <span>Light weight</span>
                                                <span class="text-primary"> • </span>
                                                <span>Best finish<br /></span>
                                            </div>
                                            <div class="mb-2 text-muted small">
                                                <span>Unique design</span>
                                                <span class="text-primary"> • </span>
                                                <span>For men</span>
                                                <span class="text-primary"> • </span>
                                                <span>Casual<br /></span>
                                            </div>
                                            <p class="text-truncate mb-4 mb-md-0">
                                                There are many variations of passages of Lorem Ipsum available, but the
                                                majority have suffered alteration in some form, by injected humour, or
                                                randomised words which don't look even slightly believable.
                                            </p>
                                        </div>
                                        <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                            <div class="d-flex flex-row align-items-center mb-1">
                                                <h4 class="mb-1 me-1">$13.99</h4>
                                                <span class="text-danger"><s>$20.99</s></span>
                                            </div>
                                            <h6 class="text-success">Free shipping</h6>
                                            <div class="d-flex flex-column mt-4">
                                                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-sm" type="button">Details</button>
                                                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-primary btn-sm mt-2" type="button">
                                                    Add to wishlist
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>




            </div>
        </section>
    </body>
</html>