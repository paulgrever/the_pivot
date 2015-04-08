$(document).ready(function() {
  return $("#signInModal").on("ajax:success", function(e, data, status, xhr) {
    $(this).modal("toggle");
    return location.reload(xhr.responseText);
  }).on("ajax:error", function(e, xhr, status, error) {
    $(this).modal("toggle");
    return location.reload("<p>" + error + "</p>");
  });
});
