'use strict';

angular.module('apiDocoApp')
.controller('DocumentationController', ['$scope', '$window', function ($scope, $window) {
  $scope.navigateToCurrentVersion = function (versionName) {
    var version = $scope.documentationVersions.filter(function(v) {
      return v.name === versionName;
    })[0];
    $window.location.href = version.path;
  };

  $scope.versionAddress = function () {
    return $window.location.href.split('#')[0];
  };

  $scope.viewRaw = function(data) {
    var dataStingified = JSON.stringify(data, null, 2);
    var x = window.open();

    x.document.open();
    x.document.write('<html><body><pre>' + dataStingified + '</pre></body></html>');
    x.document.close();
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

  $scope.init();
}]);
