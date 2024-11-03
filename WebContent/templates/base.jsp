<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><jsp:include page="${request.getAttribute('title')}" /></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../static/style.css">
    <link rel="stylesheet" href="../static/style_nav.css">
</head>



<body>

<%@ include file="header.jsp" %> 

    <jsp:include page="${request.getAttribute('content')}" />
    
    <%@ include file="footer.jsp" %> 
</body>


</html>
