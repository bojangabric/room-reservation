<%@page import="com.bojan.baza.Gradovi"%>

<div class="options cities">
    <% for (String grad : Gradovi.UzmiGradove()) {%>
    <label class="custom-radio"><%=grad%>
        <input type="radio" name="grad" value="<%=grad%>">
        <span class="checkmark"></span>
    </label>
    <% }%>
</div>