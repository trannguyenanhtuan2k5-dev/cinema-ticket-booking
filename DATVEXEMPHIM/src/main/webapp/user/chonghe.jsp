<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn Ghế - CINE+</title>
    <!-- Use Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Be+Vietnam+Pro:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-red: #e50914;
            --neon-red: #ff1e2d;
            --bg-dark: #0a0a0a;
            --panel-bg: rgba(20, 20, 24, 0.85);
            --border-color: rgba(255, 255, 255, 0.1);
            --seat-normal: #e0e0e0;
            --seat-vip: transparent;
            --seat-vip-border: #e50914;
            --seat-selected: #e50914;
            --seat-sold: #333333;
            --text-main: #ffffff;
            --text-muted: #aaaaaa;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Roboto', 'Be Vietnam Pro', sans-serif;
            background-color: var(--bg-dark);
            background-image: 
                radial-gradient(circle at 15% 50%, rgba(229, 9, 20, 0.15) 0%, transparent 40%),
                radial-gradient(circle at 85% 50%, rgba(229, 9, 20, 0.15) 0%, transparent 40%),
                radial-gradient(circle at 50% 10%, rgba(229, 9, 20, 0.2) 0%, transparent 60%);
            color: var(--text-main);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Header */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
            background: rgba(10, 10, 10, 0.92);
            border-bottom: 1px solid var(--border-color);
            position: sticky;
            top: 0;
            z-index: 100;
            backdrop-filter: blur(10px);
        }

        .logo {
            font-size: 26px;
            font-weight: 900;
            color: var(--primary-red);
            display: flex;
            align-items: center;
            gap: 10px;
            letter-spacing: 1px;
            text-decoration: none;
        }

        .logo span {
            font-size: 10px;
            color: #888;
            font-weight: normal;
            display: block;
            margin-top: -5px;
            letter-spacing: 0;
        }

        .nav-links {
            display: flex;
            gap: 30px;
        }

        .nav-links a {
            color: var(--text-muted);
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover, .nav-links a.active {
            color: var(--text-main);
            text-shadow: 0 0 10px rgba(255,255,255,0.5);
        }
        
        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .search-bar {
            background: rgba(255, 255, 255, 0.08);
            border-radius: 20px;
            padding: 8px 15px;
            display: flex;
            align-items: center;
            gap: 10px;
            border: 1px solid rgba(255,255,255,0.05);
            transition: all 0.3s;
        }
        
        .search-bar:focus-within {
            background: rgba(255, 255, 255, 0.12);
            border-color: rgba(255,255,255,0.2);
        }

        .search-bar input {
            background: transparent;
            border: none;
            color: white;
            outline: none;
            font-size: 14px;
            width: 200px;
        }
        .search-bar input::placeholder {
            color: #777;
        }

        /* Main Layout */
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 30px 20px;
        }

        .page-title {
            text-align: center;
            font-size: 36px;
            font-weight: 900;
            font-style: italic;
            text-transform: uppercase;
            letter-spacing: 3px;
            margin: 0 0 40px;
            color: white;
            text-shadow: 0 0 15px rgba(229, 9, 20, 0.6);
        }

        .main-content {
            display: flex;
            gap: 30px;
            align-items: flex-start;
        }

        /* Left Panel - Movie Info */
        .info-panel {
            flex: 1;
            background: var(--panel-bg);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        .info-panel h3 {
            margin-top: 0;
            font-size: 16px;
            text-transform: uppercase;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 12px;
            margin-bottom: 20px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .movie-details {
            display: flex;
            gap: 20px;
        }

        .movie-poster {
            width: 100px;
            height: 150px;
            border-radius: 8px;
            object-fit: cover;
            box-shadow: 0 4px 15px rgba(0,0,0,0.6);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .movie-text {
            font-size: 14px;
            line-height: 1.8;
            color: var(--text-muted);
        }
        .movie-text strong {
            color: var(--text-main);
        }
        .movie-title {
            font-size: 17px;
            font-weight: bold;
            color: var(--text-main);
            display: block;
            margin-bottom: 10px;
            line-height: 1.3;
        }
        .movie-rating {
            display: inline-block;
            background: #f39c12;
            color: #000;
            font-size: 12px;
            font-weight: bold;
            padding: 2px 8px;
            border-radius: 4px;
            margin-top: 5px;
        }

        /* Center Panel - Seat Selection */
        .seat-panel {
            flex: 2.2;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.3s;
        }

        .seat-panel.shake-animation {
            animation: shakePanel 0.5s ease-in-out;
        }

        @keyframes shakePanel {
            0%, 100% { transform: translateX(0); }
            20%, 60% { transform: translateX(-8px); }
            40%, 80% { transform: translateX(8px); }
        }

        .screen-container {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 45px;
        }

        .screen {
            width: 90%;
            height: 55px;
            background: linear-gradient(to bottom, rgba(255,255,255,0.18) 0%, transparent 100%);
            border-top: 3px solid rgba(255,255,255,0.85);
            border-radius: 50% / 100% 100% 0 0;
            box-shadow: 0 -15px 30px rgba(255, 255, 255, 0.08);
            position: relative;
        }
        
        .screen-text {
            position: absolute;
            top: 18px;
            width: 100%;
            text-align: center;
            color: var(--text-muted);
            letter-spacing: 5px;
            font-size: 13px;
            font-weight: 600;
        }

        .seat-grid {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }

        .seat-row {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
        }

        .row-label {
            width: 25px;
            text-align: right;
            margin-right: 15px;
            font-weight: bold;
            color: var(--text-muted);
            font-size: 14px;
        }

        .seat {
            width: 28px;
            height: 28px;
            border-radius: 6px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 11px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            user-select: none;
            color: #111;
            position: relative;
        }

        .seat.normal {
            background: var(--seat-normal);
        }

        .seat.vip {
            background: var(--seat-vip);
            border: 1.5px solid var(--seat-vip-border);
            color: var(--seat-vip-border);
        }

        .seat.sold {
            background: var(--seat-sold);
            color: transparent;
            cursor: not-allowed;
            position: relative;
        }
        .seat.sold::after {
            content: '\f00d'; /* FontAwesome X */
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            font-size: 13px;
            color: #666;
        }

        .seat.selected {
            background: var(--seat-selected) !important;
            color: white !important;
            border: none !important;
            box-shadow: 0 0 14px var(--primary-red), 0 0 4px #fff;
            transform: scale(1.08);
        }

        .seat:not(.sold):hover {
            transform: scale(1.2);
            box-shadow: 0 0 12px rgba(255,255,255,0.4);
            z-index: 2;
        }
        
        .seat.vip:not(.sold):hover {
            background: rgba(229, 9, 20, 0.25);
            box-shadow: 0 0 12px rgba(229, 9, 20, 0.6);
        }

        /* Pulse animation when filtered via legend */
        @keyframes seatGlowPulse {
            0% { transform: scale(1); filter: brightness(1); }
            50% { transform: scale(1.22); filter: brightness(1.7); box-shadow: 0 0 14px rgba(255, 255, 255, 0.9); }
            100% { transform: scale(1); filter: brightness(1); }
        }

        .seat.highlight-pulse {
            animation: seatGlowPulse 0.9s ease-in-out infinite;
            z-index: 10;
        }

        /* Right Panel - Summary & Legend */
        .right-panels {
            flex: 1.1;
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .summary-panel, .legend-panel {
            background: var(--panel-bg);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 22px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            backdrop-filter: blur(10px);
        }

        .summary-panel-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 12px;
            margin-bottom: 16px;
        }

        .summary-panel-header h3 {
            margin: 0;
            font-size: 16px;
            text-transform: uppercase;
            font-weight: 700;
            letter-spacing: 1px;
            color: #ffffff;
        }

        .btn-clear-seats {
            background: transparent;
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #aaa;
            border-radius: 16px;
            padding: 3px 10px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: all 0.2s;
        }

        .btn-clear-seats:hover {
            color: #ff4d6d;
            border-color: #ff4d6d;
            background: rgba(229, 9, 20, 0.1);
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            font-size: 14px;
            color: var(--text-muted);
        }
        
        .summary-row strong {
            color: var(--text-main);
        }

        /* Dynamic Clickable Badges for Selected Seats */
        .selected-seats-container {
            display: flex;
            flex-wrap: wrap;
            gap: 7px;
            min-height: 34px;
            margin-bottom: 12px;
            padding: 8px 10px;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            border: 1px dashed rgba(255, 255, 255, 0.12);
        }

        .empty-seat-hint {
            font-size: 12px;
            font-style: italic;
            color: #777;
            align-self: center;
        }

        .seat-tag-btn {
            background: rgba(229, 9, 20, 0.25);
            border: 1px solid rgba(255, 42, 109, 0.6);
            color: #ffffff;
            border-radius: 14px;
            padding: 3px 9px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: all 0.2s;
            box-shadow: 0 0 8px rgba(229, 9, 20, 0.3);
        }

        .seat-tag-btn:hover {
            background: #e50914;
            border-color: #ff1e2d;
            transform: scale(1.06);
            box-shadow: 0 0 12px rgba(255, 30, 45, 0.6);
        }

        .seat-tag-btn i {
            font-size: 10px;
            opacity: 0.8;
        }

        .summary-breakdown {
            margin: 12px 0 6px;
            padding: 8px 0;
            border-top: 1px solid rgba(255, 255, 255, 0.08);
            font-size: 13px;
            line-height: 1.7;
        }

        .breakdown-row {
            display: flex;
            justify-content: space-between;
            color: #999;
        }

        .breakdown-row strong {
            color: #ddd;
        }

        .summary-total {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
            padding-top: 12px;
            border-top: 1px dashed rgba(255,255,255,0.2);
            font-size: 16px;
            font-weight: bold;
            color: var(--text-main);
        }
        
        .summary-total span:last-child {
            color: #ff3344;
            font-size: 20px;
            font-weight: 900;
            letter-spacing: 0.5px;
        }

        /* Interactive Legend Panel */
        .legend-panel h3 {
            margin-top: 0;
            font-size: 16px;
            text-transform: uppercase;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 12px;
            margin-bottom: 16px;
            font-weight: 700;
            letter-spacing: 1px;
            color: #ffffff;
        }

        .legend-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        /* Interactive Legend Button */
        .legend-btn {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 10px;
            padding: 10px 14px;
            cursor: pointer;
            transition: all 0.25s ease;
            text-align: left;
            color: inherit;
        }

        .legend-btn:hover {
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(255, 255, 255, 0.25);
            transform: translateX(4px);
        }

        .legend-btn.active {
            background: rgba(229, 9, 20, 0.15);
            border-color: var(--neon-red);
            box-shadow: 0 0 12px rgba(229, 9, 20, 0.35);
        }

        .legend-btn-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .legend-texts {
            display: flex;
            flex-direction: column;
        }

        .legend-name {
            font-size: 13px;
            font-weight: 600;
            color: #ffffff;
        }

        .legend-price {
            font-size: 11px;
            color: #f5c518;
            font-weight: 500;
            margin-top: 2px;
        }

        .legend-tag-hint {
            font-size: 10px;
            color: #888;
            background: rgba(255, 255, 255, 0.06);
            border-radius: 12px;
            padding: 3px 8px;
            white-space: nowrap;
            transition: all 0.2s;
        }

        .legend-btn:hover .legend-tag-hint {
            color: #fff;
            background: rgba(255, 255, 255, 0.15);
        }

        .legend-btn.active .legend-tag-hint {
            color: #ff3344;
            background: rgba(229, 9, 20, 0.2);
            font-weight: bold;
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 45px;
            padding: 0 10px;
        }

        .btn {
            padding: 12px 35px;
            border-radius: 30px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            border: 1px solid rgba(255,255,255,0.3);
            background: rgba(255,255,255,0.05);
            color: white;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }

        .btn:hover {
            background: rgba(255,255,255,0.15);
            border-color: rgba(255,255,255,0.6);
            transform: translateX(-3px);
        }

        .btn-primary {
            background: linear-gradient(135deg, #e50914 0%, #ff1e56 100%);
            border: 1px solid #ff4d6d;
            box-shadow: 0 0 18px rgba(229, 9, 20, 0.6);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #ff1e2d 0%, #ff2a75 100%);
            box-shadow: 0 0 26px rgba(255, 30, 45, 0.85);
            border-color: #ff6584;
            transform: scale(1.04);
        }

        /* Toast Notification */
        .seat-toast {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: rgba(22, 22, 26, 0.95);
            border-left: 4px solid var(--primary-red);
            border-radius: 8px;
            padding: 14px 20px;
            color: #fff;
            box-shadow: 0 10px 30px rgba(0,0,0,0.8), 0 0 15px rgba(229, 9, 20, 0.3);
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 13px;
            z-index: 10000;
            transform: translateY(100px);
            opacity: 0;
            transition: all 0.3s cubic-bezier(0.18, 0.89, 0.32, 1.28);
            pointer-events: none;
        }

        .seat-toast.show {
            transform: translateY(0);
            opacity: 1;
            pointer-events: auto;
        }

        @media (max-width: 1100px) {
            .main-content {
                flex-direction: column;
            }
            .seat-panel {
                width: 100%;
                overflow-x: auto;
            }
            .right-panels {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <a href="<%= request.getContextPath() %>/user/trangchu.jsp" class="logo">
            <i class="fa-solid fa-film"></i> 
            <div>CINE+<br><span>More Movies, More Feelings</span></div>
        </a>
        <div class="nav-links">
            <a href="<%= request.getContextPath() %>/user/trangchu.jsp">Trang chủ</a>
            <a href="#">Phim</a>
            <a href="<%= request.getContextPath() %>/user/chonsuatchieu.jsp" class="active">Lịch chiếu</a>
            <a href="#">Rạp</a>
            <a href="#">Ưu đãi</a>
        </div>
        <div class="header-right">
            <div class="search-bar">
                <input type="text" placeholder="Tìm kiếm phim, diễn viên...">
                <i class="fa-solid fa-magnifying-glass" style="color: #888;"></i>
            </div>
            <i class="fa-regular fa-user" style="font-size: 20px; cursor: pointer;"></i>
            <i class="fa-solid fa-bars" style="font-size: 20px; cursor: pointer;"></i>
        </div>
    </header>

    <div class="container">
        <h1 class="page-title">Chọn Ghế</h1>

        <div class="main-content">
            <!-- Left Panel -->
            <div class="info-panel">
                <h3>Thông tin suất chiếu</h3>
                <div class="movie-details">
                    <img src="https://image.tmdb.org/t/p/w200/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg" 
                         alt="Thanh Gươm Diệt Quỷ" 
                         class="movie-poster"
                         onerror="this.src='https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=200&fit=crop';">
                    <div class="movie-text">
                        <span class="movie-title">Thanh Gươm Diệt Quỷ</span>
                        Rạp: <strong>CGV Vincom - Phòng 1</strong><br>
                        Suất chiếu: <strong>13:30 - Thứ Hai 14/10</strong><br>
                        Định dạng: <strong>2D</strong><br>
                        <span class="movie-rating">T13</span>
                    </div>
                </div>
            </div>

            <!-- Center Panel -->
            <div class="seat-panel" id="seatPanel">
                <div class="screen-container">
                    <div class="screen">
                        <div class="screen-text">MÀN HÌNH</div>
                    </div>
                </div>

                <div class="seat-grid">
                    <% 
                        String[] rows = {"A", "B", "C", "D", "E", "F", "G", "I", "J", "K", "L"};
                        for (String row : rows) {
                    %>
                    <div class="seat-row">
                        <div class="row-label"><%= row %></div>
                        <% 
                            for (int col = 1; col <= 20; col++) {
                                boolean isVip = (col >= 6 && col <= 15 && row.compareTo("C") >= 0 && row.compareTo("I") <= 0);
                                boolean isSelected = (row.equals("F") && (col == 11 || col == 12));
                                boolean isSold = (row.equals("B") && (col <= 3 || col >= 16) ||
                                                  row.equals("D") && (col >= 17) ||
                                                  row.equals("G") && (col == 18 || col == 19) ||
                                                  row.equals("J") && (col == 17 || col == 18));
                                
                                String seatCode = row + col;
                                String type = isVip ? "vip" : "normal";
                                String text = isVip ? "VIP" : String.valueOf(col);
                                int price = isVip ? 120000 : 90000;
                                
                                String classList = "seat";
                                if (isSold) {
                                    classList += " sold";
                                    text = "";
                                } else if (isVip) {
                                    classList += " vip";
                                } else {
                                    classList += " normal";
                                }
                                
                                if (isSelected && !isSold) {
                                    classList += " selected";
                                }
                        %>
                            <div class="<%= classList %>"
                                 data-seat="<%= seatCode %>"
                                 data-type="<%= type %>"
                                 data-price="<%= price %>"
                                 title="<%= seatCode %> - <%= isVip ? "VIP (120.000đ)" : "Thường (90.000đ)" %>"><%= text %></div>
                        <% } %>
                    </div>
                    <% } %>
                </div>
            </div>

            <!-- Right Panel -->
            <div class="right-panels">
                <!-- Tóm Tắt Đơn Hàng -->
                <div class="summary-panel">
                    <div class="summary-panel-header">
                        <h3>Tóm tắt đơn hàng</h3>
                        <button type="button" class="btn-clear-seats" id="btnClearSeats" onclick="clearAllSeats()">
                            <i class="fa-solid fa-trash-can"></i> Bỏ chọn
                        </button>
                    </div>

                    <div class="summary-row">
                        <span>Ghế đang chọn:</span>
                        <strong id="seat-count">2 ghế</strong>
                    </div>

                    <!-- Dynamic Clickable Seat Tags -->
                    <div class="selected-seats-container" id="selectedSeatsBadges">
                        <!-- Populated by JavaScript -->
                    </div>

                    <!-- Price Breakdown by Seat Category -->
                    <div class="summary-breakdown" id="summaryBreakdown">
                        <div class="breakdown-row" id="rowBreakdownVip">
                            <span>Ghế VIP (<span id="countVip">2</span> × 120k):</span>
                            <strong id="priceVip">240.000đ</strong>
                        </div>
                        <div class="breakdown-row" id="rowBreakdownNormal">
                            <span>Ghế Thường (<span id="countNormal">0</span> × 90k):</span>
                            <strong id="priceNormal">0đ</strong>
                        </div>
                    </div>

                    <div class="summary-total">
                        <span>Tạm tính</span>
                        <span id="total-price">240.000đ</span>
                    </div>
                </div>

                <!-- Chú Thích (Dynamic Interactive Filter Buttons) -->
                <div class="legend-panel">
                    <h3>Chú thích</h3>
                    <div class="legend-list">
                        <!-- Ghế Thường Button -->
                        <button type="button" class="legend-btn" id="legendBtnNormal" onclick="toggleLegendHighlight('normal', this)">
                            <div class="legend-btn-left">
                                <div class="seat normal" style="margin:0; pointer-events: none;"></div>
                                <div class="legend-texts">
                                    <span class="legend-name">Ghế Thường</span>
                                    <span class="legend-price">90.000đ</span>
                                </div>
                            </div>
                            <span class="legend-tag-hint">Bấm xem vị trí</span>
                        </button>

                        <!-- Ghế VIP Button -->
                        <button type="button" class="legend-btn" id="legendBtnVip" onclick="toggleLegendHighlight('vip', this)">
                            <div class="legend-btn-left">
                                <div class="seat vip" style="margin:0; width: 34px; pointer-events: none;">VIP</div>
                                <div class="legend-texts">
                                    <span class="legend-name">Ghế VIP</span>
                                    <span class="legend-price">120.000đ</span>
                                </div>
                            </div>
                            <span class="legend-tag-hint">Bấm xem vị trí</span>
                        </button>

                        <!-- Đang Chọn Button -->
                        <button type="button" class="legend-btn" id="legendBtnSelected" onclick="toggleLegendHighlight('selected', this)">
                            <div class="legend-btn-left">
                                <div class="seat selected" style="margin:0; pointer-events: none;"></div>
                                <div class="legend-texts">
                                    <span class="legend-name">Đang chọn</span>
                                    <span class="legend-price" id="legendSelectedCounter">2 ghế</span>
                                </div>
                            </div>
                            <span class="legend-tag-hint">Làm nổi bật</span>
                        </button>

                        <!-- Đã Bán Button -->
                        <button type="button" class="legend-btn" id="legendBtnSold" onclick="toggleLegendHighlight('sold', this)">
                            <div class="legend-btn-left">
                                <div class="seat sold" style="margin:0; pointer-events: none;"></div>
                                <div class="legend-texts">
                                    <span class="legend-name">Đã bán</span>
                                    <span class="legend-price" style="color: #888;">Không thể chọn</span>
                                </div>
                            </div>
                            <span class="legend-tag-hint">Bấm xem vị trí</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="action-buttons">
            <button type="button" class="btn" onclick="window.location.href='<%= request.getContextPath() %>/user/chonsuatchieu.jsp'">
                <i class="fa-solid fa-arrow-left"></i> Quay lại
            </button>
            <button type="button" class="btn btn-primary" id="btnContinue" onclick="proceedToPayment()">
                Tiếp tục <i class="fa-solid fa-arrow-right"></i>
            </button>
        </div>
    </div>

    <!-- Toast Notification -->
    <div class="seat-toast" id="seatToast">
        <i class="fa-solid fa-circle-info" id="toastIcon" style="color: #ff3344; font-size: 16px;"></i>
        <span id="toastText">Thông báo</span>
    </div>

    <script>
        // Data State
        let selectedSeats = [];
        let activeHighlight = null;

        // Pricing
        const PRICE_NORMAL = 90000;
        const PRICE_VIP = 120000;

        function formatVND(amount) {
            return new Intl.NumberFormat('vi-VN').format(amount) + 'đ';
        }

        document.addEventListener('DOMContentLoaded', () => {
            // Find pre-selected seats (e.g. F11, F12)
            document.querySelectorAll('.seat.selected').forEach(el => {
                const code = el.getAttribute('data-seat');
                const type = el.getAttribute('data-type') || 'normal';
                const price = parseInt(el.getAttribute('data-price') || (type === 'vip' ? PRICE_VIP : PRICE_NORMAL), 10);
                if (code) {
                    selectedSeats.push({ code, type, price, el });
                }
            });

            updateSummary();

            // Attach click listeners to all seats
            const allSeats = document.querySelectorAll('.seat:not(.legend-btn .seat)');
            allSeats.forEach(seat => {
                seat.addEventListener('click', function(e) {
                    e.stopPropagation();

                    // Check if seat is sold
                    if (this.classList.contains('sold')) {
                        showToast('Ghế này đã có người đặt mua! Vui lòng chọn ghế khác.', 'warning');
                        return;
                    }

                    const code = this.getAttribute('data-seat');
                    const type = this.getAttribute('data-type') || 'normal';
                    const price = parseInt(this.getAttribute('data-price') || (type === 'vip' ? PRICE_VIP : PRICE_NORMAL), 10);

                    const existingIndex = selectedSeats.findIndex(s => s.code === code);

                    if (existingIndex > -1) {
                        // Deselect
                        selectedSeats.splice(existingIndex, 1);
                        this.classList.remove('selected');
                        showToast('Đã bỏ chọn ghế ' + code);
                    } else {
                        // Select
                        selectedSeats.push({ code, type, price, el: this });
                        this.classList.add('selected');
                        showToast('Đã chọn ghế ' + code + ' (' + (type === 'vip' ? 'VIP' : 'Thường') + ')');
                    }

                    // Remove pulse highlight if active
                    if (activeHighlight) {
                        clearHighlights();
                    }

                    updateSummary();
                });
            });
        });

        // Update the Order Summary Panel in real time
        function updateSummary() {
            const container = document.getElementById('selectedSeatsBadges');
            const seatCountEl = document.getElementById('seat-count');
            const totalPriceEl = document.getElementById('total-price');
            const btnClear = document.getElementById('btnClearSeats');
            const legendCountEl = document.getElementById('legendSelectedCounter');

            container.innerHTML = '';

            if (selectedSeats.length === 0) {
                container.innerHTML = '<span class="empty-seat-hint">Chưa chọn ghế nào. Vui lòng bấm vào sơ đồ.</span>';
                seatCountEl.textContent = '0 ghế';
                totalPriceEl.textContent = '0đ';
                btnClear.style.display = 'none';
                legendCountEl.textContent = '0 ghế';

                document.getElementById('countVip').textContent = '0';
                document.getElementById('priceVip').textContent = '0đ';
                document.getElementById('countNormal').textContent = '0';
                document.getElementById('priceNormal').textContent = '0đ';
                return;
            }

            btnClear.style.display = 'inline-flex';
            seatCountEl.textContent = selectedSeats.length + ' ghế';
            legendCountEl.textContent = selectedSeats.length + ' ghế';

            // Sort seats alphabetically (e.g. F11, F12)
            selectedSeats.sort((a, b) => a.code.localeCompare(b.code, undefined, { numeric: true, sensitivity: 'base' }));

            let total = 0;
            let vipCount = 0;
            let normalCount = 0;

            selectedSeats.forEach(seat => {
                total += seat.price;
                if (seat.type === 'vip') vipCount++;
                else normalCount++;

                // Create clickable dynamic tag button
                const tag = document.createElement('button');
                tag.type = 'button';
                tag.className = 'seat-tag-btn';
                tag.title = 'Bấm để bỏ chọn ghế ' + seat.code;
                tag.innerHTML = seat.code + ' <i class="fa-solid fa-xmark"></i>';
                tag.onclick = function(e) {
                    e.stopPropagation();
                    deselectSeat(seat.code);
                };
                container.appendChild(tag);
            });

            // Update Breakdown
            document.getElementById('countVip').textContent = vipCount;
            document.getElementById('priceVip').textContent = formatVND(vipCount * PRICE_VIP);
            document.getElementById('countNormal').textContent = normalCount;
            document.getElementById('priceNormal').textContent = formatVND(normalCount * PRICE_NORMAL);

            // Update Total
            totalPriceEl.textContent = formatVND(total);
        }

        // Deselect a seat by code (via clicking tag button)
        function deselectSeat(code) {
            const index = selectedSeats.findIndex(s => s.code === code);
            if (index > -1) {
                const seatObj = selectedSeats[index];
                if (seatObj.el) {
                    seatObj.el.classList.remove('selected');
                }
                selectedSeats.splice(index, 1);
                showToast('Đã bỏ chọn ghế ' + code);
                updateSummary();
            }
        }

        // Clear all selected seats
        function clearAllSeats() {
            selectedSeats.forEach(s => {
                if (s.el) s.el.classList.remove('selected');
            });
            selectedSeats = [];
            showToast('Đã xóa tất cả ghế đang chọn');
            updateSummary();
        }

        // Interactive Legend: Toggle highlight on seat grid
        function toggleLegendHighlight(type, btnElement) {
            const isCurrentlyActive = btnElement.classList.contains('active');

            // Reset all legend buttons
            document.querySelectorAll('.legend-btn').forEach(b => b.classList.remove('active'));
            clearHighlights();

            if (isCurrentlyActive) {
                activeHighlight = null;
                showToast('Đã tắt chế độ làm nổi bật');
                return;
            }

            btnElement.classList.add('active');
            activeHighlight = type;

            let selector = '';
            let label = '';
            if (type === 'normal') {
                selector = '.seat.normal:not(.sold)';
                label = 'ghế Thường';
            } else if (type === 'vip') {
                selector = '.seat.vip:not(.sold)';
                label = 'ghế VIP';
            } else if (type === 'selected') {
                selector = '.seat.selected';
                label = 'ghế Đang chọn';
            } else if (type === 'sold') {
                selector = '.seat.sold';
                label = 'ghế Đã bán';
            }

            const targets = document.querySelectorAll(selector);
            targets.forEach(seat => seat.classList.add('highlight-pulse'));

            showToast('Đang làm nổi bật ' + targets.length + ' ' + label + ' trên sơ đồ');
        }

        function clearHighlights() {
            document.querySelectorAll('.seat.highlight-pulse').forEach(s => {
                s.classList.remove('highlight-pulse');
            });
        }

        // Proceed to payment page
        function proceedToPayment() {
            if (selectedSeats.length === 0) {
                showToast('⚠️ Vui lòng chọn ít nhất 1 ghế trước khi tiếp tục!', 'warning');
                
                // Shake seat panel to direct user focus
                const panel = document.getElementById('seatPanel');
                panel.classList.add('shake-animation');
                setTimeout(() => panel.classList.remove('shake-animation'), 600);
                return;
            }

            // Build dynamic data
            const seatCodes = selectedSeats.map(s => s.code).join(', ');
            const seatCountStr = selectedSeats.length + ' ghế';
            let totalPrice = 0;
            selectedSeats.forEach(s => totalPrice += s.price);
            const totalStr = formatVND(totalPrice);

            // Store in sessionStorage as backup
            sessionStorage.setItem('booking_seats', seatCodes);
            sessionStorage.setItem('booking_count', seatCountStr);
            sessionStorage.setItem('booking_total', totalStr);

            // Navigate to thanhtoan.jsp with query parameters
            const url = '<%= request.getContextPath() %>/user/thanhtoan.jsp?' + 
                        'seats=' + encodeURIComponent(seatCodes) + 
                        '&count=' + encodeURIComponent(seatCountStr) + 
                        '&total=' + encodeURIComponent(totalStr);

            window.location.href = url;
        }

        // Toast feedback notification
        let toastTimeout;
        function showToast(message, type = 'info') {
            const toast = document.getElementById('seatToast');
            const textEl = document.getElementById('toastText');
            const iconEl = document.getElementById('toastIcon');

            textEl.textContent = message;

            if (type === 'warning') {
                iconEl.className = 'fa-solid fa-triangle-exclamation';
                iconEl.style.color = '#f39c12';
                toast.style.borderLeftColor = '#f39c12';
            } else {
                iconEl.className = 'fa-solid fa-circle-check';
                iconEl.style.color = '#2ecc71';
                toast.style.borderLeftColor = '#e50914';
            }

            toast.classList.add('show');
            clearTimeout(toastTimeout);
            toastTimeout = setTimeout(() => {
                toast.classList.remove('show');
            }, 2500);
        }
    </script>
</body>
</html>
