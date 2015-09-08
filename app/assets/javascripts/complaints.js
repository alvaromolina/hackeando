$(document).ready(function(){
	// disable auto discover
	//Dropzone.autoDiscover = false;

	// grap our upload form by its id
	//$("#new_image").dropzone({
		// restrict image size to a maximum 1MB
	//	maxFilesize: 1,
		// changed the passed param to one accepted by
		// our rails app
	//	paramName: "image[image]",
		// show remove links on each image upload
	//	addRemoveLinks: true
	//});	



	$("#complaint_url").change(function(){
		$.post("http://localhost:3000/complaints/preview/", { url: $(this).val()}, function(data){
		 	$("#preview").html(data);
		});
	})
});