$(function(){

  $("#vote-button").click(function(){

    var request = $.ajax({
      url: this.href + "/votes",
      method: "POST"
    });

    request.done(function(response){
      // change the vote number, and remove the vote link, replacing with already voted text
      console.log("resonse recieved!");
      console.log(response);
    });
  });
});
