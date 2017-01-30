'use strict';

angular.module('apiDocoApp')
.controller('DocumentationController', ['$scope', '$window', '$location', '$anchorScroll', function ($scope, $window, $location, $anchorScroll) {
  $scope.navigateToCurrentVersion = function (versionName) {
    var version = $scope.documentationVersions.filter(function(v) {
      return v.name === versionName;
    })[0];
    $window.location.href = version.path;
  };

  $scope.initMenuToggle = function() {
    $(document).ready(function () {
      $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
      });
    });
  };

  $scope.init = function () {
    $scope.initMenuToggle();
  };

  $scope.navigateToApi = function (node) {
    if(!node.is_folder) {
      $location.hash('api_' + node.file_name);
      $anchorScroll();
    }
  }
}]);
