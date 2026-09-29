<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%  request.setAttribute("currentPage", "lichChieu"); %>
=======
<%
    request.setAttribute("currentPage", "lichChieu");
%>
<title>CINE+ | Chọn Suất Chiếu</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
<%-- keep the shared project header instead of duplicating the nav --%>
<%@ include file="../common/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setAttribute("currentPage", "lichChieu");
%>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINE+ | Chọn Suất Chiếu</title>
<<<<<<< HEAD
    <%@ include file="../common/header.jsp" %>
</head>
<body>

<!-- ── Tiêu đề trang ── -->
<div class="page-title-bar">
    <div class="page-main-title">Chọn Suất Chiếu</div>
    <div class="page-title-bar-line"></div>
</div>

<div class="sc-container">

    <!-- DATE TABS -->
    <div class="date-tabs">
        <button class="date-tab active" onclick="switchDate(this)">
            <span class="dt-day">Hôm Nay</span><span class="dt-num">14/10</span>
        </button>
        <button class="date-tab" onclick="switchDate(this)">
            <span class="dt-day">Thứ Hai</span><span class="dt-num">15/10</span>
        </button>
        <button class="date-tab" onclick="switchDate(this)">
            <span class="dt-day">Thứ Ba</span><span class="dt-num">16/10</span>
        </button>
        <button class="date-tab" onclick="switchDate(this)">
            <span class="dt-day">Thứ Tư</span><span class="dt-num">17/10</span>
        </button>
        <button class="date-tab" onclick="switchDate(this)">
            <span class="dt-day">Thứ Năm</span><span class="dt-num">18/10</span>
        </button>
        <button class="date-tab" onclick="switchDate(this)">
            <span class="dt-day">Thứ Sáu</span><span class="dt-num">19/10</span>
        </button>
    </div>

    <!-- FILTERS -->
    <div class="sc-filters">
        <!-- Chọn rạp -->
        <div class="sc-filter-card">
            <label class="sc-filter-label">Chọn Rạp</label>
            <div class="sc-select-wrap">
                <select class="sc-select">
                    <option>Tất cả các rạp</option>
                    <option selected>CGV Vincom - Phòng 1 (2D)</option>
                    <option>BHD Landmark 81 - IMAX</option>
                    <option>Lotte Vincom - Phòng 1 IMAX</option>
                </select>
                <svg class="sc-select-arrow" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.5" viewBox="0 0 24 24">
                    <polyline points="6 9 12 15 18 9"/>
                </svg>
            </div>
        </div>
        <!-- Định dạng -->
        <div class="sc-filter-card">
            <label class="sc-filter-label">Định Dạng</label>
            <div class="sc-format-row">
                <label class="sc-fmt"><input type="radio" name="fmt" value="all"> Tất cả</label>
                <label class="sc-fmt"><input type="radio" name="fmt" value="2d" checked> 2D</label>
                <label class="sc-fmt"><input type="radio" name="fmt" value="3d"> 3D</label>
                <label class="sc-fmt"><input type="radio" name="fmt" value="imax"> IMAX</label>
                <label class="sc-fmt"><input type="radio" name="fmt" value="gold"> Gold Class</label>
            </div>
        </div>
    </div>

    <!-- MOVIE LIST -->
    <div class="sc-movie-list">

        <!-- Phim 1 -->
        <div class="sc-movie-card">
            <div class="sc-poster">
                <img src="https://image.tmdb.org/t/p/w154/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg"
                     alt="Thanh Gươm Diệt Quỷ" class="sc-poster-img"
                     onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
                <div class="sc-poster-ph" style="background:linear-gradient(145deg,#1a1a2e,#16213e);display:none;">🗡️</div>
                <div class="sc-poster-rating">★ 9.7</div>
            </div>
            <div class="sc-movie-body">
                <div class="sc-movie-name">Thanh Gươm Diệt Quỷ</div>
                <div class="sc-movie-meta">Hành động | 118 phút | Phiêu lưu</div>

                <div class="sc-cinema-group">
                    <div class="sc-cinema-name"><span>CGV Vincom - Phòng 1 (2D)</span></div>
                    <div class="sc-times">
                        <button class="sc-time" onclick="pickTime(this)">10:00</button>
                        <button class="sc-time hot" onclick="pickTime(this)">13:30 <span class="hot-tag">Hot</span></button>
                        <button class="sc-time" onclick="pickTime(this)">16:00</button>
                        <button class="sc-time" onclick="pickTime(this)">19:30</button>
                        <button class="sc-time" onclick="pickTime(this)">22:00</button>
                    </div>
                </div>

                <div class="sc-cinema-group">
                    <div class="sc-cinema-name"><span>CGV Landmark 81 - IMAX</span></div>
                    <div class="sc-times">
                        <button class="sc-time" onclick="pickTime(this)">11:00</button>
                        <button class="sc-time" onclick="pickTime(this)">14:30</button>
                        <button class="sc-time hot" onclick="pickTime(this)">18:00 <span class="hot-tag">Hot</span></button>
                        <button class="sc-time" onclick="pickTime(this)">21:30</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Phim 2 -->
        <div class="sc-movie-card">
            <div class="sc-poster">
                <img src="https://image.tmdb.org/t/p/w154/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg"
                     alt="Inside Out 2" class="sc-poster-img"
                     onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
                <div class="sc-poster-ph" style="background:linear-gradient(145deg,#0a1a0a,#1a3d1a);display:none;">😊</div>
                <div class="sc-poster-rating">★ 8.9</div>
            </div>
            <div class="sc-movie-body">
                <div class="sc-movie-name">Inside Out 2</div>
                <div class="sc-movie-meta">Hoạt hình | 100 phút | Gia đình</div>

                <div class="sc-cinema-group">
                    <div class="sc-cinema-name"><span>CGV Vincom - Phòng 1 (2D)</span></div>
                    <div class="sc-times">
                        <button class="sc-time" onclick="pickTime(this)">10:00</button>
                        <button class="sc-time hot" onclick="pickTime(this)">13:30 <span class="hot-tag">Hot</span></button>
                        <button class="sc-time" onclick="pickTime(this)">16:00</button>
                        <button class="sc-time" onclick="pickTime(this)">19:30</button>
                        <button class="sc-time" onclick="pickTime(this)">22:00</button>
                    </div>
                </div>

                <div class="sc-cinema-group">
                    <div class="sc-cinema-name"><span>CGV Landmark 81 - IMAX</span></div>
                    <div class="sc-times">
                        <button class="sc-time" onclick="pickTime(this)">11:00</button>
                        <button class="sc-time" onclick="pickTime(this)">14:30</button>
                        <button class="sc-time hot" onclick="pickTime(this)">18:00 <span class="hot-tag">Hot</span></button>
                        <button class="sc-time" onclick="pickTime(this)">21:30</button>
                    </div>
                </div>
            </div>
        </div>

    </div><!-- /sc-movie-list -->

    <!-- BOTTOM BAR -->
    <div class="sc-bottom-bar">
        <button class="btn-back" onclick="history.back()">← Quay lại</button>
        <button class="btn-next" onclick="location.href='${pageContext.request.contextPath}/user/chonghe.jsp'">
            Tiếp tục →
        </button>
    </div>

</div><!-- /sc-container -->

<%@ include file="../common/footer.jsp" %>

<script>
    function switchDate(el) {
        document.querySelectorAll('.date-tab').forEach(function(t){ t.classList.remove('active'); });
        el.classList.add('active');
    }
    function pickTime(btn) {
        document.querySelectorAll('.sc-time').forEach(function(b){ b.classList.remove('picked'); });
        btn.classList.add('picked');
    }
</script>

</body>
</html>
=======
<title>CINE+ | Chọn Suất Chiếu</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@300;400;500;600;700;800;900&display=swap">
<% @ include file="../common/header.jsp" %>
<style>
    /* preserve current app layout and styling */
    .page-title-bar { ... }
    .filter-card { ... }
    .movie-row { ... }
    .sticky-bar { ... }
</style>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
