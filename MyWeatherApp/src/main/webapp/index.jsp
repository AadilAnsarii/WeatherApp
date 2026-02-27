<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74b9ff, #0984e3);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .weather-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 25px;
            padding: 40px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .city-name {
            font-size: 2.2rem;
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 8px;
            animation: fadeIn 0.8s ease-out 0.2s both;
        }

        .date {
            color: #636e72;
            font-size: 1rem;
            animation: fadeIn 0.8s ease-out 0.4s both;
        }

        .main-weather {
            text-align: center;
            margin: 40px 0;
            animation: fadeIn 0.8s ease-out 0.6s both;
        }

        .weather-icon {
            font-size: 80px;
            margin-bottom: 20px;
            animation: bounce 2s ease-in-out infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }

        .temperature {
            font-size: 4rem;
            font-weight: 300;
            color: #2d3436;
            margin-bottom: 10px;
            position: relative;
        }

        .temperature::after {
            content: '°C';
            font-size: 1.5rem;
            position: absolute;
            top: 5px;
            margin-left: 5px;
            color: #636e72;
        }

        .weather-info {
            text-align: center;
            margin: 30px 0;
            animation: fadeIn 0.8s ease-out 0.5s both;
        }

        .weather-condition {
            font-size: 1.4rem;
            color: #2d3436;
            margin-bottom: 10px;
            text-transform: capitalize;
            font-weight: 500;
        }

        .weather-date {
            font-size: 1rem;
            color: #636e72;
            margin-bottom: 20px;
        }

        .weather-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 40px;
        }

        .detail-card {
            background: linear-gradient(145deg, #f8f9fa, #e9ecef);
            border-radius: 20px;
            padding: 25px 20px;
            text-align: center;
            transition: all 0.3s ease;
            animation: fadeIn 0.8s ease-out calc(0.8s + var(--delay, 0s)) both;
        }

        .detail-card:nth-child(1) {
            --delay: 0s;
        }

        .detail-card:nth-child(2) {
            --delay: 0.2s;
        }

        .detail-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .detail-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
            animation: pulse 3s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }

        .detail-value {
            font-size: 1.8rem;
            font-weight: 600;
            color: #2d3436;
            margin-bottom: 8px;
        }

        .detail-label {
            font-size: 0.9rem;
            color: #636e72;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Weather Background Animation */
        .weather-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent 30%, rgba(116, 185, 255, 0.1) 50%, transparent 70%);
            border-radius: 25px;
            animation: shimmer 3s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes shimmer {
            0% {
                transform: translateX(-100%);
            }
            100% {
                transform: translateX(100%);
            }
        }

        .weather-container {
            position: relative;
            overflow: hidden;
        }

        /* Floating elements */
        .floating-element {
            position: absolute;
            width: 6px;
            height: 6px;
            background: rgba(116, 185, 255, 0.3);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .floating-element:nth-child(1) {
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-element:nth-child(2) {
            top: 60%;
            right: 15%;
            animation-delay: 2s;
        }

        .floating-element:nth-child(3) {
            bottom: 30%;
            left: 20%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px) scale(1);
                opacity: 0.7;
            }
            50% {
                transform: translateY(-20px) scale(1.2);
                opacity: 1;
            }
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .weather-container {
                padding: 30px 25px;
                margin: 10px;
            }

            .city-name {
                font-size: 1.8rem;
            }

            .temperature {
                font-size: 3.5rem;
            }

            .weather-condition {
                font-size: 1.2rem;
            }

            .weather-details {
                grid-template-columns: 1fr;
                gap: 15px;
            }

            .detail-card {
                padding: 20px;
            }
        }

        /* Loading animation for dynamic content */
        .loading {
            background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
            background-size: 200% 100%;
            animation: loading 1.5s infinite;
        }

        @keyframes loading {
            0% {
                background-position: 200% 0;
            }
            100% {
                background-position: -200% 0;
            }
        }
    </style>
</head>
<body>
    <div class="floating-element"></div>
    <div class="floating-element"></div>
    <div class="floating-element"></div>

    <div class="weather-container">
        <div class="header">
            <h1 class="city-name">${city}</h1>
            <p class="date">${date}</p>
        </div>
        
                <div class="detail-card">
            <div class="detail-value">${weatherCondition}</div>
        </div>

        <div class="main-weather">
            <div class="weather-icon">☀️</div>
            <div class="temperature">${temperature}</div>
        </div>

        <div class="weather-details">
            <div class="detail-card">
                <div class="detail-icon">💧</div>
                <div class="detail-value">${humidity}%</div>
                <div class="detail-label">Humidity</div>
            </div>

            <div class="detail-card">
                <div class="detail-icon">🌬️</div>
                <div class="detail-value">${windSpeed}</div>
                <div class="detail-label">Wind Speed</div>
            </div>
        </div>
    </div>
</body>
</html>