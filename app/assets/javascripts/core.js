$(document).ready(function() {
  return $("#signInModal").on("ajax:success", function(e, data, status, xhr) {
    return $("#signInModal").append(xhr.responseText);
  }).on("ajax:error", function(e, xhr, status, error) {
    return $("#signInModal").append("<p>ERROR</p>");
  });
});
