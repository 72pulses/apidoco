angular.module('apiDocoApp', ['ngPrettyJson', 'duScroll', 'treeControl'])
.value('duScrollOffset', 100) // offset from top to the div
.value('duScrollBottomSpy', true); // To make the last du-scrollspy link active when scroll reaches page/container bottom
