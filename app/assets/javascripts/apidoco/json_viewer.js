$(document).ready(function() {
	var content_data = $(".json-viewer").attr("data-content");
	console.log(content_data);


	$('.json-viewer').jsonViewer(content_data);
});