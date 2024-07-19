<%-- 
    Document   : notificationList
    Created on : Jul 19, 2024, 2:50:48 AM
    Author     : thinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" defer></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" defer></script>
    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <br><br><br>
        <div class="page-heading header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div><br></div>
                        <br><br>
                        <span class="breadcrumb"><a href="#">Notification</a></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="d-flex vh-100">
            <div class="w-25 bg-light p-4 d-flex flex-column">
                <div class="d-flex justify-content-between mb-4">
                    <h2 class="h5">Notification</h2>
                </div>
                <div class="relative mb-4">

                    <input type="search" placeholder="Search Messenger" class="form-control col-lg-10" name="search" id="searchInput" style="border-radius: 15px"/>
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                    </svg></button>


                </div>
                <div class="flex-grow-1 overflow-auto" id="notificationListContainer">
                    <c:forEach items="${requestScope.notificationList}" var="no">

                        <a class="d-flex align-items-center p-2 text-white mb-2 rounded cursor-pointer" href="NotificationList?notification_id=${no.id}" style="background: #221fc49c;text-decoration: none;">
                            <img class="rounded-circle me-2" src="${no.getFrom_user_id().getImage()}" alt="User profile picture" style="width: 40px; height: 40px;" />
                            <div class="flex-grow-1">
                                <div class="">${no.getFrom_user_id().getFirst_name()} ${no.getFrom_user_id().getLast_name()}</div>
                                <div>
                                    <h2 class="h6 ">${no.title}</h2>
                                    <p class="formatted-time text-white" data-datetime="${no.time}"></p>
                                </div>
                            </div>
                        </a>


                    </c:forEach>
                </div>
            </div>
            <script type="text/javascript">
                document.getElementById('searchInput').addEventListener('input', function () {
                    const searchValue = this.value;
                    const xhr = new XMLHttpRequest();
                    xhr.open('GET', 'NotificationList?search=' + encodeURIComponent(searchValue), true);
                    xhr.onload = function () {
                        if (xhr.status === 200) {
                            const notificationListContainer = document.getElementById('notificationListContainer');
                            notificationListContainer.innerHTML = xhr.responseText;

                            // Định dạng lại thời gian sau khi cập nhật danh sách
                            const formattedTimeElements = document.querySelectorAll('.formatted-time');
                            formattedTimeElements.forEach(function (element) {
                                const originalDateTime = element.dataset.datetime;
                                element.textContent = formatDateTime(originalDateTime);
                            });
                        }
                    };
                    xhr.send();
                });

                function formatDateTime(dateTimeString) {
                    const date = new Date(dateTimeString);
                    const options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric', hour12: true};
                    return date.toLocaleDateString('en-US', options);
                }

                window.onload = function () {
                    const formattedTimeElements = document.querySelectorAll('.formatted-time');
                    formattedTimeElements.forEach(function (element) {
                        const originalDateTime = element.dataset.datetime;
                        element.textContent = formatDateTime(originalDateTime);
                    });
                };
            </script>

            <div class="w-75 bg-white p-4 d-flex flex-column border">
                <c:if test="${notification != null}">
                    <div class="d-flex justify-content-between mb-4">
                        <div class="d-flex align-items-center">
                            <img class="rounded-circle me-2" src="${notification.getFrom_user_id().getImage()}" alt="User profile picture" style="width: 40px; height: 40px;" />
                            <div>
                                <div class="fw-bold">${notification.getFrom_user_id().getLast_name()} ${notification.getFrom_user_id().getFirst_name()}</div>
                            </div>
                        </div>
                    </div>

                    ${notification.message}

                </c:if>

            </div>
        </div>
        <script type="text/javascript">
            function formatDateTime(dateTimeString) {
                const date = new Date(dateTimeString);
                const options = {year: 'numeric', month: 'short', day: 'numeric', hour: 'numeric', minute: 'numeric', hour12: true};
                return date.toLocaleDateString('en-US', options);
            }

            window.onload = function () {
                const formattedTimeElements = document.querySelectorAll('.formatted-time');
                formattedTimeElements.forEach(function (element) {
                    const originalDateTime = element.dataset.datetime;
                    element.textContent = formatDateTime(originalDateTime);
                });
            };
        </script>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </body>

</html>
