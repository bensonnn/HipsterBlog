$(document).ready(function() {
  $(".container").hide();
  $(".container").fadeIn("fast");

  //Hipster rating scale feedback
  $('textarea').keyup( function() {

    var text = $('textarea').val()

    var length = text.replace(/\s+/, " ").split(" ").length
    var textArray = $.map( text.replace(/\s+/, " ").split(" "), function(ele){return ele.toLowerCase();});
    if (text.slice(-1) == " ") {
      $.ajax({
        url: "/get_rating",
        type: "POST",
        data: {arr: textArray},
        success: function(data) {
          $("#score").text(data)
        }
      })
    }
  })
});
