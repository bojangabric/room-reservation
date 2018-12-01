<%-- 
    Document   : gradovi
    Created on : Nov 28, 2018, 8:53:35 PM
    Author     : bojan
--%>

<%@page import="com.bojan.baza.Gradovi"%>
<div class="options cities">
    <% for (String grad : Gradovi.UzmiGradove()) {%>
    <label class="custom-radio"><%=grad%>
        <input type="radio" name="grad" value="<%=grad%>">
        <span class="checkmark"></span>
    </label>
    <% }%>
</div>