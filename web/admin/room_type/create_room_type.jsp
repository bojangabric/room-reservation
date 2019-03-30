<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>

        <title>Create room type - Hotels</title>   
        <%@ include file="/partials/metadata.jsp" %>

    </head>
    <body>

        <%@include file="/partials/header.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 pt-4">
                    <div class="card">
                        <div class="card-header">Create room type</div>
                        <div class="card-body">
                            <form method="POST" action="/CreateType">

                                <div class="form-group row">
                                    <label for="type" class="col-sm-4 col-form-label text-md-right">Type</label>
                                    <div class="col-md-6">
                                        <input id="type" type="text" class="form-control" name="type" required autofocus>
                                    </div>
                                </div>

                                <div class="form-group row mb-0">
                                    <div class="col-md-8 offset-md-4">
                                        <button type="submit" name="btn" value="save" class="btn btn-primary">
                                            Save
                                        </button>
                                        <a href="/admin/roomtypes">
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