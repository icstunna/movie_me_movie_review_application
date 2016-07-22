////////////////////////////////////////////////////////////////////////////////
// This is Where the API call to the Mashape API is made
// This is done through an event listener that then triggers and AJAX request
// to the Mashape API
///////////////////////////////////////////////////////////////////////////////

$(document).on('page:change', function() {

  $('body').on('click', '.new-movies', function(event) {
    event.preventDefault();

    var box_buzz = $.ajax({
      url: 'https://boxofficebuz.p.mashape.com/v1/movie/new_releases',
      type: 'GET',
      data: {},
      datatype: 'json',
      beforeSend: function(xhr) {
      xhr.setRequestHeader("X-Mashape-Key", "M35sQ6GZTzmshApb2MsXj0qgFmR0p1ut9qLjsnEYUrcwj050M6");
      }
    });

    box_buzz.then(function(data) {
      var imdb_id = [];
      for (i = 0; i < data.data.length; i++) {
        data.data[i].imdb
        imdb = $.ajax({
          url: 'https://boxofficebuz.p.mashape.com/v1/movie/imdb/'+data.data[i].imdb,
          type: 'GET',
          data: {},
          datatype: 'json',
          beforeSend: function(xhr) {
            xhr.setRequestHeader("X-Mashape-Key", "M35sQ6GZTzmshApb2MsXj0qgFmR0p1ut9qLjsnEYUrcwj050M6");
          }
        })

        imdb.success(function(data) {
          var controller = $.ajax({
            url: '/movies',
            type:'POST',
            datatype: 'JSON',
            data: {data: data}
          })

          controller.success(function(data) {
            $('.movie-wrapper').append(
              "<a href='/movies/"+data.movies.id+"'><div data-id="+data.movies.id+" class='movie-tile'><div class='movie-tile-inner'><img src="+data["movies"]["thumbnail"]+" class='movie-thumbnail'>"+data["movies"]["title"]+"</div></div></a>")
          })
        })
      }
    })

    box_buzz.error(function(err) {
      alert('fails');
    });
  })
});