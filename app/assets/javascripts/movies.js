$(document).on('page:change', function() {

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
    var request = $.ajax({
      url: '/movies',
      type:'POST',
      datatype: 'JSON',
      data: {data: data}
    })

    request.success(function(data) {
      console.log(data)
      for (var i = 0 ; i <= (data["movies"].length + 1) ; i++) {
        $('.movie-wrapper').append("<a href='/movies/"+(i+1)+"'><div data-id="+(i+1)+" class='movie-tile'><div class='movie-tile-inner'><img src="+data["movies"][i]["thumbnail"]+" class='movie-thumbnail'>"+data["movies"][i]["title"]+"</div></div></a>")
      }
    })
  }),

  request.error(function(err) {
    alert(err);
  })
});