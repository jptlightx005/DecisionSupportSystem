<?php
define('DSS_LIBRARY', $_SERVER['DOCUMENT_ROOT'] . '/library/dss/');
define('IMAGES_FOLDER', $_SERVER['DOCUMENT_ROOT'] . '/images/');
define('ASSETS_FOLDER', $_SERVER['DOCUMENT_ROOT'] . '/images/assets/');
define('UPLOADS_FOLDER', $_SERVER['DOCUMENT_ROOT'] . '/images/uploads/');

//active page functions
function pageIsActive($pages){
	$currentPage = $_SERVER['PHP_SELF'];
	return in_array(strtolower($currentPage), $pages) ? " class=\"active\"" : "";
}

function allowedPageForAll(){
    $currentPage = $_SERVER['PHP_SELF'];
    $pages[] = "/views/pages/index.php";
    $pages[] = "/views/pages/about.php";
    $pages[] = "/views/pages/help.php";
    $pages[] = "/views/pages/profile.php";
    return in_array(strtolower($currentPage), $pages);
}
//top nav pages
function homeIsActive(){
	$homePages[] = "/views/pages/index.php";
	$homePages[] = "/views/pages/case/case-list.php";
    $homePages[] = "/views/pages/case/case-page.php";
	$homePages[] = "/views/pages/patient/patient-list.php";
    $homePages[] = "/views/pages/patient/patient-page.php";
    $homePages[] = "/views/pages/symptom/symptom-list.php";
    $homePages[] = "/views/pages/symptom/symptom-page.php";
    $homePages[] = "/views/pages/medicine/medicine-list.php";
    $homePages[] = "/views/pages/medicine/medicine-page.php";
    $homePages[] = "/views/pages/disease/disease-list.php";
    $homePages[] = "/views/pages/disease/disease-page.php";
    $homePages[] = "/views/pages/nurse/nurse-list.php";
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

function profileIsActive(){
	$profilePages[] = "/views/pages/profile.php";
	return(pageIsActive($profilePages));
}

//side nav module pages
function caseIsActive(){
	$casePages[] = "/views/pages/case/case-list.php"; //make sure to add this at homeIsActive();
    $casePages[] = "/views/pages/case/case-page.php";
	return(pageIsActive($casePages));
}

function patientIsActive(){
	$patientPages[] = "/views/pages/patient/patient-list.php"; //make sure to add this at homeIsActive();
    $patientPages[] = "/views/pages/patient/patient-page.php";
	return(pageIsActive($patientPages));
}

function symptomIsActive(){
    $symptomPages[] = "/views/pages/symptom/symptom-list.php"; //make sure to add this at homeIsActive();
    $symptomPages[] = "/views/pages/symptom/symptom-page.php";
    return(pageIsActive($symptomPages));
}

function medicineIsActive(){
    $medicinePages[] = "/views/pages/medicine/medicine-list.php"; //make sure to add this at homeIsActive();
    $medicinePages[] = "/views/pages/medicine/medicine-page.php";
    return(pageIsActive($medicinePages));
}

function diseaseIsActive(){
    $diseasePages[] = "/views/pages/disease/disease-list.php"; //make sure to add this at homeIsActive();
    $diseasePages[] = "/views/pages/disease/disease-page.php";
    return(pageIsActive($diseasePages));
}

function nurseIsActive(){
    $nursePages[] = "/views/pages/nurse/nurse-list.php"; //make sure to add this at homeIsActive();
    // $nursePages[] = "/views/pages/disease/nurse-page.php";
    return(pageIsActive($nursePages));
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
    setcookie('privilege_level', '', time() - 7200, "/");
    setcookie('job', '', time() - 7200, "/");
}

//custom functions
function printArray($array){
    echo "<div><button class='copy-button' style='float:right' onclick=''>Copy</button><br><br>";
    echo "<pre>";
    print_r($array);
    echo "</pre>";
    echo "</div>";
    echo "<script>
            $('.copy-button').onclick(function(){
                
            });
          </script>";
}

function returnBlankIfNull($obj){
	if(isset($obj)){
		return $obj;
	}else{
		return "";
	}
}
function returnSpaceIfBlank($obj){
    if(returnBlankIfNull($obj) == ""){
        return '&nbsp;';
    }else{
        return $obj;
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

function returnFullNameFromObject($obj){
    return returnFullName($obj['first_name'], $obj['middle_name'], $obj['last_name']);
}

function returnFullDateStringWithDate($date){
    $newDate = date("F j, Y", strtotime($date));
    return $date != "0000-00-00 00:00:00" ? $newDate : "N/A";
}

function returnFullDateTimeStringWithDate($date){
    $newDate = date("F j, Y h:i A ", strtotime($date));
    return $date != "0000-00-00 00:00:00" ? $newDate : "N/A";
}

function response($errno, $description, $content = null){
	$response = array("response" => $errno);
	
	if($content != null){
		$response['content'] = $content;
	}

	if($description != null){
		$response['message'] = $description;
	}
	
	return $response;
}


//Image Handling methods
function saveFile($file, $targetFileName){
    $images_folder = UPLOADS_FOLDER;

    if (!file_exists($images_folder)) {
        mkdir($images_folder, 0777);
    } 

    return convertImage($file['name'], $file['tmp_name'], $images_folder.$targetFileName, 100);
}

function convertImage($originalImage, $tempImageLoc, $outputImage, $quality)
{
    // jpg, png, gif or bmp?
    $exploded = explode('.',$originalImage);
    $ext = $exploded[count($exploded) - 1]; 

    if (preg_match('/jpg|jpeg/i',$ext)){
        $imageTmp=imagecreatefromjpeg($tempImageLoc);
    }else if (preg_match('/png/i',$ext))
        $imageTmp=imagecreatefrompng($tempImageLoc);
    else if (preg_match('/gif/i',$ext))
        $imageTmp=imagecreatefromgif($tempImageLoc);
    else if (preg_match('/bmp/i',$ext))
        $imageTmp=imagecreatefrombmp($tempImageLoc);
    else
        return 0;

    // quality is a value from 0 (worst) to 100 (best)
    if(file_exists($outputImage))
        unlink($outputImage);
    
    imagejpeg($imageTmp, $outputImage, $quality);
    imagedestroy($imageTmp);

    return 1;
}

function saveFileFromData($data, $targetFileName){
    $images_folder = UPLOADS_FOLDER;

    if (!file_exists($images_folder)) {
        mkdir($images_folder, 0777);
    } 

    return convertImageFromData($data, $images_folder.$targetFileName, 100);
}

function convertImageFromData($data, $outputImage, $quality)
{
	list($type, $data) = explode(';', $data);
	list(, $data)      = explode(',', $data);
	$data = base64_decode($data);
		$imageTmp = imagecreatefromstring($data);
    // quality is a value from 0 (worst) to 100 (best)
    if(file_exists($outputImage))
        unlink($outputImage);
    
    imagejpeg($imageTmp, $outputImage, $quality);
    imagedestroy($imageTmp);

    return 1;
}

function friendly_url($url) {
    // everything to lower and no spaces begin or end
    $url = strtolower(trim($url));
 
    //replace accent characters, depends your language is needed
    //$url=replace_accents($url);
 
    // decode html maybe needed if there's html I normally don't use this
    //$url = html_entity_decode($url,ENT_QUOTES,'UTF8');
 
    // adding - for spaces and union characters
    $find = array(' ', '&', '\r\n', '\n', '+',',');
    $url = str_replace ($find, '-', $url);
 
    //delete and replace rest of special chars
    $find = array('/[^a-z0-9\-<>]/', '/[\-]+/', '/<[^>]*>/');
    $repl = array('', '-', '');
    $url = preg_replace ($find, $repl, $url);
 
    //return the friendly url
    return $url; 
}

function replace_accents($var){ //replace for accents catalan spanish and more
    $a = array('À', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Æ', 'Ç', 'È', 'É', 'Ê', 'Ë', 'Ì', 'Í', 'Î', 'Ï', 'Ð', 'Ñ', 'Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ø', 'Ù', 'Ú', 'Û', 'Ü', 'Ý', 'ß', 'à', 'á', 'â', 'ã', 'ä', 'å', 'æ', 'ç', 'è', 'é', 'ê', 'ë', 'ì', 'í', 'î', 'ï', 'ñ', 'ò', 'ó', 'ô', 'õ', 'ö', 'ø', 'ù', 'ú', 'û', 'ü', 'ý', 'ÿ', 'Ā', 'ā', 'Ă', 'ă', 'Ą', 'ą', 'Ć', 'ć', 'Ĉ', 'ĉ', 'Ċ', 'ċ', 'Č', 'č', 'Ď', 'ď', 'Đ', 'đ', 'Ē', 'ē', 'Ĕ', 'ĕ', 'Ė', 'ė', 'Ę', 'ę', 'Ě', 'ě', 'Ĝ', 'ĝ', 'Ğ', 'ğ', 'Ġ', 'ġ', 'Ģ', 'ģ', 'Ĥ', 'ĥ', 'Ħ', 'ħ', 'Ĩ', 'ĩ', 'Ī', 'ī', 'Ĭ', 'ĭ', 'Į', 'į', 'İ', 'ı', 'Ĳ', 'ĳ', 'Ĵ', 'ĵ', 'Ķ', 'ķ', 'Ĺ', 'ĺ', 'Ļ', 'ļ', 'Ľ', 'ľ', 'Ŀ', 'ŀ', 'Ł', 'ł', 'Ń', 'ń', 'Ņ', 'ņ', 'Ň', 'ň', 'ŉ', 'Ō', 'ō', 'Ŏ', 'ŏ', 'Ő', 'ő', 'Œ', 'œ', 'Ŕ', 'ŕ', 'Ŗ', 'ŗ', 'Ř', 'ř', 'Ś', 'ś', 'Ŝ', 'ŝ', 'Ş', 'ş', 'Š', 'š', 'Ţ', 'ţ', 'Ť', 'ť', 'Ŧ', 'ŧ', 'Ũ', 'ũ', 'Ū', 'ū', 'Ŭ', 'ŭ', 'Ů', 'ů', 'Ű', 'ű', 'Ų', 'ų', 'Ŵ', 'ŵ', 'Ŷ', 'ŷ', 'Ÿ', 'Ź', 'ź', 'Ż', 'ż', 'Ž', 'ž', 'ſ', 'ƒ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ǎ', 'ǎ', 'Ǐ', 'ǐ', 'Ǒ', 'ǒ', 'Ǔ', 'ǔ', 'Ǖ', 'ǖ', 'Ǘ', 'ǘ', 'Ǚ', 'ǚ', 'Ǜ', 'ǜ', 'Ǻ', 'ǻ', 'Ǽ', 'ǽ', 'Ǿ', 'ǿ'); 
    $b = array('A', 'A', 'A', 'A', 'A', 'A', 'AE', 'C', 'E', 'E', 'E', 'E', 'I', 'I', 'I', 'I', 'D', 'N', 'O', 'O', 'O', 'O', 'O', 'O', 'U', 'U', 'U', 'U', 'Y', 's', 'a', 'a', 'a', 'a', 'a', 'a', 'ae', 'c', 'e', 'e', 'e', 'e', 'i', 'i', 'i', 'i', 'n', 'o', 'o', 'o', 'o', 'o', 'o', 'u', 'u', 'u', 'u', 'y', 'y', 'A', 'a', 'A', 'a', 'A', 'a', 'C', 'c', 'C', 'c', 'C', 'c', 'C', 'c', 'D', 'd', 'D', 'd', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'G', 'g', 'G', 'g', 'G', 'g', 'G', 'g', 'H', 'h', 'H', 'h', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'IJ', 'ij', 'J', 'j', 'K', 'k', 'L', 'l', 'L', 'l', 'L', 'l', 'L', 'l', 'l', 'l', 'N', 'n', 'N', 'n', 'N', 'n', 'n', 'O', 'o', 'O', 'o', 'O', 'o', 'OE', 'oe', 'R', 'r', 'R', 'r', 'R', 'r', 'S', 's', 'S', 's', 'S', 's', 'S', 's', 'T', 't', 'T', 't', 'T', 't', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'W', 'w', 'Y', 'y', 'Y', 'Z', 'z', 'Z', 'z', 'Z', 'z', 's', 'f', 'O', 'o', 'U', 'u', 'A', 'a', 'I', 'i', 'O', 'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'A', 'a', 'AE', 'ae', 'O', 'o'); 
    $var= str_replace($a, $b,$var);
    return $var; 
}

function reArrayFiles(&$file_post) {

    $file_ary = array();
    $file_count = count($file_post['name']);
    $file_keys = array_keys($file_post);

    for ($i=0; $i<$file_count; $i++) {
        foreach ($file_keys as $key) {
            $file_ary[$i][$key] = $file_post[$key][$i];
        }
    }

    return $file_ary;
}


function showMessage($title, $message, $type = 0){
    $final_title = addslashes($title);
    $final_message = addslashes($message);
    if($type == 0){
        echo '<script>' . "showSuccessMessage('$final_title', '$final_message');" . '</script>';
    }else{
        echo '<script>' . "showErrorMessage('$final_title', '$final_message');" . '</script>';
    }
}

function createUniqueIDUsingID($id){
    return date("y") . "-" . str_pad($id, 5, "0", STR_PAD_LEFT);
}