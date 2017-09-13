$(initializer);

function initializer() {

  // dropdown
  $('.ui.dropdown').dropdown();

  // close message area
  $('.message .close')
      .on('click', function () {
        $(this).closest('.message').transition('fade');
      });

  // calendar
  $('.ui.calendar').calendar({
    type     : 'date',
    formatter: {
      date: function(date)  {
        var day = ('0' + date.getDate()).slice(-2);
        var month = ('0' + (date.getMonth() + 1)).slice(-2);
        var year = date.getFullYear();
        return year + '/' + month + '/' + day;
      }
    }
  });
}
