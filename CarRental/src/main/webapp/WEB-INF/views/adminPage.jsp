<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Screen</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .header {
            background-color: #0288D1;
            padding: 20px;
            text-align: center;
            color: white;
            font-size: 48px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .button {
            display: block;
            width: 497px;
            margin: 10px auto;
            padding: 15px 0;
            text-align: center;
            background-color: #0288D1;
            color: white;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .button.logout {
            background-color: #FFC107;
        }
    </style>
</head>
<body>
    <div class="header">ADMIN SCREEN</div>
    <div class="container">        
        <form action="/FUCarRentingSystemMVC/admin/customers">
        	<button type="submit" class="button">CUSTOMER MANAGEMENT</button>
        </form>
        
        <form action="/FUCarRentingSystemMVC/admin/cars">
        	<button type="submit" class="button">CAR MANAGEMENT</button>
        </form>
        
        <form action="/FUCarRentingSystemMVC/admin/rentals">
        	<button type="submit" class="button">RENTAL MANAGEMENT</button>
        </form>
        
        <form action="/FUCarRentingSystemMVC/admin/reports">
        	<button type="submit" class="button">RENTAL TRANSACTION REPORT</button>
        </form>
        
        <form action="/FUCarRentingSystemMVC/logout">
        	<button type="submit" class="button logout">Logout</button>
        </form>
    </div>
</body>
</html>
