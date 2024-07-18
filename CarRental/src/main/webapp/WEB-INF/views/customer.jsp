<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Customer Information</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 20px;
    }
    h1 {
        text-align: center;
        color: #343a40;
        margin-bottom: 20px;
    }
    form {
        margin-bottom: 20px;
        text-align: center;
    }
    .button {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 10px;
    }
    .button.logout {
        background-color: #dc3545;
    }
    .button:hover {
        background-color: #0056b3;
    }
    .button.logout:hover {
        background-color: #c82333;
    }
    .info-container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }
    .info-container p {
        margin: 10px 0;
        line-height: 1.6;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        background-color: white;
    }
    th, td {
        padding: 12px 15px;
        border: 1px solid #dee2e6;
        text-align: left;
    }
    th {
        background-color: #007bff;
        color: white;
        text-transform: uppercase;
        letter-spacing: 0.1em;
    }
    tr:nth-child(even) {
        background-color: #f8f9fa;
    }
    tr:hover {
        background-color: #e9ecef;
    }
    .edit-btn {
    	text-align: left;
    }
    .logout-btn {
    	text-align: right;
    }
</style>
</head>
<body>
    
     <form action="/FUCarRentingSystemMVC/logout" class="logout-btn">
        <button type="submit" class="button logout">Logout</button>
    </form>
    <div class="info-container">
	   
	    
        <h1>Customer Information</h1>
         <form action="/FUCarRentingSystemMVC/customers/edit2" method="POST" class="edit-btn">
	        <input type="hidden" name="customerID" value="${info.customerID}" />
	        <button type="submit" class="button">Edit</button>
	    </form>
        <p><strong>ID:</strong> ${info.customerID}</p>
        <p><strong>Name:</strong> ${info.customerName}</p>
        <p><strong>Mobile:</strong> ${info.mobile}</p>
        <p><strong>Birthday:</strong> <fmt:formatDate value="${info.birthday}" pattern="dd/MM/yyyy"/></p>
        <p><strong>Identity Card:</strong> ${info.identityCard}</p>
        <p><strong>Licence Number:</strong> ${info.licenceNumber}</p>
        <p><strong>Licence Date:</strong> <fmt:formatDate value="${info.licenceDate}" pattern="dd/MM/yyyy"/></p>
        <p><strong>Email:</strong> ${info.email}</p>
        <p><strong>Account:</strong> ${info.account.accountName}</p>
        <p><strong>Password:</strong> ${info.password}</p>
        
    </div>
    
    <c:if test="${not empty historyRental}">
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Rental ID</th>
                    <th>Car</th>
                    <th>Pickup Date</th>
                    <th>Return Date</th>
                    <th>Rent Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="rental" items="${historyRental}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${rental.rentalID}</td>
                        <td>${rental.car}</td>
                        <td>${rental.pickupDate}</td>
                        <td>${rental.returnDate}</td>
                        <td>${rental.rentPrice}</td>
                        <td>${rental.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty historyRental}">
        <p>No rentals found for the selected period.</p>
    </c:if>
</body>
</html>
