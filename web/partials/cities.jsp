<%@page import="com.bojan.database.Cities"%>

<div class="options cities">
    <% for (String city : Cities.GetCities()) {%>
    <label class="custom-radio"><%=city%>
        <input type="radio" name="city" value="<%=city%>">
        <span class="checkmark"></span>
    </label>
    <% }%>
</div>