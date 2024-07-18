<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Customer</title>
</head>
<body>
	<form action="/FUCarRentingSystemMVC/customers/addCustomer" method="post">
        <label for="customerName">Name:</label>
        <input type="text" id="customerName" name="customerName" ><br/><br/>
        
        <label for="mobile">Mobile:</label>
        <input type="text" id="mobile" name="mobile" ><br/><br/>
        
        <label for="birthday">Birthday:</label>
        <input type="date" id="birthday" name="birthday" ><br/><br/>
        
        <label for="identityCard">Identity Card:</label>
        <input type="text" id="identityCard" name="identityCard"><br/><br/>
        
        <label for="licenceNumber">Licence Number:</label>
        <input type="text" id="licenceNumber" name="licenceNumber"><br/><br/>
        
        <label for="licenceDate">Licence Date:</label>
        <input type="date" id="licenceDate" name="licenceDate" ><br/><br/>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email"><br/><br/>
        
        <label for="accountName">Account:</label>
        <input type="text" id="accountName" name="accountName" ><br/><br/>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" ><br/><br/>
        
        <input type="submit" value="Update">
    </form>
</body>
</html>