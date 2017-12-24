//this file require to work with page load progressbar
$(function () {
  var $progress = $('#progress');
  $(document).ajaxStart(function() {
    //only add progress bar if not added yet.
    if ($progress.length === 0) {
      $progress = $('<div><dt/><dd/></div>').attr('id', 'progress');
      $("body").append($progress);
    }
    $progress.width((50 + Math.random() * 30) + "%");
  });

  $(document).ajaxComplete(function() {
    //End loading animation
    $progress.width("100%").delay(200).fadeOut(400, function() {
      $progress.width("0%").delay(200).show();
    });
  });
 $('.links').on('click', function() {
    $.getJSON();
  });
 
});