<%-- 
    Document   : Test
    Created on : Nov 25, 2018, 4:06:13 PM
    Author     : bojan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="title">
        Hoteli
    </jsp:attribute>

    <jsp:body>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 pt-4">
                    <form action="" method="get">
                        <span class="label">Zvezdice</span>
                        <div class="options pb-2 mt-2">
                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                    class="fa fa-star"></i><i class="fa fa-star"></i>
                                <input type="radio" name="radio">
                                <span class="checkmark"></span>
                            </label>

                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                    class="fa fa-star"></i>
                                <input type="radio" name="radio">
                                <span class="checkmark"></span>
                            </label>

                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                <input type="radio" name="radio">
                                <span class="checkmark"></span>
                            </label>

                            <label class="custom-radio"><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                <input type="radio" name="radio">
                                <span class="checkmark"></span>
                            </label>
                        </div>

                        <span class="label">Cena</span>
                        <div class="options mt-2 prices">
                            <label class="price_label">Min cena: <input class="mb-2 price_range" name="min_price" type="number" step="50" min="0" max="500" value="0"></label><br>
                            <label class="price_label">Max cena: <input class="mb-3 price_range" name="max_price" type="number" step="50" min="0" max="500" value="500"></label><br>
                        </div>

                        <span class="label">Lokacija</span>
                        <div class="options cities">
                            <label class="custom-radio">Beograd
                                <input type="radio" name="grad" value="Beograd">
                                <span class="checkmark"></span>
                            </label>

                            <label class="custom-radio">Novi Sad
                                <input type="radio" name="grad" value="Novi Sad">
                                <span class="checkmark"></span>
                            </label>
                        </div>

                        <button class="btn btn-primary mt-3" type="submit">Pretrazi</button>
                    </form>
                </div>

                <div class="col-lg-9">
                    <div class="card mt-4">
                        <div class="row">
                            <div class="col-lg-4">
                                <img src="https://placeholdit.imgix.net/~text?txtsize=38&txt=400%C3%97400&w=400&h=400"
                                     class="w-100">
                            </div>
                            <div class="col-lg-8 px-3">
                                <div class="card-block px-3">
                                    <h4 class="card-title mt-3">Ime hotela, Mesto</h4>
                                    <p class="card-text mt-3">Opis hotela Opis hotela Opis hotela Opis hotela</p>
                                    <p class="rating"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></p>
                                    <p class="prices"><b>150$ - 200$</b></p>
                                    <button class="btn btn-primary btn-show-rooms">Prikazi sobe</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>    