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

    request.done(function(data) {
      console.log("works")
    })
    console.log(data["results"][0]);
  }),

  request.error(function(err) {
    alert(err);
  })
});