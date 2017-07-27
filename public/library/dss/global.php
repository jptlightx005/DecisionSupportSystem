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
    setcookie('usrn', '', time() - 7200, "/");
 //    setcookie('token', '', time() - 7200, "/");
 //    setcookie('first_name', '', time() - 7200, "/");
	// setcookie('middle_name', '', time() - 7200, "/");
 //    setcookie('last_name', '', time() - 7200, "/");
 //    setcookie('priviledge_level', '', time() - 7200, "/");
}

//custom functions
function printArray($array){
    echo "<pre>";
    print_r($array);
    echo "</pre>";
}