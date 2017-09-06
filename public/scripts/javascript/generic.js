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

function popupWindow(url){
    var height = screen.height - 100;
    if(height >= 792)
        height = 792;
    window.open(url, '', 'width=900,height='+(height));
    return false;
}

function printPopupWindow(url){
    var height = screen.height - 100;
    if(height >= 792)
        height = 792;
    var popupWinddow = window.open(url, '', 'width=900,height='+(height));
    popupWinddow.print();
    return false;
}
