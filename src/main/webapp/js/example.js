$(() => {

  // dropdown
  $('.ui.dropdown').dropdown();

  $('.message .close')
      .on('click', function () {
        $(this).closest('.message').transition('fade');
      });
  
  // calendar
  $('.ui.calendar').calendar({
    type     : 'date',
    formatter: {
      date: (date) => {
        let day = ('0' + date.getDate()).slice(-2);
        let month = ('0' + (date.getMonth() + 1)).slice(-2);
        let year = date.getFullYear();
        return year + '/' + month + '/' + day;
      }
    }
  });
  
});
