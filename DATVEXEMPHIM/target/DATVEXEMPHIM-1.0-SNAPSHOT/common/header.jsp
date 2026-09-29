<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String currentPage = (String) request.getAttribute("currentPage");
    if (currentPage == null) currentPage = "";
%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">

<nav class="navbar">
    <div class="nav-left">
<<<<<<< HEAD
        <a href="${pageContext.request.contextPath}/user/trangchu.jsp" class="nav-logo">
            <svg class="logo-icon" width="36" height="36" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
=======
        <!-- Logo -->
        <a href="${pageContext.request.contextPath}/user/trangchu.jsp" class="nav-logo">
            <svg class="logo-icon" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
                <circle cx="20" cy="20" r="18.5" stroke="#e50914" stroke-width="2.2"/>
                <circle cx="20" cy="20" r="7"    fill="none" stroke="#e50914" stroke-width="2"/>
                <circle cx="20" cy="20" r="2.5"  fill="#e50914"/>
                <circle cx="20" cy="7.5"  r="2.2" fill="#e50914"/>
                <circle cx="20" cy="32.5" r="2.2" fill="#e50914"/>
                <circle cx="7.5"  cy="20" r="2.2" fill="#e50914"/>
                <circle cx="32.5" cy="20" r="2.2" fill="#e50914"/>
                <circle cx="11.2" cy="11.2" r="2.2" fill="#e50914"/>
                <circle cx="28.8" cy="28.8" r="2.2" fill="#e50914"/>
                <circle cx="28.8" cy="11.2" r="2.2" fill="#e50914"/>
                <circle cx="11.2" cy="28.8" r="2.2" fill="#e50914"/>
            </svg>
            <div class="logo-text">
                <div class="logo-name">CINE<span>+</span></div>
                <div class="logo-sub">More Movies, More Feelings</div>
            </div>
        </a>
<<<<<<< HEAD
        <ul class="nav-menu">
            <li><a href="${pageContext.request.contextPath}/user/trangchu.jsp"      class="<%= "trangchu".equals(currentPage)  ? "active" : "" %>">Trang chủ</a></li>
            <li><a href="#"                                                          class="<%= "phim".equals(currentPage)      ? "active" : "" %>">Phim</a></li>
            <li><a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="<%= "lichChieu".equals(currentPage) ? "active" : "" %>">Lịch chiếu</a></li>
            <li><a href="#"                                                          class="<%= "rap".equals(currentPage)       ? "active" : "" %>">Rạp</a></li>
            <li><a href="#"                                                          class="<%= "uuDai".equals(currentPage)     ? "active" : "" %>">Ưu đãi</a></li>
        </ul>
    </div>
    <div class="nav-right">
        <div class="search-box">
            <svg width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
            </svg>
            <input type="text" placeholder="Tìm kiếm phim, diễn viên...">
        </div>
        <a href="#" class="nav-icon-btn" title="Tài khoản">
            <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
=======

        <!-- Menu -->
        <ul class="nav-menu">
            <li><a href="${pageContext.request.contextPath}/user/trangchu.jsp"
                   class="<%= "trangchu".equals(currentPage) ? "active" : "" %>">Trang chủ</a></li>
            <li><a href="#"
                   class="<%= "phim".equals(currentPage) ? "active" : "" %>">Phim</a></li>
            <li><a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp"
                   class="<%= "lichChieu".equals(currentPage) ? "active" : "" %>">Lịch chiếu</a></li>
            <li><a href="#"
                   class="<%= "rap".equals(currentPage) ? "active" : "" %>">Rạp</a></li>
            <li><a href="#"
                   class="<%= "uuDai".equals(currentPage) ? "active" : "" %>">Ưu đãi</a></li>
        </ul>
    </div>

    <!-- Right: Search + User + Hamburger -->
    <div class="nav-right">
        <div class="search-box">
            <span class="si">
                <svg width="13" height="13" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                    <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
                </svg>
            </span>
            <input type="text" placeholder="Tìm kiếm phim, diễn viên...">
        </div>

        <a href="#" class="nav-icon-btn" title="Tài khoản">
            <svg width="15" height="15" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
                <circle cx="12" cy="7" r="4"/>
            </svg>
        </a>
<<<<<<< HEAD
        <button class="nav-icon-btn" title="Menu">
            <svg width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.2" viewBox="0 0 24 24">
=======

        <button class="nav-icon-btn" title="Menu">
            <svg width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.2" viewBox="0 0 24 24">
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
                <line x1="3" y1="6"  x2="21" y2="6"/>
                <line x1="3" y1="12" x2="21" y2="12"/>
                <line x1="3" y1="18" x2="21" y2="18"/>
            </svg>
        </button>
    </div>
</nav>
