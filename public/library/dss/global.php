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

//custom functions
function printArray($array){
    echo "<pre>";
    print_r($array);
    echo "</pre>";
}