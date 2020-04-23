$(document).on('turbolinks:load', function () {
    $('#events').DataTable();
    $('.p_date').datetimepicker({
        format:'Y.m.d H:i',
        lang:'en'
    });

});