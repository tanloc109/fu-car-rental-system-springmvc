<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Management</title>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
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
    button {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-right: 10px;
    }
    button:hover {
        background-color: #0056b3;
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
    .action-buttons input[type="submit"] {
        padding: 6px 12px;
        margin-right: 5px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .action-buttons input[type="submit"]:hover {
        background-color: #218838;
    }
    .action-buttons input[type="submit"][value="Delete"] {
        background-color: #dc3545;
    }
    .action-buttons input[type="submit"][value="Delete"]:hover {
        background-color: #c82333;
    }
     .head{
	    display: flex;
	    justify-content: space-between;
	    margin: -24px 0;
    }
</style>
</head>
<body>
    <h1>Car Management</h1>
    <div class="head">
    <form action="/FUCarRentingSystemMVC/admin/back">
        <button type="submit" value="Back">Back</button>
    </form>

    <form action="/FUCarRentingSystemMVC/cars/add">
        <button type="submit">Add New Car</button>
    </form>
	</div>
    <c:if test="${not empty cars}">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Model</th>
                    <th>Color</th>
                    <th>Capacity</th>
                    <th>Description</th>
                    <th>Import Date</th>
                    <th>Producer</th>
                    <th>Country</th>
                    <th>Rent Price</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="car" items="${cars}" varStatus="status">
                    <tr>
                        <form action="/FUCarRentingSystemMVC/cars/edit" method="POST">
                            <input type="hidden" name="carID" value="${car.carID}" />
                            <td>${car.carID}</td>
                            <td>${car.carName}</td>
                            <td>${car.carModelYear}</td>
                            <td>${car.color}</td>
                            <td>${car.capacity}</td>
                            <td>${car.description}</td>
                            <td>${car.importDate}</td>
                            <td>${car.producer.producerName}</td>
                            <td>${car.producer.country}</td>
                            <td>${car.rentPrice}</td>
                            <td>${car.status}</td>
                            <td class="action-buttons">
                                <input type="submit" name="action" value="Edit"></input>
                                <input type="submit" name="action" value="Delete"></input>
                            </td>
                        </form>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty cars}">
        <p>No car found in the system.</p>
    </c:if>
</body>
</html>
