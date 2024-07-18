<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rental Report Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }
    h6 {
        font-size: 24px;
        margin-bottom: 20px;
        color: #333;
    }
    form {
        margin-bottom: 20px;
    }
    form input[type="date"], form input[type="submit"], form button {
        padding: 10px;
        margin-right: 10px;
        border-radius: 4px;
        border: 1px solid #ccc;
    }
    form button {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }
    form button:hover {
        background-color: #45a049;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
        color: #333;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .no-rentals {
        color: #555;
        font-size: 16px;
    }
    
    .title-page {
    	font-size: 32px;
    	text-align: center;
    	margin: 0;
    }
</style>
</head>
<body>
    <h6 class="title-page">Rental Report Page</h6>
    <form action="/FUCarRentingSystemMVC/admin/back">
        <button type="submit" value="Back">Back</button>
    </form>
    <form action="${pageContext.request.contextPath}/report/rentals">
        Start date: <input type="date" name="start" value="${start}"/> 
        End date: <input type="date" name="end" value="${end }"/> 
        <input type="submit" value="Submit" /> 
    </form>

    <c:if test="${not empty rentals}">
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Rental ID</th>
                    <th>Customer</th>
                    <th>Car</th>
                    <th>Pickup Date</th>
                    <th>Return Date</th>
                    <th>Rent Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="rental" items="${rentals}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${rental.rentalID}</td>
                        <td>${rental.customer}</td>
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

    <c:if test="${empty rentals}">
        <p class="no-rentals">No rentals found for the selected period.</p>
    </c:if>
</body>
</html>
