angular.module('apiDocoApp', ['ngPrettyJson', 'duScroll'])
.value('duScrollOffset', 100) // offset from top to the div
.value('duScrollBottomSpy', true) // To make the last du-scrollspy link active when scroll reaches page/container bottom
.controller('DocumentationController', ['$scope', function ($scope) {
  $scope.init = function () {
    $(document).ready(function () {
      $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
      });
    });
  };

  $scope.init();
}]);
