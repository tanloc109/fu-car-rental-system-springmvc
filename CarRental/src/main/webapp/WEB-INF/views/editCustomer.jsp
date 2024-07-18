<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Customer</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eYaRjAW2ipxiU03ir3X3qZLPb1Nr7QQIMUrOxHQp2ve8Xv+JLezQ0v1TI2eRJmRR" crossorigin="anonymous">
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
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        max-width: 700px;
        margin: auto;
    }
    .form-group {
        margin-bottom: 15px;
    }
    label {
        font-weight: 500;
    }
    input[type="text"],
    input[type="date"],
    textarea,
    select {
        border-radius: 5px;
        border: 1px solid #ced4da;
        padding: 10px;
        width: 100%;
        box-sizing: border-box;
    }
    input[type="text"]:focus,
    input[type="date"]:focus,
    textarea:focus,
    select:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
    }
    .form-group.text-center {
        margin-top: 20px;
    }
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
    }
    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
    .vad {
    width: 100%
    }
</style>
</head>
<body>
    <h1>Edit Customer Information</h1>
    <form action="${pageContext.request.contextPath}/customers/update" method="POST">
        <input type="hidden" name="customerID" value="${customer.customerID}">
        <div class="form-group">
            <label for="customerName">Name:</label>
            <input type="text" class="form-control" id="customerName" name="customerName" value="${customer.customerName}" required>
        </div>
        <div class="form-group">
            <label for="mobile">Mobile:</label>
            <input type="text" class="form-control" id="mobile" name="mobile" value="${customer.mobile}" required>
        </div>
        <div class="form-group">
            <label for="birthday">Birthday:</label>
            <input type="date" class="form-control" id="birthday" name="birthday" value="${birthdayString}" required>
        </div>
        <div class="form-group">
            <label for="identityCard">Identity Card:</label>
            <input type="text" class="form-control" id="identityCard" name="identityCard" value="${customer.identityCard}" required>
        </div>
        <div class="form-group">
            <label for="licenceNumber">Licence Number:</label>
            <input type="text" class="form-control" id="licenceNumber" name="licenceNumber" value="${customer.licenceNumber}" required>
        </div>
        <div class="form-group">
            <label for="licenceDate">Licence Date:</label>
            <input type="date" class="form-control" id="licenceDate" name="licenceDate" value="${licenceDateString}" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" id="email" name="email" value="${customer.email}" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" value="${customer.password}" required>
        </div>
        <div class="form-group text-center">
            <button class="btn btn-primary vad" type="submit">Update Customer</button>
        </div>
    </form>
</body>
</html>
