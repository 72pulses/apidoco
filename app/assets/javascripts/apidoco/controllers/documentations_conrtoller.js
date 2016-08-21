angular.module('apiDocoApp')
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
