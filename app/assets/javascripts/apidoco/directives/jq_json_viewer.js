'use strict';

angular.module('apiDocoApp').directive('jqJsonViewer', [function() {
  return {
    restrict: 'A',
    scope: {
      data: "="
    },
    link: function(scope, elem, attrs) {
      $(elem).jsonViewer(scope.data, { withQuotes: true });

      // Collapse the second level
      $(elem).find('ul.json-dict > li > ul > li > a.json-toggle').click();
    }
  };
}]);
