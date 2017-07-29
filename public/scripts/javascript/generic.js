
function showSuccessMessage(title, message){
	$(document).ready(function(){
        $('#success_alert #title').text(title);
        $('#success_alert #message').text(message);
        $('#success_alert').removeClass('hidden');
    });
}

function showErrorMessage(title, message){
	$(document).ready(function(){
		$('#fail_alert #title').text(title);
        $('#fail_alert #message').text(message);
        $('#fail_alert').removeClass('hidden');
    });
}