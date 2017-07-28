<?php

//active page functions
function pageIsActive($pages){
	$currentPage = $_SERVER['PHP_SELF'];
	return in_array(strtolower($currentPage), $pages) ? " class=\"active\"" : "";
}

function homeIsActive(){
	$homePages[] = "/views/pages/index.php";
	return(pageIsActive($homePages));
}

function aboutIsActive(){
	$aboutPages[] = "/views/pages/about.php";
	return(pageIsActive($aboutPages));
}

function helpIsActive(){
	$helpPages[] = "/views/pages/help.php";
	return(pageIsActive($helpPages));
}

//navigation functions
function redirectToURL($msg, $rurl, $timeout = 1000){
    echo "<h1>$msg</h1>";

    if($rurl != null)
        echo "<script>setTimeout(\"location.href = '$rurl';\",$timeout);</script>";
}

//cookies function
function resetCookies(){
    setcookie('adminID', '', time() - 7200, "/");
    setcookie('usrn', '', time() - 7200, "/");
    setcookie('first_name', '', time() - 7200, "/");
	setcookie('middle_name', '', time() - 7200, "/");
    setcookie('last_name', '', time() - 7200, "/");
    setcookie('priviledge_level', '', time() - 7200, "/");
    setcookie('job', '', time() - 7200, "/");
}

//custom functions
function printArray($array){
    echo "<pre>";
    print_r($array);
    echo "</pre>";
}

function returnBlankIfNull($obj){
	if(isset($obj)){
		return $obj;
	}else{
		return "";
	}
}

function returnBlankIfNullObjectWithKey($obj, $key){
	if(isset($obj)){
		if(isset($obj[$key])){
			return returnBlankIfNull($obj[$key]);
		}else{
			return "";
		}
		
	}else{
		return "";
	}
}

function returnCookieWithKey($key){
	return returnBlankIfNullObjectWithKey($_COOKIE, $key);
}

function returnMiddleInitialWithDot($middle_name){
	if(returnBlankIfNull($middle_name) != ""){
		return $middle_name[0] . ". ";
	}else{
		return "";
	}
}

function returnFullName($first_name, $middle_name, $last_name){
	$middle_initial = returnMiddleInitialWithDot($middle_name);
	return "$first_name $middle_initial$last_name";
}

function returnAdminFullName(){
	return returnFullName(returnCookieWithKey('first_name'), returnCookieWithKey('middle_name'), returnCookieWithKey('last_name'));
}