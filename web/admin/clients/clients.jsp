<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Clients - Hotels</title>
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container col-12">
            <div class="flex-row">
                <div class="pt-4">
                    <table class="table table-hover" align="center">
                        <thead>
                        <th>User ID</th> 
                        <th>Username</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>Country</th>
                        <th>Post code</th>
                        <th>Role</th>
                        <th>Points</th>
                        <th></th>
                        </thead>
                        <c:forEach items="${clients}" var="client">
                            <tr>
                                <td class="align-middle">${client.getUser_id()}</td>
                                <td class="align-middle">${client.getUsername()}</td> 
                                <td class="align-middle">${client.getPassword()}</td> 
                                <td class="align-middle">${client.getName()}</td>
                                <td class="align-middle">${client.getEmail()}</td> 
                                <td class="align-middle">${client.getPhone()}</td>
                                <td class="align-middle">${client.getAddress()}</td>
                                <td class="align-middle">${client.getCity()}</td>
                                <td class="align-middle">${client.getCountry()}</td>
                                <td class="align-middle">${client.getPostcode()}</td>
                                <td class="align-middle">${client.getRole()}</td>
                                <td class="align-middle">${client.getPoints()}</td>    
                                <td style="width: 8%;">
                                    <a href="/ChangeClient/${client.getUser_id()}">
                                        <button class="btn btn-success btn-sm">Edit</button>
                                    </a>

                                    <a href="/DeleteClient/${client.getUser_id()}">
                                        <button class="btn btn-danger btn-sm">Delete</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <%@include file="/partials/footer.jsp" %>

    </body>
</html>