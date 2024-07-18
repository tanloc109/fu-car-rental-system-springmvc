<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center; /* Center aligns horizontally */
            align-items: center; /* Center aligns vertically */
            height: 100vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
            background-color: #f0f0f0; /* Optional: Background color */
        }
        .container {
            width: 500px;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            background-color: #0288d1;
            padding: 20px;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }
        .header h1 {
            color: white;
            margin: 0;
            font-size: 48px;
        }
        .form-group {
            margin: 15px 0;
        }
        .form-group label {
            color: #0288d1;
            font-size: 24px;
            font-weight: bold;
            font-style: italic;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .form-group button {
            width: 100%; /* Full width of the container */
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .form-group button.login {
            background-color: #0288d1;
            color: white;
        }
        .form-group button.cancel {
            background-color: #ffc107;
            color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>LOGIN PAGE</h1>
        </div>
        <form action="login" method="post">
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <input type="text" id="txtUsername" name="username" placeholder="Input your username" required>
            </div>
            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <input type="password" id="txtPassword" name="password" placeholder="Input your password" required>
            </div>
            ${loginFail}
            ${logoutSuccess}
            <div class="form-group">
                <button type="submit" class="login">Login</button>
            	<button type="reset" class="cancel">Cancel</button>
            </div>
        </form>
    </div>
</body>
</html>
