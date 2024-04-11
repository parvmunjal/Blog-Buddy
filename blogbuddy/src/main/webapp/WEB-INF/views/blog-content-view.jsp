<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generated Blog Content</title>
   <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
        }
        
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }
        
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .blog-content {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        p {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div id="blog-content">
            ${blogContent} <!-- This will display the generated blog content -->
        </div>
    </div>
</body>
</html>
