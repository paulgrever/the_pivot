//fadeout flash messages
$(document).ready(function() {
    setTimeout(hideFlashes, 6000);
});
var hideFlashes = function() {
  $(".alert-notice, .alert-success, .alert-danger").fadeOut(4000);
};
