////////////////////////////////////////////////////////////////////////////////
// This is Where the API call to the Mashape API is made
// This is done through an event listener that then triggers and AJAX request
// to the Mashape API
///////////////////////////////////////////////////////////////////////////////

$(document).on('page:change', function() {

  // This is the event that triggers the Mashape API call
  $('body').on('click', '.new-movies', function(event) {
    event.preventDefault();
    // This is the AJAX request to the Mashape API
    var request = $.ajax({
      url: 'https://metacritic-2.p.mashape.com/movie-list/new-releases',
      type: 'GET',
      data: {},
      datatype: 'json',
      beforeSend: function(xhr) {
      xhr.setRequestHeader("X-Mashape-Authorization", "G4Cfon1ngimsh9hwXG4SV8smeutQp14iHIkjsnipeck8y0F5zi");
      }
    });

    request.success(function(data) {
      // Upon a successful API call, the data is then sent to the controller to be parsed
      // Once parsed it is then saved in the database with validations to prevent duplication
      var request = $.ajax({
        url: '/movies',
        type:'POST',
        datatype: 'JSON',
        data: {data: data}
      })

      request.success(function(data) {
        console.log(data)
        //Once the data has been saved to the Database, the controller sends back a JSON object of the all the movies
        // The JSON object is then parsed here and append without the need for a page refresh
        for (var i = 0 ; i <= (data["movies"].length + 1) ; i++) {
          $('.movie-wrapper').append(
            "<a href='/movies/"+(i+1)+"'><div data-id="+(i+1)+" class='movie-tile'><div class='movie-tile-inner'><img src="+data["movies"][i]["thumbnail"]+" class='movie-thumbnail'>"+data["movies"][i]["title"]+"</div></div></a>")
        }
      })
    }),

    request.error(function(err) {
      alert(err);
    });
  });
});