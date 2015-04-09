//fadeout flash messages
var hideFlashes = function() {
  $(".alert-notice, .alert-success, .alert-danger").fadeOut(4000);
};

$(document).ready(function() {
    setTimeout(hideFlashes, 6000);
});
