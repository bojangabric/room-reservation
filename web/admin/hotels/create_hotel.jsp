<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Create hotel - Hotels</title>   
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 pt-4">
                    <div class="card">
                        <div class="card-header">Create hotel</div>
                        <div class="card-body">
                            <form method="POST" action="/CreateHotel">

                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input id="name" type="text" class="form-control" name="name" required autofocus>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="address" class="col-sm-4 col-form-label text-md-right">Address</label>
                                    <div class="col-md-6">
                                        <input id="address" type="text" class="form-control" name="address" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="city" class="col-sm-4 col-form-label text-md-right">City</label>
                                    <div class="col-md-6">
                                        <input id="city" type="text" class="form-control" name="city" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="country" class="col-sm-4 col-form-label text-md-right">Country</label>
                                    <div class="col-md-6">
                                        <input id="country" type="text" class="form-control" name="country" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="description" class="col-sm-4 col-form-label text-md-right">Description</label>
                                    <div class="col-md-6">
                                        <input id="description" type="text" class="form-control" name="description" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="stars" class="col-sm-4 col-form-label text-md-right">Stars</label>
                                    <div class="col-md-6">
                                        <input id="stars" type="number" class="form-control" name="stars" required autofocus value="5" min="1" max="5">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="picture" class="col-sm-4 col-form-label text-md-right">Picture</label>
                                    <div class="col-md-6">
                                        <input id="picture" type="text" class="form-control" name="picture" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" name="btn" value="save" class="btn btn-primary">
                                            Save
                                        </button>
                                        <a href="/admin/hotels">
                                            <button type="button" name="btn" value="cancel" class="btn btn-danger">
                                                Cancel
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/partials/footer.jsp" %>

    </body>
</html>