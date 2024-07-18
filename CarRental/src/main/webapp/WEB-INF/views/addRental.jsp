<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Car Rental</title>
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
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Create Car Rental</h1>
        </div>
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>
        <form action="/FUCarRentingSystemMVC/rentals/create" method="post">
            <div class="form-group">
                <label for="customer">Customer:</label>
                <select id="customer" name="customer">
                    <c:forEach var="customer" items="${customers}">
                        <option value="${customer.customerID}">${customer.customerName} ${customer.mobile }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="car">Car:</label>
                <select id="car" name="car">
                    <c:forEach var="car" items="${cars}">
                        <option value="${car.carID}">${car.carName} ${car.rentPrice} ${car.color}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="pickupDate">Pickup Date:</label>
                <input type="date" id="pickupDate" name="pickupDate" required>
            </div>
            <div class="form-group">
                <label for="returnDate">Return Date:</label>
                <input type="date" id="returnDate" name="returnDate" required>
            </div>
            <div class="form-group">
                <button type="submit" class="submit">Submit</button>
                <button type="reset" class="cancel">Cancel</button>
            </div>
        </form>
    </div>
</body>
</html>
