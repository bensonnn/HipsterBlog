$(document).ready(function() {
  // $(".container").hide();
  // $(".container").fadeIn("fast");





  //Hipster rating scale feedback

  $('textarea').keyup( function() {

    var text = $('textarea').val()
    console.log(text)
    $.ajax({
      url: "/get_rating",
      type: "POST",
      data: text,
      success: function(data) {
        $("#score").text(data)
      }
    })


  })

});
