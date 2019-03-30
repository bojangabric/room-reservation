$(function () {
    new Cleave('#card_number', {
        creditCard: true
    });

    new Cleave('#expires_in', {
        date: true,
        datePattern: ['m', 'y']
    });

    new Cleave('#cvv', {
        numeral: true,
        blocks: [3]
    });

    $("button[value=points]").on("click", function () {
        $('[required]').removeAttr('required');
    });

    $.datepicker.setDefaults({
        beforeShow: function (i) {
            if ($(i).attr('readonly')) {
                return false;
            }
        }
    });

    $(".datepick").datepicker({
        dateFormat: "dd-mm-yy",
        changeMonth: true,
        changeYear: true,
        minDate: 0,
        maxDate: 365
    });
    
    $("input[name='arrive_date']").datepicker().datepicker("setDate", "+0");
    $("input[name='leave_date']").datepicker().datepicker("setDate", "+7");

    $(".btn-purchase").on("click", function () {
        $(".room_hotel_name").text($(this).parent().parent().children().html());
        $("#arrive_date_modal").val($(this).parent().parent().find(".arrive_date").val());
        $("#leave_date_modal").val($(this).parent().parent().find(".leave_date").val());
        $("#room_id_modal").val($(this).parent().parent().find("#room_id").val());
        $("#room_price_modal").val($(this).parent().parent().find(".price").html());
        $("#room_points_modal").val($(this).parent().parent().find(".points").html());
        $("#hotel_id_modal").val($(this).parent().parent().find(".hotel_id").html());
    });
});
