<%-- 
    Document   : register
    Created on : Nov 26, 2018, 2:23:21 AM
    Author     : bojan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="title">
        Register - Hoteli
    </jsp:attribute>

    <jsp:body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 pt-4">
                    <div class="card">
                        <div class="card-header">Register</div>

                        <div class="card-body">
                            <form method="POST" action="/register" aria-label="Register">

                                <div class="form-group row">
                                    <label for="korisnicko_ime" class="col-md-4 col-form-label text-md-right">Korisnicko ime</label>
                                    <div class="col-md-6">
                                        <input id="korisnicko_ime" type="text" class="form-control" name="korisnicko_ime" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="password" class="col-md-4 col-form-label text-md-right">Lozinka</label>
                                    <div class="col-md-6">
                                        <input id="lozinka" type="password" class="form-control" name="lozinka" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="ime_prezime" class="col-md-4 col-form-label text-md-right">Ime i prezime</label>
                                    <div class="col-md-6">
                                        <input id="ime_prezime" type="text" class="form-control" name="ime_prezime" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail Adresa</label>  
                                    <div class="col-md-6">
                                        <input id="email" type="email" class="form-control" name="email" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="tel" class="col-md-4 col-form-label text-md-right">Telefon</label>  
                                    <div class="col-md-6">
                                        <input id="telefon" type="tel" class="form-control" name="telefon" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="adresa" class="col-md-4 col-form-label text-md-right">Adresa</label>
                                    <div class="col-md-6">
                                        <input id="adresa" type="text" class="form-control" name="adresa" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="grad" class="col-md-4 col-form-label text-md-right">Grad</label>
                                    <div class="col-md-6">
                                        <input id="grad" type="text" class="form-control" name="grad" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="drzava" class="col-md-4 col-form-label text-md-right">Drzava</label>
                                    <div class="col-md-6">
                                        <input id="drzava" type="text" class="form-control" name="drzava" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="postanski_broj" class="col-md-4 col-form-label text-md-right">Postanski broj</label>
                                    <div class="col-md-6">
                                        <input id="postanski_broj" type="text" class="form-control" name="postanski_broj" required>
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                            Registruj se
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:genericpage>   
