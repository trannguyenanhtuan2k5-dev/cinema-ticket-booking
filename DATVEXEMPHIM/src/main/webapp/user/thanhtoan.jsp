<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh Toán - CINE+</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,700;1,900&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary-red: #e50914;
            --neon-red: #ff1e2d;
            --pink-accent: #ff2a6d;
            --bg-dark: #0a0a0a;
            --card-bg: rgba(22, 22, 24, 0.85);
            --card-border: rgba(255, 255, 255, 0.1);
            --card-active-border: #ff1e2d;
            --input-bg: rgba(14, 14, 16, 0.9);
            --text-white: #ffffff;
            --text-gray: #a0a0a0;
            --text-muted: #666666;
            --gold: #f5c518;
            --glow: 0 0 15px rgba(229, 9, 20, 0.6);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', 'Be Vietnam Pro', sans-serif;
            background-color: var(--bg-dark);
            color: var(--text-white);
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
            background-image: 
                radial-gradient(circle at 10% 25%, rgba(229, 9, 20, 0.16) 0%, transparent 45%),
                radial-gradient(circle at 90% 30%, rgba(229, 9, 20, 0.16) 0%, transparent 45%),
                radial-gradient(circle at 50% 0%, rgba(229, 9, 20, 0.22) 0%, transparent 55%),
                radial-gradient(circle at 50% 100%, rgba(229, 9, 20, 0.14) 0%, transparent 60%);
            background-attachment: fixed;
        }

        /* Ambient glowing flares */
        .ambient-flare-top {
            position: absolute;
            top: 60px;
            left: 0;
            right: 0;
            height: 2px;
            background: linear-gradient(90deg, transparent 0%, rgba(229, 9, 20, 0.1) 15%, rgba(255, 42, 109, 0.9) 50%, rgba(229, 9, 20, 0.1) 85%, transparent 100%);
            box-shadow: 0 0 20px 3px rgba(255, 30, 45, 0.8), 0 0 45px 8px rgba(229, 9, 20, 0.4);
            z-index: 10;
            pointer-events: none;
        }

        .ambient-flare-top::after {
            content: '';
            position: absolute;
            top: -25px;
            left: 50%;
            transform: translateX(-50%);
            width: 280px;
            height: 50px;
            background: radial-gradient(ellipse at center, rgba(255, 50, 70, 0.45) 0%, transparent 70%);
            pointer-events: none;
        }

        /* ========== NAVBAR ========== */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 40px;
            background: rgba(10, 10, 12, 0.95);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .logo-wrap {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
        }

        .logo-icon {
            width: 32px;
            height: 32px;
            color: var(--primary-red);
            filter: drop-shadow(0 0 8px rgba(229, 9, 20, 0.7));
        }

        .logo-content {
            display: flex;
            flex-direction: column;
        }

        .logo-text {
            font-size: 24px;
            font-weight: 900;
            color: var(--primary-red);
            letter-spacing: 1.5px;
            line-height: 1;
            font-family: 'Be Vietnam Pro', sans-serif;
            text-shadow: 0 0 10px rgba(229, 9, 20, 0.5);
        }

        .logo-sub {
            font-size: 9px;
            color: #888;
            letter-spacing: 0.5px;
            margin-top: 3px;
        }

        .nav-links {
            display: flex;
            gap: 32px;
            align-items: center;
        }

        .nav-links a {
            color: var(--text-gray);
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.25s ease;
        }

        .nav-links a:hover,
        .nav-links a.active {
            color: var(--text-white);
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.6);
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .search-box {
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 7px 16px;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
        }

        .search-box:focus-within {
            background: rgba(255, 255, 255, 0.12);
            border-color: rgba(229, 9, 20, 0.5);
            box-shadow: 0 0 12px rgba(229, 9, 20, 0.3);
        }

        .search-box input {
            background: transparent;
            border: none;
            outline: none;
            color: #fff;
            font-size: 13px;
            width: 190px;
        }

        .search-box input::placeholder {
            color: #777;
        }

        .search-box i {
            color: #888;
            font-size: 13px;
        }

        .header-icon-btn {
            color: #ccc;
            font-size: 18px;
            cursor: pointer;
            transition: color 0.2s, transform 0.2s;
        }

        .header-icon-btn:hover {
            color: #fff;
            transform: scale(1.1);
        }

        /* ========== PAGE TITLE ========== */
        .title-wrapper {
            position: relative;
            text-align: center;
            padding: 30px 20px 24px;
        }

        .page-title {
            font-family: 'Be Vietnam Pro', sans-serif;
            font-size: 34px;
            font-weight: 900;
            font-style: italic;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #ffffff;
            text-shadow: 0 0 12px rgba(255, 30, 45, 0.9), 0 0 30px rgba(229, 9, 20, 0.6);
            display: inline-block;
            position: relative;
        }

        /* ========== CHECKOUT LAYOUT ========== */
        .checkout-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 10px 30px 50px;
        }

        .checkout-grid {
            display: grid;
            grid-template-columns: 290px 1fr 310px;
            gap: 24px;
            align-items: start;
        }

        /* Card styling */
        .panel-box {
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 12px;
            padding: 18px 20px;
            backdrop-filter: blur(14px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
        }

        .panel-title {
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            color: #eeeeee;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* ========== LEFT PANEL: THÔNG TIN SUẤT CHIẾU ========== */
        .showtime-card {
            display: flex;
            gap: 15px;
            align-items: flex-start;
        }

        .movie-thumb-wrap {
            position: relative;
            width: 95px;
            flex-shrink: 0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.12);
        }

        .movie-thumb {
            width: 100%;
            height: 130px;
            object-fit: cover;
            display: block;
        }

        .movie-thumb-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(to top, rgba(0,0,0,0.95), transparent);
            padding: 6px 4px 4px;
            text-align: center;
        }

        .movie-name-tag {
            font-size: 10px;
            font-weight: 700;
            color: #fff;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .movie-rating-tag {
            font-size: 10px;
            color: var(--gold);
            font-weight: 700;
        }

        .showtime-details {
            font-size: 13px;
            line-height: 1.8;
            color: #cccccc;
        }

        .showtime-details strong {
            color: #ffffff;
            font-weight: 600;
        }

        .back-btn-container {
            margin-top: 24px;
        }

        .btn-pill-outline {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 9px 24px;
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.25);
            color: #e0e0e0;
            font-size: 13px;
            font-weight: 500;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.25s ease;
        }

        .btn-pill-outline:hover {
            border-color: #ffffff;
            background: rgba(255, 255, 255, 0.12);
            color: #ffffff;
            transform: translateX(-3px);
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.15);
        }

        /* ========== CENTER PANEL: PHƯƠNG THỨC THANH TOÁN ========== */
        .payment-methods-wrapper {
            position: relative;
        }

        .arch-header {
            text-align: center;
            position: relative;
            padding-bottom: 12px;
            margin-bottom: 20px;
        }

        /* Glowing curved arch above title */
        .arch-curve {
            width: 90%;
            height: 16px;
            margin: 0 auto 6px;
            border-top: 2px solid rgba(220, 180, 130, 0.7);
            border-radius: 50% 50% 0 0 / 100% 100% 0 0;
            box-shadow: 0 -3px 14px rgba(235, 185, 110, 0.35);
        }

        .payment-header-title {
            font-size: 15px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: #ffffff;
        }

        /* 3 Payment Columns */
        .payment-columns {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
        }

        .pay-category-title {
            font-size: 13px;
            font-weight: 600;
            color: #bbbbbb;
            margin-bottom: 12px;
            white-space: nowrap;
        }

        /* Payment Option Card */
        .pay-card {
            background: rgba(28, 28, 32, 0.7);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 14px 16px;
            margin-bottom: 14px;
            cursor: pointer;
            transition: all 0.25s ease;
            position: relative;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .pay-card:hover {
            border-color: rgba(255, 255, 255, 0.25);
            background: rgba(35, 35, 40, 0.85);
            transform: translateY(-2px);
        }

        .pay-card.active {
            background: rgba(34, 30, 32, 0.95);
            border-color: var(--neon-red);
            box-shadow: 0 0 16px rgba(229, 9, 20, 0.35);
        }

        .pay-card-header {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        /* Custom Radio */
        .custom-radio {
            width: 18px;
            height: 18px;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.4);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            transition: all 0.2s ease;
        }

        .pay-card.active .custom-radio {
            border-color: var(--neon-red);
            box-shadow: 0 0 8px rgba(255, 30, 45, 0.6);
        }

        .custom-radio-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: transparent;
            transition: all 0.2s ease;
        }

        .pay-card.active .custom-radio-dot {
            background: var(--neon-red);
        }

        .pay-logo-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            overflow: hidden;
        }

        .pay-card-label {
            font-size: 13px;
            font-weight: 600;
            color: #ffffff;
            margin-top: 4px;
            text-align: center;
        }

        /* Brand Logos Styling */
        /* MoMo */
        .momo-badge {
            width: 60px;
            height: 52px;
            background: #a50064;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(165, 0, 100, 0.4);
        }

        .momo-badge span {
            color: #fff;
            font-weight: 900;
            font-size: 14px;
            line-height: 1.1;
            letter-spacing: -0.5px;
        }

        /* ShopeePay */
        .shopee-badge {
            width: 60px;
            height: 48px;
            background: #ee4d2d;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 8px rgba(238, 77, 45, 0.4);
        }

        /* Napas */
        .napas-badge {
            background: #ffffff;
            padding: 8px 16px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 48px;
        }

        /* Card logos group (VISA, Mastercard, JCB) */
        .intl-cards-header {
            display: flex;
            align-items: center;
            gap: 6px;
            flex-wrap: wrap;
        }

        .card-mini-badge {
            height: 24px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #ffffff;
            padding: 2px 6px;
        }

        /* Apple Pay */
        .apple-badge {
            background: #ffffff;
            border-radius: 8px;
            padding: 8px 14px;
            width: 100%;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Google Pay */
        .gpay-badge {
            background: #ffffff;
            border-radius: 8px;
            padding: 8px 14px;
            width: 100%;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* International Card Input Fields Form */
        .intl-card-form {
            display: none;
            margin-top: 10px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 12px;
            animation: fadeIn 0.3s ease;
        }

        .pay-card.active .intl-card-form {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-4px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-group-sm {
            margin-bottom: 10px;
        }

        .form-group-sm label {
            display: block;
            font-size: 11px;
            color: #999999;
            margin-bottom: 4px;
        }

        .form-control-dark {
            width: 100%;
            background: var(--input-bg);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 6px;
            padding: 7px 10px;
            color: #ffffff;
            font-size: 12px;
            outline: none;
            font-family: inherit;
            transition: all 0.2s ease;
        }

        .form-control-dark:focus {
            border-color: var(--neon-red);
            box-shadow: 0 0 8px rgba(229, 9, 20, 0.4);
            background: rgba(20, 20, 24, 0.95);
        }

        .form-row-dual {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 8px;
        }

        /* Center Discount Bar (Bottom of Center Panel) */
        .center-discount-bar {
            margin-top: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .center-discount-bar .discount-label {
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 1px;
            color: #e0e0e0;
            text-transform: uppercase;
        }

        .discount-input-pill {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            padding: 7px 18px;
            color: #fff;
            font-size: 13px;
            outline: none;
            width: 200px;
            transition: all 0.25s ease;
        }

        .discount-input-pill:focus {
            border-color: var(--neon-red);
            box-shadow: 0 0 10px rgba(229, 9, 20, 0.4);
            background: rgba(255, 255, 255, 0.09);
        }

        .btn-apply {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.25);
            border-radius: 25px;
            padding: 7px 20px;
            color: #fff;
            font-size: 13px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.25s ease;
        }

        .btn-apply:hover {
            background: rgba(229, 9, 20, 0.8);
            border-color: var(--neon-red);
            box-shadow: 0 0 12px rgba(229, 9, 20, 0.5);
        }

        /* ========== RIGHT PANEL: TÓM TẮT ĐƠN HÀNG ========== */
        .summary-card {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .summary-line {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
            color: #cccccc;
        }

        .summary-line strong {
            color: #ffffff;
            font-weight: 600;
        }

        .summary-separator {
            height: 1px;
            background: rgba(255, 255, 255, 0.12);
            margin: 6px 0;
        }

        .summary-total-line {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 15px;
            font-weight: 700;
            color: #ffffff;
            padding-top: 4px;
        }

        .summary-total-price {
            font-size: 18px;
            color: #ffffff;
            font-weight: 800;
            letter-spacing: 0.5px;
        }

        /* Right discount box */
        .right-discount-section {
            margin-top: 10px;
            border-top: 1px solid rgba(255, 255, 255, 0.08);
            padding-top: 14px;
        }

        .right-discount-section .discount-title {
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            color: #ffffff;
            margin-bottom: 10px;
        }

        .right-discount-row {
            display: flex;
            gap: 8px;
        }

        .right-discount-row input {
            flex: 1;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.18);
            border-radius: 6px;
            padding: 8px 12px;
            color: #fff;
            font-size: 12px;
            outline: none;
            transition: all 0.2s;
        }

        .right-discount-row input:focus {
            border-color: var(--neon-red);
            box-shadow: 0 0 8px rgba(229, 9, 20, 0.4);
        }

        .right-discount-row button {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 6px;
            padding: 8px 14px;
            color: #eee;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            white-space: nowrap;
        }

        .right-discount-row button:hover {
            background: var(--primary-red);
            border-color: var(--primary-red);
            color: #fff;
        }

        /* Action Buttons Area */
        .bottom-actions-container {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 16px;
            margin-top: 28px;
        }

        .btn-continue-text {
            background: none;
            border: none;
            color: #aaaaaa;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: color 0.2s;
            padding: 10px 16px;
        }

        .btn-continue-text:hover {
            color: #ffffff;
        }

        /* Glowing primary button HOÀN TẤT ĐẶT VÉ -> */
        .btn-complete-booking {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 11px 30px;
            border-radius: 30px;
            background: linear-gradient(135deg, #e50914 0%, #ff1e56 100%);
            border: 1px solid #ff4d6d;
            color: #ffffff;
            font-size: 14px;
            font-weight: 800;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            cursor: pointer;
            box-shadow: 0 0 20px rgba(229, 9, 20, 0.65), inset 0 0 10px rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-complete-booking:hover {
            background: linear-gradient(135deg, #ff1e2d 0%, #ff2a75 100%);
            box-shadow: 0 0 28px rgba(255, 30, 45, 0.9), inset 0 0 14px rgba(255, 255, 255, 0.3);
            transform: scale(1.03);
        }

        .btn-complete-booking:active {
            transform: scale(0.98);
        }

        /* ========== FOOTER / WATERMARK ========== */
        .cinema-footer {
            margin-top: 50px;
            position: relative;
            padding: 30px 20px 40px;
            text-align: center;
            overflow: hidden;
        }

        .ambient-flare-bottom {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: linear-gradient(90deg, transparent 0%, rgba(229, 9, 20, 0.2) 20%, rgba(255, 42, 109, 0.9) 50%, rgba(229, 9, 20, 0.2) 80%, transparent 100%);
            box-shadow: 0 0 16px 2px rgba(255, 30, 45, 0.7);
        }

        .footer-watermark-wrap {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            opacity: 0.45;
            user-select: none;
            transition: opacity 0.3s;
        }

        .footer-watermark-wrap:hover {
            opacity: 0.8;
        }

        .film-reel-svg {
            width: 42px;
            height: 42px;
            fill: #e50914;
            filter: drop-shadow(0 0 8px rgba(229, 9, 20, 0.6));
            animation: spinReel 24s linear infinite;
        }

        @keyframes spinReel {
            100% { transform: rotate(360deg); }
        }

        .watermark-text {
            display: flex;
            align-items: baseline;
            gap: 10px;
            font-family: 'Be Vietnam Pro', sans-serif;
        }

        .watermark-brand {
            font-size: 26px;
            font-weight: 900;
            font-style: italic;
            color: var(--primary-red);
            letter-spacing: 1px;
            text-shadow: 0 0 12px rgba(229, 9, 20, 0.7);
        }

        .watermark-slogan {
            font-size: 13px;
            font-weight: 600;
            color: #d0303b;
            letter-spacing: 0.5px;
            font-style: italic;
        }

        /* ========== SUCCESS MODAL ========== */
        .modal-backdrop {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(0, 0, 0, 0.85);
            backdrop-filter: blur(8px);
            z-index: 9999;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .modal-backdrop.open {
            display: flex;
            animation: modalFadeIn 0.3s ease;
        }

        @keyframes modalFadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .success-card {
            background: #151518;
            border: 1px solid rgba(229, 9, 20, 0.4);
            box-shadow: 0 0 35px rgba(229, 9, 20, 0.4), 0 20px 40px rgba(0, 0, 0, 0.8);
            border-radius: 16px;
            max-width: 480px;
            width: 100%;
            padding: 30px;
            text-align: center;
            position: relative;
        }

        .success-icon-wrap {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: rgba(46, 204, 113, 0.15);
            border: 2px solid #2ecc71;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 16px;
            box-shadow: 0 0 20px rgba(46, 204, 113, 0.4);
        }

        .success-icon-wrap i {
            font-size: 32px;
            color: #2ecc71;
        }

        .success-title {
            font-family: 'Be Vietnam Pro', sans-serif;
            font-size: 22px;
            font-weight: 800;
            color: #ffffff;
            margin-bottom: 8px;
        }

        .success-sub {
            font-size: 13px;
            color: #aaaaaa;
            margin-bottom: 20px;
        }

        .ticket-receipt {
            background: rgba(255, 255, 255, 0.04);
            border: 1px dashed rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            padding: 16px;
            margin-bottom: 22px;
            text-align: left;
            font-size: 13px;
            line-height: 1.8;
        }

        .receipt-row {
            display: flex;
            justify-content: space-between;
        }

        .receipt-row strong {
            color: #fff;
        }

        .qr-placeholder {
            margin: 14px auto 6px;
            width: 110px;
            height: 110px;
            background: #ffffff;
            border-radius: 8px;
            padding: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-buttons {
            display: flex;
            gap: 12px;
            justify-content: center;
        }

        .btn-modal-secondary {
            padding: 10px 20px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.2);
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-modal-secondary:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .btn-modal-primary {
            padding: 10px 24px;
            border-radius: 20px;
            background: var(--primary-red);
            color: #fff;
            border: none;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            text-decoration: none;
            box-shadow: 0 0 15px rgba(229, 9, 20, 0.6);
            transition: all 0.2s;
        }

        .btn-modal-primary:hover {
            background: #ff1e2d;
            box-shadow: 0 0 20px rgba(255, 30, 45, 0.8);
        }

        /* Toast notification */
        .toast-notify {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: rgba(20, 20, 24, 0.95);
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
        }

        .toast-notify.show {
            transform: translateY(0);
            opacity: 1;
        }

        /* Responsive */
        @media (max-width: 1100px) {
            .checkout-grid {
                grid-template-columns: 1fr;
            }
            .payment-columns {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <!-- Ambient Top Neon Red Lens Flare Line -->
    <div class="ambient-flare-top"></div>

    <!-- Header Navigation -->
    <header>
        <a href="<%= request.getContextPath() %>/user/trangchu.jsp" class="logo-wrap">
            <svg class="logo-icon" viewBox="0 0 24 24" fill="currentColor">
                <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2" fill="none"/>
                <circle cx="12" cy="12" r="3" fill="currentColor"/>
                <circle cx="12" cy="6" r="1.5" fill="currentColor"/>
                <circle cx="12" cy="18" r="1.5" fill="currentColor"/>
                <circle cx="6" cy="12" r="1.5" fill="currentColor"/>
                <circle cx="18" cy="12" r="1.5" fill="currentColor"/>
            </svg>
            <div class="logo-content">
                <span class="logo-text">CINE+</span>
                <span class="logo-sub">More Movies, More Feelings</span>
            </div>
        </a>

        <nav class="nav-links">
            <a href="<%= request.getContextPath() %>/user/trangchu.jsp">Trang chủ</a>
            <a href="#">Phim</a>
            <a href="<%= request.getContextPath() %>/user/chonsuatchieu.jsp">Lịch chiếu</a>
            <a href="#">Rạp</a>
            <a href="#">Ưu đãi</a>
        </nav>

        <div class="header-right">
            <div class="search-box">
                <input type="text" placeholder="Tìm kiếm phim, diễn viên...">
                <i class="fa-solid fa-magnifying-glass"></i>
            </div>
            <i class="fa-regular fa-user header-icon-btn" title="Tài khoản"></i>
            <i class="fa-solid fa-bars header-icon-btn" title="Menu"></i>
        </div>
    </header>

    <!-- Page Title -->
    <div class="title-wrapper">
        <h1 class="page-title">THANH TOÁN</h1>
    </div>

    <!-- Main Content Container -->
    <main class="checkout-container">
        <div class="checkout-grid">

            <!-- LEFT PANEL: THÔNG TIN SUẤT CHIẾU -->
            <div class="left-section">
                <div class="panel-box">
                    <h2 class="panel-title">THÔNG TIN SUẤT CHIẾU</h2>
                    <div class="showtime-card">
                        <div class="movie-thumb-wrap">
                            <img src="https://image.tmdb.org/t/p/w200/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg" 
                                 alt="Thanh Gươm Diệt Quỷ" 
                                 class="movie-thumb"
                                 onerror="this.src='https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=200&fit=crop';">
                            <div class="movie-thumb-overlay">
                                <div class="movie-name-tag">Thanh Gươm Diệt Quỷ</div>
                                <div class="movie-rating-tag"><i class="fa-solid fa-star"></i> 9.7</div>
                            </div>
                        </div>
                        <div class="showtime-details">
                            <p>Rạp: <strong>CGV Vincom - Phòng 1</strong></p>
                            <p>Suất chiếu: <strong>13:30 - Thứ Hai 14/10</strong></p>
                            <p>Định dạng: <strong>2D</strong></p>
                        </div>
                    </div>
                </div>

                <div class="back-btn-container">
                    <a href="<%= request.getContextPath() %>/user/chonghe.jsp" class="btn-pill-outline">
                        <i class="fa-solid fa-arrow-left"></i> Quay lại
                    </a>
                </div>
            </div>

            <!-- CENTER PANEL: PHƯƠNG THỨC THANH TOÁN -->
            <div class="center-section">
                <div class="payment-methods-wrapper">
                    <!-- Arched decorative curve & Title -->
                    <div class="arch-header">
                        <div class="arch-curve"></div>
                        <h2 class="payment-header-title">PHƯƠNG THỨC THANH TOÁN</h2>
                    </div>

                    <!-- 3 Payment Sub-Columns -->
                    <div class="payment-columns">

                        <!-- Column 1: Ví điện tử -->
                        <div class="pay-subcol">
                            <h3 class="pay-category-title">Ví điện tử</h3>

                            <!-- MoMo -->
                            <div class="pay-card" data-method="momo" onclick="selectPaymentMethod(this)">
                                <div class="pay-card-header">
                                    <div class="custom-radio">
                                        <div class="custom-radio-dot"></div>
                                    </div>
                                    <div class="momo-badge">
                                        <span>mo</span>
                                        <span>mo</span>
                                    </div>
                                </div>
                                <div class="pay-card-label">MoMo</div>
                            </div>

                            <!-- ShopeePay -->
                            <div class="pay-card" data-method="shopeepay" onclick="selectPaymentMethod(this)">
                                <div class="pay-card-header">
                                    <div class="custom-radio">
                                        <div class="custom-radio-dot"></div>
                                    </div>
                                    <div class="shopee-badge">
                                        <svg width="44" height="28" viewBox="0 0 120 70" fill="none">
                                            <rect width="120" height="70" rx="8" fill="#ee4d2d"/>
                                            <path d="M42 22C42 16.5 46.5 12 52 12C57.5 12 62 16.5 62 22" stroke="white" stroke-width="4" stroke-linecap="round" fill="none"/>
                                            <rect x="32" y="22" width="40" height="38" rx="4" fill="white"/>
                                            <path d="M57 32C55 30 52 29.5 49 31C46 32.5 45 35 47 37.5C49 40 55 41 55 44C55 47 52 49 48 48C45 47.5 43 45.5 42 43.5" stroke="#ee4d2d" stroke-width="4" stroke-linecap="round" fill="none"/>
                                            <text x="76" y="47" fill="white" font-size="20" font-weight="900" font-family="sans-serif">Pay</text>
                                        </svg>
                                    </div>
                                </div>
                                <div class="pay-card-label">ShopeePay</div>
                            </div>
                        </div>

                        <!-- Column 2: Thẻ Ngân hàng -->
                        <div class="pay-subcol">
                            <h3 class="pay-category-title">Thẻ Ngân hàng</h3>

                            <!-- Thẻ ATM / Nội địa (Napas) -->
                            <div class="pay-card" data-method="atm" onclick="selectPaymentMethod(this)">
                                <div class="pay-card-header">
                                    <div class="custom-radio">
                                        <div class="custom-radio-dot"></div>
                                    </div>
                                    <span style="font-size: 13px; font-weight: 600; color: #fff;">Thẻ ATM / Nội địa</span>
                                </div>
                                <div class="napas-badge">
                                    <svg viewBox="0 0 140 38" width="100" height="28">
                                        <text x="5" y="27" fill="#005a9c" font-size="24" font-weight="900" font-style="italic" font-family="'Segoe UI', Roboto, sans-serif">napas</text>
                                        <path d="M96 11 L110 24 L96 37" fill="none" stroke="#8ec03f" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                                        <path d="M108 11 L122 24 L108 37" fill="none" stroke="#009688" stroke-width="5" stroke-linecap="round" stroke-linejoin="round"/>
                                    </svg>
                                </div>
                            </div>

                            <!-- Thẻ Quốc tế (Active By Default) -->
                            <div class="pay-card active" data-method="international" onclick="selectPaymentMethod(this)">
                                <div class="pay-card-header">
                                    <div class="custom-radio">
                                        <div class="custom-radio-dot"></div>
                                    </div>
                                    <div class="intl-cards-header">
                                        <!-- Visa -->
                                        <div class="card-mini-badge">
                                            <svg viewBox="0 0 60 20" width="34" height="14">
                                                <text x="2" y="16" fill="#1a1f71" font-size="16" font-weight="900" font-style="italic" font-family="sans-serif">VISA</text>
                                            </svg>
                                        </div>
                                        <!-- Mastercard -->
                                        <div class="card-mini-badge">
                                            <svg viewBox="0 0 40 24" width="28" height="16">
                                                <circle cx="15" cy="12" r="10" fill="#EB001B"/>
                                                <circle cx="25" cy="12" r="10" fill="#F79E1B" fill-opacity="0.85"/>
                                            </svg>
                                        </div>
                                        <!-- JCB -->
                                        <div class="card-mini-badge">
                                            <svg viewBox="0 0 40 24" width="26" height="16">
                                                <rect width="13" height="24" rx="3" fill="#0066b2"/>
                                                <rect x="13.5" width="13" height="24" rx="3" fill="#ee1c25"/>
                                                <rect x="27" width="13" height="24" rx="3" fill="#009944"/>
                                                <text x="4" y="17" fill="white" font-size="10" font-weight="bold">JCB</text>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <div class="pay-card-label" style="text-align: left; padding-left: 30px;">Thẻ Quốc tế</div>

                                <!-- Credit Card Details Form -->
                                <div class="intl-card-form" onclick="event.stopPropagation()">
                                    <div class="form-group-sm">
                                        <label>Số thẻ / Card number</label>
                                        <input type="text" 
                                               class="form-control-dark" 
                                               id="card-number" 
                                               placeholder="**** **** **** 1234" 
                                               value="4111 2222 3333 1234"
                                               maxlength="19">
                                    </div>
                                    <div class="form-row-dual">
                                        <div class="form-group-sm">
                                            <label>Hạn thẻ</label>
                                            <input type="text" class="form-control-dark" placeholder="MM/YY" value="12/28" maxlength="5">
                                        </div>
                                        <div class="form-group-sm">
                                            <label>CVV</label>
                                            <input type="password" class="form-control-dark" placeholder="CVV" value="888" maxlength="4">
                                        </div>
                                    </div>
                                    <div class="form-group-sm" style="margin-bottom: 0;">
                                        <label>Tên chủ thẻ / Cardholder name</label>
                                        <input type="text" class="form-control-dark" placeholder="Cardholder name" value="Sample cardholder">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Column 3: Thanh toán Trả sau / Voucher -->
                        <div class="pay-subcol">
                            <h3 class="pay-category-title">Thanh toán Trả sau / Voucher</h3>

                            <!-- Apple Pay -->
                            <div class="pay-card" data-method="applepay" onclick="selectPaymentMethod(this)">
                                <div class="pay-card-header">
                                    <div class="custom-radio">
                                        <div class="custom-radio-dot"></div>
                                    </div>
                                    <div class="apple-badge">
                                        <svg viewBox="0 0 100 40" width="85" height="32">
                                            <!-- Apple logo -->
                                            <path d="M22 17.5C22 14.5 24.5 12.8 24.6 12.7C23.2 10.7 21 10.4 20.3 10.3C18.5 10.1 16.7 11.4 15.7 11.4C14.7 11.4 13.3 10.3 11.8 10.3C9.9 10.3 8.1 11.4 7.1 13.1C5.1 16.7 6.6 22 8.5 24.8C9.5 26.1 10.6 27.6 12.1 27.6C13.5 27.5 14.1 26.7 15.7 26.7C17.4 26.7 17.9 27.6 19.4 27.5C20.9 27.5 21.9 26.2 22.8 24.9C23.9 23.3 24.3 21.8 24.4 21.7C24.3 21.6 22 20.7 22 17.5Z" fill="#000000"/>
                                            <path d="M18.8 8.4C19.6 7.4 20.1 6 19.9 4.6C18.7 4.7 17.2 5.4 16.4 6.4C15.7 7.2 15.1 8.6 15.3 10C16.7 10.1 18.1 9.3 18.8 8.4Z" fill="#000000"/>
                                            <!-- Pay text -->
                                            <text x="32" y="24" fill="#000000" font-size="18" font-weight="600" font-family="-apple-system, BlinkMacSystemFont, sans-serif">Pay</text>
                                        </svg>
                                    </div>
                                </div>
                                <div class="pay-card-label">Apple Pay</div>
                            </div>

                            <!-- Google Pay -->
                            <div class="pay-card" data-method="googlepay" onclick="selectPaymentMethod(this)">
                                <div class="pay-card-header">
                                    <div class="custom-radio">
                                        <div class="custom-radio-dot"></div>
                                    </div>
                                    <div class="gpay-badge">
                                        <svg viewBox="0 0 100 40" width="85" height="32">
                                            <!-- Google G -->
                                            <path d="M19.6 19.9C19.6 19.2 19.5 18.5 19.4 17.9H10V21.7H15.4C15.1 23.1 14.3 24.3 13 25.1V28H16.8C19 25.9 20.3 22.9 19.6 19.9Z" fill="#4285F4"/>
                                            <path d="M10 29.8C12.7 29.8 14.9 28.9 16.8 28L13 25.1C12.2 25.6 11.2 26 10 26C7.4 26 5.2 24.2 4.4 21.8H0.5V24.8C2.4 28.6 6.3 29.8 10 29.8Z" fill="#34A853"/>
                                            <path d="M4.4 21.8C4 20.5 4 19.2 4.4 17.9V14.9H0.5C-0.8 17.5 -0.8 22.2 0.5 24.8L4.4 21.8Z" fill="#FBBC05"/>
                                            <path d="M10 13.7C11.4 13.7 12.8 14.2 13.8 15.2L16.9 12.1C14.9 10.3 12.5 9.7 10 9.7C6.3 9.7 2.4 10.9 0.5 14.9L4.4 17.9C5.2 15.5 7.4 13.7 10 13.7Z" fill="#EA4335"/>
                                            <!-- Pay text -->
                                            <text x="26" y="24" fill="#5f6368" font-size="18" font-weight="600" font-family="Roboto, sans-serif">Pay</text>
                                        </svg>
                                    </div>
                                </div>
                                <div class="pay-card-label">Google Pay</div>
                            </div>
                        </div>

                    </div>

                    <!-- Center Discount Input Bar -->
                    <div class="center-discount-bar">
                        <span class="discount-label">MÃ GIẢM GIÁ</span>
                        <input type="text" id="center-voucher-input" class="discount-input-pill" placeholder="Nhập mã voucher...">
                        <button type="button" class="btn-apply" onclick="applyCoupon('center')">Áp dụng</button>
                    </div>
                </div>
            </div>

            <!-- RIGHT PANEL: TÓM TẮT ĐƠN HÀNG -->
            <div class="right-section">
                <div class="panel-box summary-card">
                    <h2 class="panel-title">TÓM TẮT ĐƠN HÀNG</h2>
                    
                    <div class="summary-line">
                        <span>Ghế:</span>
                        <strong id="display-seats">F11, F12</strong>
                    </div>

                    <div class="summary-line">
                        <span>Số lượng:</span>
                        <strong id="display-count">2 ghế</strong>
                    </div>

                    <div class="summary-separator"></div>

                    <div class="summary-line">
                        <span>Tạm tính</span>
                        <strong id="display-subtotal">4.850.000đ</strong>
                    </div>

                    <div class="summary-line" id="discount-row" style="display: none; color: #2ecc71;">
                        <span>Giảm giá:</span>
                        <strong id="display-discount">-0đ</strong>
                    </div>

                    <div class="summary-separator"></div>

                    <div class="summary-total-line">
                        <span>Tổng cộng</span>
                        <span class="summary-total-price" id="display-total" style="color: #ff3344;">4.850.000đ</span>
                    </div>

                    <!-- Right Column Discount Box -->
                    <div class="right-discount-section">
                        <div class="discount-title">MÃ GIẢM GIÁ</div>
                        <div class="right-discount-row">
                            <input type="text" id="right-voucher-input" placeholder="Mã ưu đãi...">
                            <button type="button" onclick="applyCoupon('right')">Áp dụng</button>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons: Tiếp tục & HOÀN TẤT ĐẶT VÉ -->
                <div class="bottom-actions-container">
                    <button type="button" class="btn-continue-text" onclick="window.location.href='<%= request.getContextPath() %>/user/chonghe.jsp'">
                        Tiếp tục
                    </button>
                    <button type="button" class="btn-complete-booking" onclick="completeBooking()">
                        HOÀN TẤT ĐẶT VÉ <i class="fa-solid fa-arrow-right"></i>
                    </button>
                </div>
            </div>

        </div>
    </main>

    <!-- Bottom Cinema Watermark & Flares -->
    <footer class="cinema-footer">
        <div class="ambient-flare-bottom"></div>
        <div class="footer-watermark-wrap">
            <svg class="film-reel-svg" viewBox="0 0 24 24">
                <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2" fill="none"/>
                <circle cx="12" cy="12" r="3" fill="currentColor"/>
                <circle cx="12" cy="6" r="1.5" fill="currentColor"/>
                <circle cx="12" cy="18" r="1.5" fill="currentColor"/>
                <circle cx="6" cy="12" r="1.5" fill="currentColor"/>
                <circle cx="18" cy="12" r="1.5" fill="currentColor"/>
            </svg>
            <div class="watermark-text">
                <span class="watermark-brand">CINE+</span>
                <span class="watermark-slogan">Rạp phim trong tầm tay bạn!</span>
            </div>
            <svg class="film-reel-svg" viewBox="0 0 24 24">
                <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2" fill="none"/>
                <circle cx="12" cy="12" r="3" fill="currentColor"/>
                <circle cx="12" cy="6" r="1.5" fill="currentColor"/>
                <circle cx="12" cy="18" r="1.5" fill="currentColor"/>
                <circle cx="6" cy="12" r="1.5" fill="currentColor"/>
                <circle cx="18" cy="12" r="1.5" fill="currentColor"/>
            </svg>
        </div>
    </footer>

    <!-- SUCCESS BOOKING MODAL -->
    <div class="modal-backdrop" id="successModal">
        <div class="success-card">
            <div class="success-icon-wrap">
                <i class="fa-solid fa-check"></i>
            </div>
            <h3 class="success-title">Đặt Vé & Thanh Toán Thành Công!</h3>
            <p class="success-sub">Vé điện tử của bạn đã được xuất và gửi về email.</p>

            <div class="ticket-receipt">
                <div class="receipt-row">
                    <span>Mã đặt vé:</span>
                    <strong style="color: #ff3344;" id="ticket-code">#CINE-98241-VN</strong>
                </div>
                <div class="receipt-row">
                    <span>Phim:</span>
                    <strong>Thanh Gươm Diệt Quỷ</strong>
                </div>
                <div class="receipt-row">
                    <span>Suất chiếu:</span>
                    <strong>13:30 - Thứ Hai 14/10</strong>
                </div>
                <div class="receipt-row">
                    <span>Rạp:</span>
                    <strong>CGV Vincom - Phòng 1</strong>
                </div>
                <div class="receipt-row">
                    <span>Ghế:</span>
                    <strong id="modal-seats">F11, F12</strong>
                </div>
                <div class="receipt-row">
                    <span>Phương thức:</span>
                    <strong id="modal-method">Thẻ Quốc tế (Visa)</strong>
                </div>
                <div class="receipt-row">
                    <span>Tổng tiền:</span>
                    <strong id="modal-total" style="color: #2ecc71;">4.850.000đ</strong>
                </div>

                <!-- QR code simulation -->
                <div class="qr-placeholder">
                    <svg viewBox="0 0 100 100" width="94" height="94">
                        <!-- Outer Frame -->
                        <rect x="0" y="0" width="30" height="30" fill="#000"/>
                        <rect x="5" y="5" width="20" height="20" fill="#fff"/>
                        <rect x="9" y="9" width="12" height="12" fill="#000"/>
                        
                        <rect x="70" y="0" width="30" height="30" fill="#000"/>
                        <rect x="75" y="5" width="20" height="20" fill="#fff"/>
                        <rect x="79" y="9" width="12" height="12" fill="#000"/>

                        <rect x="0" y="70" width="30" height="30" fill="#000"/>
                        <rect x="5" y="75" width="20" height="20" fill="#fff"/>
                        <rect x="9" y="79" width="12" height="12" fill="#000"/>

                        <!-- Random QR blocks -->
                        <rect x="36" y="6" width="6" height="14" fill="#000"/>
                        <rect x="48" y="10" width="12" height="6" fill="#000"/>
                        <rect x="36" y="26" width="28" height="6" fill="#000"/>
                        <rect x="12" y="38" width="14" height="6" fill="#000"/>
                        <rect x="38" y="38" width="10" height="10" fill="#000"/>
                        <rect x="58" y="38" width="8" height="16" fill="#000"/>
                        <rect x="74" y="38" width="18" height="6" fill="#000"/>
                        <rect x="6" y="52" width="24" height="6" fill="#000"/>
                        <rect x="36" y="56" width="12" height="18" fill="#000"/>
                        <rect x="56" y="62" width="14" height="6" fill="#000"/>
                        <rect x="78" y="52" width="14" height="18" fill="#000"/>
                        <rect x="52" y="78" width="18" height="14" fill="#000"/>
                        <rect x="76" y="78" width="14" height="14" fill="#000"/>
                    </svg>
                </div>
                <div style="text-align:center; font-size:11px; color:#888;">Quét mã QR tại quầy để nhận vé</div>
            </div>

            <div class="modal-buttons">
                <a href="<%= request.getContextPath() %>/user/trangchu.jsp" class="btn-modal-secondary">Về trang chủ</a>
                <button type="button" class="btn-modal-primary" onclick="window.print()">In vé / Tải vé</button>
            </div>
        </div>
    </div>

    <!-- Toast Notification -->
    <div class="toast-notify" id="toastBox">
        <i class="fa-solid fa-circle-check" style="color: #2ecc71; font-size: 16px;"></i>
        <span id="toastMessage">Thông báo</span>
    </div>

    <script>
        // State
        let basePrice = 4850000;
        let discount = 0;
        let currentMethod = 'international';
        const methodNames = {
            'momo': 'Ví điện tử MoMo',
            'shopeepay': 'Ví điện tử ShopeePay',
            'atm': 'Thẻ ATM / Nội địa (Napas)',
            'international': 'Thẻ Quốc tế (Visa / Mastercard / JCB)',
            'applepay': 'Apple Pay',
            'googlepay': 'Google Pay'
        };

        // Format currency helper
        function formatVND(amount) {
            return new Intl.NumberFormat('vi-VN').format(amount) + 'đ';
        }

        // Initialize from URL params if passed from chonghe.jsp
        document.addEventListener('DOMContentLoaded', () => {
            const urlParams = new URLSearchParams(window.location.search);
<<<<<<< HEAD
            const seatsParam = urlParams.get('seats') || sessionStorage.getItem('booking_seats');
            const countParam = urlParams.get('count') || sessionStorage.getItem('booking_count');
            const totalParam = urlParams.get('total') || sessionStorage.getItem('booking_total');
=======
            const seatsParam = urlParams.get('seats');
            const countParam = urlParams.get('count');
            const totalParam = urlParams.get('total');
>>>>>>> 91f922ef1370547c7acca7703630eb5a3fa63efd

            if (seatsParam) {
                document.getElementById('display-seats').textContent = seatsParam;
            }
            if (countParam) {
                document.getElementById('display-count').textContent = countParam;
            }
            if (totalParam) {
                const parsed = parseInt(totalParam.replace(/[^0-9]/g, ''), 10);
                if (!isNaN(parsed) && parsed > 0) {
                    basePrice = parsed;
                    document.getElementById('display-subtotal').textContent = formatVND(basePrice);
                    updateTotal();
                }
            }

            // Card number input formatter
            const cardInput = document.getElementById('card-number');
            if (cardInput) {
                cardInput.addEventListener('input', (e) => {
                    let val = e.target.value.replace(/\D/g, '').substring(0, 16);
                    let formatted = val.match(/.{1,4}/g)?.join(' ') || val;
                    e.target.value = formatted;
                });
            }
        });

        // Payment Method Selection
        function selectPaymentMethod(cardElement) {
            document.querySelectorAll('.pay-card').forEach(c => c.classList.remove('active'));
            cardElement.classList.add('active');
            currentMethod = cardElement.getAttribute('data-method');
            showToast('Đã chọn phương thức: ' + (methodNames[currentMethod] || currentMethod));
        }

        // Voucher discount handler
        function applyCoupon(source) {
            const input = source === 'center' 
                ? document.getElementById('center-voucher-input') 
                : document.getElementById('right-voucher-input');
            
            const code = input.value.trim().toUpperCase();

            if (!code) {
                showToast('Vui lòng nhập mã giảm giá!', 'warning');
                return;
            }

            // Sync both inputs
            document.getElementById('center-voucher-input').value = code;
            document.getElementById('right-voucher-input').value = code;

            if (code === 'CINE50' || code === 'CGV50' || code === 'GIAM50K') {
                discount = 50000;
                showToast('Áp dụng thành công mã ' + code + ' (-50.000đ)!');
            } else if (code === 'VIP10' || code === 'GIAM10') {
                discount = Math.round(basePrice * 0.1);
                showToast('Áp dụng mã ' + code + ' thành công: Giảm 10% (-' + formatVND(discount) + ')!');
            } else if (code === 'CINE+' || code === 'CINE2026') {
                discount = 100000;
                showToast('Mã đặc biệt ' + code + ': Giảm ngay 100.000đ!');
            } else {
                discount = 30000; // default generic discount for demo
                showToast('Áp dụng mã ' + code + ' thành công (-30.000đ)!');
            }

            updateTotal();
        }

        function updateTotal() {
            const finalTotal = Math.max(0, basePrice - discount);
            document.getElementById('display-total').textContent = formatVND(finalTotal);

            const discountRow = document.getElementById('discount-row');
            if (discount > 0) {
                discountRow.style.display = 'flex';
                document.getElementById('display-discount').textContent = '-' + formatVND(discount);
            } else {
                discountRow.style.display = 'none';
            }
        }

        // Complete booking popup
        function completeBooking() {
            // Generate random ticket code
            const randomCode = '#CINE-' + Math.floor(10000 + Math.random() * 90000) + '-VN';
            document.getElementById('ticket-code').textContent = randomCode;
            document.getElementById('modal-seats').textContent = document.getElementById('display-seats').textContent;
            document.getElementById('modal-method').textContent = methodNames[currentMethod] || 'Thẻ Quốc tế';
            document.getElementById('modal-total').textContent = document.getElementById('display-total').textContent;

            const modal = document.getElementById('successModal');
            modal.classList.add('open');
        }

        // Toast feedback
        let toastTimeout;
        function showToast(message, type = 'success') {
            const toast = document.getElementById('toastBox');
            const msgEl = document.getElementById('toastMessage');
            msgEl.textContent = message;

            const icon = toast.querySelector('i');
            if (type === 'warning') {
                icon.className = 'fa-solid fa-circle-exclamation';
                icon.style.color = '#f39c12';
                toast.style.borderLeftColor = '#f39c12';
            } else {
                icon.className = 'fa-solid fa-circle-check';
                icon.style.color = '#2ecc71';
                toast.style.borderLeftColor = '#e50914';
            }

            toast.classList.add('show');
            clearTimeout(toastTimeout);
            toastTimeout = setTimeout(() => {
                toast.classList.remove('show');
            }, 3000);
        }
    </script>
</body>
</html>
