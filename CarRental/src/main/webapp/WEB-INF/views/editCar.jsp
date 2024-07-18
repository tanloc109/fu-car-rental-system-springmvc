<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Car</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eYaRjAW2ipxiU03ir3X3qZLPb1Nr7QQIMUrOxHQp2ve8Xv+JLezQ0v1TI2eRJmRR" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #e9ecef;
            margin: 0;
            color: #495057;
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 0;
        }
        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 700px;
            margin: auto;
        }
        .form-group {
            margin-bottom: 20px;
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
            margin-top: 30px;
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
        .row {
            margin-left: -10px;
            margin-right: -10px;
        }
        .col-md-6 {
            padding-left: 10px;
            padding-right: 10px;
        }
        .w-100 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/cars/update" method="POST">
        <input type="hidden" name="carID" value="${car.carID}">
        <div class="row">
            <h1>Edit Car</h1>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="carName">Name:</label>
                    <input type="text" class="form-control" id="carName" name="carName" value="${car.carName}" required>
                </div>
                <div class="form-group">
                    <label for="carModelYear">Model:</label>
                    <input type="text" class="form-control" id="carModelYear" name="carModelYear" value="${car.carModelYear}" required>
                </div>
                <div class="form-group">
                    <label for="color">Color:</label>
                    <input type="text" class="form-control" id="color" name="color" value="${car.color}" required>
                </div>
                <div class="form-group">
                    <label for="capacity">Capacity:</label>
                    <input type="text" class="form-control" id="capacity" name="capacity" value="${car.capacity}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description">${car.description}</textarea>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="importDate">Import Date:</label>
                    <input type="date" class="form-control" id="importDate" name="importDate" value="${car.importDate}" required>
                </div>
                <div class="form-group">
                    <label for="producer">Producer:</label>
                    <select class="form-control" id="producer" name="producer" required>
                        <c:forEach var="producer" items="${producers}">
                            <option value="${producer.producerID}" ${producer.producerID == car.producer.producerID ? 'selected' : ''}>${producer.producerName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="rentPrice">Rent Price:</label>
                    <input type="text" class="form-control" id="rentPrice" name="rentPrice" value="${car.rentPrice}" required>
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <input type="text" class="form-control" id="status" name="status" value="${car.status}" required>
                </div>
            </div>
        </div>
        <div class="form-group text-center">
            <button class="btn btn-primary w-100" type="submit">Update Car</button>
        </div>
    </form>
</body>
</html>
