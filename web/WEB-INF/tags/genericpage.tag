<%-- 
    Document   : genericpage
    Created on : Nov 25, 2018, 4:05:03 PM
    Author     : bojan
--%>

<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="title" fragment="true" %>

<html>
    <head>
        <title><jsp:invoke fragment="title"/></title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="/css/style.css" >
    </head>
    <body>

        <jsp:include page="/partials/header.jsp"></jsp:include>

        <jsp:doBody/>

        <jsp:include page="/partials/footer.jsp"></jsp:include>

    </body>
</html>