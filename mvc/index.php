<?php 
	session_start();
	require_once './bootstrap.php';
	// https://laravel.com/docs/5.8/eloquent
	// https://laravel.com/docs/5.8/eloquent-relationships
	$url = isset($_GET['url']) == true ? $_GET['url'] : "/";
	// lấy ra url gốc của project
	function getUrl($path = ""){
		$currentUrlpath = $GLOBALS['url'];
		$absoluteUrl = strtok("http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]",'?');
		if($currentUrlpath != "/"){
			$absoluteUrl = str_replace("$currentUrlpath", "", $absoluteUrl);
		}
		return $path == "/" ? $absoluteUrl : $absoluteUrl.$path;
	}
	use Routes\CustomRoute;
	CustomRoute::init($url);
?>