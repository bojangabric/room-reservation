<%-- 
    Document   : footer
    Created on : Nov 25, 2018, 4:51:43 PM
    Author     : bojan
--%>


<%@page import="java.util.Calendar"%>

<footer class="bg-dark">
    <div class="container text-center text-white" style="position:relative;">
        Copyright &copy; Hoteli <%= Calendar.getInstance().get(java.util.Calendar.YEAR) %>
        <div class="socials">
            Follow us on: 
            <a href="https://www.facebook.com/" class="fa fa-facebook"></a>
            <a href="https://twitter.com/" class="fa fa-twitter"></a>
            <a href="https://www.instagram.com/?hl=en" class="fa fa-instagram"></a>
        </div>
    </div>
</footer>

