$(document).ready(function() {
  return $("#signInModal").on("ajax:success", function(e, data, status, xhr) {
    $(this).modal("toggle");
    return location.reload(xhr.responseText);
  });
});
