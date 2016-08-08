var app = angular.module('apiDocoApp', ['ngPrettyJson']);
app.controller('v1_json', function($scope) {

});
app.controller('v1_json_sidebar', function($scope) {

});

// app.filter('lower_case', function() {
//   return function(input, optional1, optional2) {
//     var output;
//     output = input.toLowerCase().split(" ").join("_");
//     return output;
//   }
// });

$(document).ready(function () {
  $("#menu-toggle").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });


});
