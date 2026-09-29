<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%  request.setAttribute("currentPage", "trangchu"); %>
=======
<%
    request.setAttribute("currentPage", "trangchu");
%>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<<<<<<< HEAD
    <title>CINE+ | Đặt Vé Xem Phim</title>
    <%@ include file="../common/header.jsp" %>
</head>
<body>

<!-- ══════════ HERO ══════════ -->
<section class="hero">

    <!-- Slide 1 -->
    <div class="hero-slide active" id="slide-0">
        <div class="hero-bg"></div>
        <!-- Poster side -->
        <div class="hero-poster-side" style="background:linear-gradient(100deg,transparent 40%,#1a0505 40%,#2d0808 60%,#1a0a0a 100%);">
            <img src="https://image.tmdb.org/t/p/w500/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg"
                 onerror="this.style.display='none'"
                 alt="Thanh Gươm Diệt Quỷ" class="hero-poster-img">
            <div class="hero-poster-blur"></div>
            <div class="hero-genre-tags">
                <span>ACTION</span>
                <span>THRILLER</span>
                <span>DRAMA</span>
            </div>
        </div>
        <div class="hero-content">
            <div class="hero-eyebrow">Phim đang chiếu 2026</div>
            <div class="hero-title">ĐẶT VÉ<br><span class="highlight">XEM</span><br>PHIM</div>
            <div class="hero-subtitle">Nhanh chóng · Dễ dàng · Tiện lợi</div>
            <div class="hero-features">
                <div class="hero-feature">
                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <rect x="2" y="3" width="20" height="14" rx="2"/><path d="M8 21h8M12 17v4"/>
                    </svg>
                    <span>Chọn phim yêu thích</span>
                </div>
                <div class="hero-feature">
                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <rect x="3" y="4" width="18" height="18" rx="2"/>
                        <line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/>
                        <line x1="3" y1="10" x2="21" y2="10"/>
                    </svg>
                    <span>Chọn suất chiếu linh hoạt</span>
                </div>
                <div class="hero-feature">
                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                    </svg>
                    <span>Thanh toán an toàn</span>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="btn-hero">
                🎟️ Mua vé ngay →
            </a>
        </div>
    </div>

    <!-- Slide 2 -->
    <div class="hero-slide" id="slide-1">
        <div class="hero-bg"></div>
        <div class="hero-poster-side" style="background:linear-gradient(100deg,transparent 40%,#0a0a1a 40%,#0d1a3d 60%,#0a0a1a 100%);">
            <img src="https://image.tmdb.org/t/p/w500/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg"
                 onerror="this.style.display='none'"
                 alt="Inside Out 2" class="hero-poster-img">
            <div class="hero-poster-blur"></div>
            <div class="hero-genre-tags">
                <span>FAMILY</span>
                <span>COMEDY</span>
                <span>ANIMATION</span>
            </div>
        </div>
        <div class="hero-content">
            <div class="hero-eyebrow">Phim mới ra mắt</div>
            <div class="hero-title" style="font-size:56px;">PHIM HAY<br>TUẦN NÀY</div>
            <div class="hero-subtitle">Trải nghiệm rạp chiếu cực đỉnh</div>
            <a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="btn-hero">
                📅 Xem lịch chiếu →
            </a>
        </div>
    </div>

    <!-- Dots -->
=======
    <title>CINE+ | Trang Chủ</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@300;400;500;600;700;800;900&display=swap">
    <%@ include file="../common/header.jsp" %>
</head>
<body>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
    <div class="hero-dots">
        <button class="hero-dot active" onclick="goSlide(0)"></button>
        <button class="hero-dot" onclick="goSlide(1)"></button>
    </div>
</section>

<<<<<<< HEAD
<div class="glow-divider"></div>

<!-- ══════════ DANH SÁCH PHIM ══════════ -->
=======
<div class="glow-div"></div>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
<section class="section">
    <div class="section-header">
        <div class="section-title">
            <div class="section-title-icon">
                <svg width="16" height="16" fill="none" stroke="white" stroke-width="2.5" viewBox="0 0 24 24">
                    <rect x="2" y="2" width="20" height="20" rx="3"/>
                    <path d="M7 2v20M17 2v20M2 12h20M2 7h5M17 7h5M2 17h5M17 17h5"/>
                </svg>
            </div>
            Danh Sách Phim
        </div>
        <a href="#" class="section-link">Xem tất cả →</a>
    </div>
<<<<<<< HEAD

    <div class="movie-grid">

        <!-- Phim 1: Thanh Gươm Diệt Quỷ -->
        <div class="movie-card">
            <div class="movie-thumb">
                <img src="https://image.tmdb.org/t/p/w342/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg"
                     alt="Thanh Gươm Diệt Quỷ"
                     onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
                <div class="mthumb-inner" style="background:linear-gradient(145deg,#1a1a2e,#16213e,#0f3460);display:none;">🗡️</div>
                <div class="movie-badge">Hành động</div>
                <div class="movie-rating">⭐ 9.7</div>
                <div class="movie-duration">118 phút</div>
                <div class="movie-overlay">
                    <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/>
                        <polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
=======
                </svg>
            </div>
            Danh Sách Phim
        </div>
<div class="movie-grid">
    <div class="movie-card">
        <div class="movie-thumb">
            <div class="mthumb-inner" style="background:linear-gradient(160deg,#0f1623,#1a2a4a,#0a0e1a);">🗡️</div>
            <div class="movie-badge">Hành động</div>
            <div class="movie-rating">⭐ 8.7</div>
            <div class="movie-duration">118 phút</div>
            <div class="movie-overlay">
                <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                    <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
                </svg>
            </div>
        </div>
    </div>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
                    </svg>
                </div>
            </div>
            <div class="movie-info">
                <div class="movie-name">Thanh Gươm Diệt Quỷ</div>
                <div class="movie-meta">Hành động · Phiêu lưu</div>
                <button class="btn-book" onclick="location.href='${pageContext.request.contextPath}/user/chonsuatchieu.jsp'">Đặt vé</button>
            </div>
        </div>

        <!-- Phim 2: Nhiệm Vụ Bất Khả Thi -->
        <div class="movie-card">
            <div class="movie-thumb">
<<<<<<< HEAD
                <img src="https://image.tmdb.org/t/p/w342/NNxYkU70HPurnNCSiCjYAmacwm.jpg"
                     alt="Nhiệm Vụ Bất Khả Thi"
                     onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
                <div class="mthumb-inner" style="background:linear-gradient(145deg,#0d2137,#1a3a5c,#0d2137);display:none;">🕵️</div>
                <div class="movie-badge">Gián điệp</div>
                <div class="movie-rating">⭐ 8.5</div>
                <div class="movie-duration">163 phút</div>
                <div class="movie-overlay">
                    <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/>
                        <polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
=======
<div class="movie-card">
        <div class="movie-thumb">
            <div class="mthumb-inner" style="background:linear-gradient(160deg,#0d1e30,#1a3552,#0d1825);">🕵️</div>
            <div class="movie-badge">Trinh thám</div>
            <div class="movie-rating">⭐ 8.5</div>
            <div class="movie-duration">135 phút</div>
            <div class="movie-overlay">
                <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                    <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
                </svg>
            </div>
        </div>
    </div>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
                    </svg>
                </div>
            </div>
            <div class="movie-info">
                <div class="movie-name">Nhiệm Vụ Bất Khả Thi</div>
                <div class="movie-meta">Hành động · Gián điệp</div>
                <button class="btn-book" onclick="location.href='${pageContext.request.contextPath}/user/chonsuatchieu.jsp'">Đặt vé</button>
            </div>
        </div>

        <!-- Phim 3: Yêu Lại Từ Đầu -->
        <div class="movie-card">
            <div class="movie-thumb">
<<<<<<< HEAD
                <img src="https://image.tmdb.org/t/p/w342/qhb1qOilapbapxWQn9jtRCMwXJF.jpg"
                     alt="Yêu Lại Từ Đầu"
                     onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
                <div class="mthumb-inner" style="background:linear-gradient(145deg,#1a0a1a,#3d1a3d,#1a0a1a);display:none;">💕</div>
                <div class="movie-badge">Tình cảm</div>
                <div class="movie-rating">⭐ 8.2</div>
                <div class="movie-duration">112 phút</div>
                <div class="movie-overlay">
                    <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/>
                        <polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
=======
<div class="movie-card">
        <div class="movie-thumb">
            <div class="mthumb-inner" style="background:linear-gradient(160deg,#1e0a22,#3d1a45,#1a0a20);">💕</div>
            <div class="movie-badge">Tình cảm</div>
            <div class="movie-rating">⭐ 8.2</div>
            <div class="movie-duration">112 phút</div>
            <div class="movie-overlay">
                <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                    <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
                </svg>
            </div>
        </div>
    </div>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
                    </svg>
                </div>
            </div>
            <div class="movie-info">
                <div class="movie-name">Yêu Lại Từ Đầu</div>
                <div class="movie-meta">Tình cảm · Hài hước</div>
                <button class="btn-book" onclick="location.href='${pageContext.request.contextPath}/user/chonsuatchieu.jsp'">Đặt vé</button>
            </div>
        </div>

        <!-- Phim 4: Inside Out 2 -->
        <div class="movie-card">
            <div class="movie-thumb">
<<<<<<< HEAD
                <img src="https://image.tmdb.org/t/p/w342/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg"
                     alt="Inside Out 2"
                     onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
                <div class="mthumb-inner" style="background:linear-gradient(145deg,#0a1a0a,#1a3d1a,#0a1a0a);display:none;">😊</div>
                <div class="movie-badge">Hoạt hình</div>
                <div class="movie-rating">⭐ 8.9</div>
                <div class="movie-duration">100 phút</div>
                <div class="movie-overlay">
                    <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                        <circle cx="12" cy="12" r="10"/>
                        <polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
=======
<div class="movie-card">
        <div class="movie-thumb">
            <div class="mthumb-inner" style="background:linear-gradient(160deg,#0a1e10,#1a4228,#0a1a10);">😊</div>
            <div class="movie-badge">Hoạt hình</div>
            <div class="movie-rating">⭐ 8.9</div>
            <div class="movie-duration">100 phút</div>
            <div class="movie-overlay">
                <svg width="40" height="40" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
                    <circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8" fill="white" stroke="none"/>
                </svg>
            </div>
        </div>
    </div>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
                    </svg>
                </div>
            </div>
            <div class="movie-info">
                <div class="movie-name">Inside Out 2</div>
                <div class="movie-meta">Hoạt hình · Gia đình</div>
                <button class="btn-book" onclick="location.href='${pageContext.request.contextPath}/user/chonsuatchieu.jsp'">Đặt vé</button>
            </div>
        </div>

        <!-- Promo Card -->
        <div class="promo-card">
            <div>
<<<<<<< HEAD
                <div class="promo-icon">🍿</div>
                <div class="promo-title">Ưu Đãi<br>Đặc Biệt</div>
                <div class="promo-desc">Giảm giá đến <strong style="color:var(--red)">50%</strong> cho thành viên mới đăng ký hôm nay!</div>
            </div>
            <button class="btn-promo">Khám phá →</button>
        </div>

=======
<div class="promo-card">
    <div>
        <div class="promo-icon">🍿</div>
        <div class="promo-title">Ưu Đãi<br>Đặc Biệt</div>
        <div class="promo-desc">Giảm giá đến <strong style="color:var(--red)">50%</strong> cho thành viên mới đăng ký hôm nay!</div>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
    </div>
    <button class="btn-promo">Khám phá →</button>
</div>
</div>
</section>
<<<<<<< HEAD

<!-- ══════════ 4 BƯỚC ĐẶT VÉ ══════════ -->
<div class="steps-section">
    <div class="steps-grid">

        <!-- Chọn Phim -->
        <a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="step-card">
            <div class="step-icon">
                <svg width="30" height="30" fill="none" stroke="var(--red)" stroke-width="1.8" viewBox="0 0 24 24">
                    <rect x="2" y="2" width="20" height="20" rx="3"/>
                    <path d="M7 2v20M17 2v20M2 12h20M2 7h5M17 7h5M2 17h5M17 17h5"/>
                </svg>
            </div>
            <div class="step-title">Chọn Phim</div>
            <div class="step-sub">Duyệt hàng trăm phim đang chiếu và sắp chiếu</div>
        </a>

        <!-- Chọn Suất Chiếu -->
        <a href="${pageContext.request.contextPath}/user/chonsuatchieu.jsp" class="step-card">
            <div class="step-icon">
                <svg width="30" height="30" fill="none" stroke="var(--red)" stroke-width="1.8" viewBox="0 0 24 24">
                    <rect x="3" y="4" width="18" height="18" rx="2"/>
                    <path d="M16 2v4M8 2v4M3 10h18"/>
                    <rect x="7" y="14" width="2" height="2" rx=".5" fill="var(--red)"/>
                    <rect x="11" y="14" width="2" height="2" rx=".5" fill="var(--red)"/>
                    <rect x="15" y="14" width="2" height="2" rx=".5" fill="var(--red)"/>
                </svg>
            </div>
            <div class="step-title">Chọn Suất Chiếu</div>
            <div class="step-sub">Lịch chiếu linh hoạt nhiều rạp, nhiều định dạng</div>
        </a>

        <!-- Chọn Ghế -->
        <a href="${pageContext.request.contextPath}/user/chonghe.jsp" class="step-card">
            <div class="step-icon">
                <svg width="30" height="30" fill="none" stroke="var(--red)" stroke-width="1.8" viewBox="0 0 24 24">
                    <path d="M6 2v8M18 2v8"/>
                    <path d="M4 10c0-1.1.9-2 2-2h12a2 2 0 0 1 2 2v4H4v-4z"/>
                    <path d="M4 14v3a1 1 0 0 0 1 1h1M20 14v3a1 1 0 0 1-1 1h-1"/>
                    <path d="M7 18h10"/>
                    <path d="M9 18v3M15 18v3"/>
                </svg>
            </div>
            <div class="step-title">Chọn Ghế</div>
            <div class="step-sub">Xem sơ đồ ghế trực quan, chọn vị trí yêu thích</div>
        </a>

        <!-- Thanh Toán -->
        <a href="${pageContext.request.contextPath}/user/thanhtoan.jsp" class="step-card">
            <div class="step-icon">
                <svg width="30" height="30" fill="none" stroke="var(--red)" stroke-width="1.8" viewBox="0 0 24 24">
                    <rect x="2" y="5" width="20" height="14" rx="2"/>
                    <path d="M2 10h20"/>
                    <path d="M6 15h4M15 15h3"/>
                </svg>
            </div>
            <div class="step-title">Thanh Toán</div>
            <div class="step-sub">Nhanh qua thẻ, ví điện tử. Nhận vé ngay lập tức</div>
        </a>

    </div>
</div>

<%@ include file="../common/footer.jsp" %>

<script>
    var slides = document.querySelectorAll('.hero-slide');
    var dots   = document.querySelectorAll('.hero-dot');
    function goSlide(i) {
        slides.forEach(function(s,j){
            s.style.display = j===i ? 'flex' : 'none';
            s.style.opacity = j===i ? '1' : '0';
        });
        dots.forEach(function(d,j){ d.classList.toggle('active', j===i); });
    }
    var current = 0;
    setInterval(function(){
        current = (current + 1) % slides.length;
        goSlide(current);
    }, 5000);
</script>

=======
<div class="glow-divider"></div>
>>>>>>> 9378cfb910b6f7409d5e26cb8ccecc69f4260abc
</body>
</html>
