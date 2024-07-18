<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Car Rental</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 40px;
        }
        .container {
            width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            background-color: #007bff;
            padding: 20px;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }
        .header h1 {
            color: white;
            margin: 0;
            font-size: 24px;
        }
        .form-group {
            margin: 15px 0;
        }
        .form-group label {
            color: #007bff;
            font-size: 18px;
            font-weight: bold;
        }
        .form-group input[type="text"], 
        .form-group input[type="date"], 
        .form-group select {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .form-group button {
            width: 45%;
            padding: 10px;
            margin: 10px 5%;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button.submit {
            background-color: #007bff;
            color: white;
            width: 90%;
        }
        .form-group button.cancel {
            background-color: #ffc107;
            color: black;
            width: 90%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Edit Car Rental</h1>
        </div>
        <form action="/FUCarRentingSystemMVC/rentals/update" method="post">
            <input type="hidden" name="rentalID" value="${rental.rentalID}">
            <div class="form-group">
                <label for="customer">Customer:</label>
                <select id="customer" name="customer">
                    <c:forEach var="c" items="${customers}">
                        <option value="${c.customerID}" ${c.customerID == rental.customer.customerID ? 'selected' : ''}>${c.customerName} ${c.customerName} ${c.mobile }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="car">Car:</label>
                <select id="car" name="car">
                    <c:forEach var="c" items="${cars}">
                        <option value="${c.carID}" ${c.carID == rental.car.carID ? 'selected' : ''}>${c.carName} ${c.rentPrice} ${c.color}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="pickupDate">Pickup Date:</label>
                <input type="date" id="pickupDate" name="pickupDate" value="${rental.pickupDate}" required>
            </div>
            <div class="form-group">
                <label for="returnDate">Return Date:</label>
                <input type="date" id="returnDate" name="returnDate" value="${rental.returnDate}" required>
            </div>
            <div class="form-group">
                <button type="submit" class="submit">Update</button>
                <button type="button" class="cancel" onclick="window.location.href='/FUCarRentingSystemMVC/admin/rentals'">Cancel</button>
            </div>
        </form>
    </div>
</body>
</html>
