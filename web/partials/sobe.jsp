<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-lg-9">
    <c:forEach items="${sobe}" var="soba">
        <div class="card mt-4">
            <div class="row">
                <div class="col-lg-4">
                    <img src="/slike/${soba.getSlika()}" class="w-100">
                </div>
                <div class="col-lg-8 px-3">
                    <div class="card-block px-3">
                        <h4 class="card-title mt-3">${soba.getTip()}, ${soba.getHotel()}</h4>
                        <p class="card-text mt-3">Opis</p>

                        <span class="prices"><strong>${soba.getCena()}$</strong></span>
                        <input hidden type="text" id="soba_id" value="${soba.getSoba_id()}">
                        <div>
                            Datum dolaska <input type="text" name="datum_dolaska" class="form-control datepick w-25 datum_dolaska" required>
                        </div>

                        <div>
                            Datum odlaska <input type="text" name="datum_odlaska" class="form-control datepick w-25 mt-3 datum_odlaska" required>
                            <button type="button" class="btn btn-primary btn-show-rooms mt-3 btn-rezervisi" data-toggle="modal" data-target="#rezervacija">
                                Rezervisi
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </c:forEach>                
</div>

<!-- Modal -->
<div class="modal fade" id="rezervacija" tabindex="-1" role="dialog" aria-labelledby="rezervacijaLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="rezervacijaLabel">Placanje</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/rezervacije" method="POST">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="kartica">Izaberite karticu</label>
                        <select class="form-control" id="kartica" name="kartica">
                            <option>MasterCard</option>
                            <option>Maestro</option>
                            <option>Visa</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="broj_kartice">Broj kartice</label>
                        <input type="text" class="form-control" id="broj_kartice" name="broj_kartice" placeholder="XXXX-XXXX-XXXX-XXXX">
                    </div>

                    <div class="row">
                        <div class="form-group col-lg-8">
                            <label for="datum_isteka">Datum isteka</label>
                            <input type="text" class="form-control" id="datum_isteka" name="datum_isteka" placeholder="MM / YY">
                        </div>
                        <div class="form-group col-lg-4">
                            <label for="cvv">CVV</label>
                            <input type="text" class="form-control" id="cvv" name="cvv" placeholder="CVV">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Rezervacija za <b><span class="ime_sobe_i_hotela"></span></b></label>
                    </div>
                    <div class="form-group">
                        Od: <input type="text" class="form-control datepick" id="datum_dolaska_modal" name="datum_dolaska_modal" readonly >
                    </div>
                    <div class="form-group">
                        Do: <input type="text" class="form-control datepick" id="datum_odlaska_modal" name="datum_odlaska_modal" readonly >
                    </div>
                    <input hidden type="text" id="soba_id_modal" name="soba_id_modal">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Vrati se</button>
                    <button type="submit" name="plati" value="poeni" class="btn btn-success">Plati poenima</button>
                    <button type="submit" name="plati" value="novac" class="btn btn-primary">Plati</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(function () {
        $(".datepick").datepicker({
            dateFormat: "dd-mm-yy",
            changeMonth: true,
            changeYear: true,
            minDate: 0,
            maxDate: 365
        });

        $("input[name='datum_dolaska']").datepicker().datepicker("setDate", "+0");
        $("input[name='datum_odlaska']").datepicker().datepicker("setDate", "+7");

        $(".btn-rezervisi").on("click", function () {
            $(".ime_sobe_i_hotela").text($(this).parent().parent().children().html());
            $("#datum_dolaska_modal").val($(this).parent().parent().find(".datum_dolaska").val());
            $("#datum_odlaska_modal").val($(this).parent().parent().find(".datum_odlaska").val());
            $("#soba_id_modal").val($(this).parent().parent().find("#soba_id").val());
        });
    });
</script>