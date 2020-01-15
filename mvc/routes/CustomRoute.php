<?php 
	namespace Routes;
	use \Phroute\Phroute\RouteCollector;
	use \Phroute\Phroute\Dispatcher;
	class CustomRoute {
		public static function init($url){
			$router = new RouteCollector();
			$router->get('/', ["Controllers\HomeController", "index"]);
			$router->get('/admin/product/list', ["Controllers\ProductController", "list"]);
			$router->get('/admin/product/add-new', ["Controllers\ProductController", "addForm"]);
			$router->post('/admin/product/add-new', ["Controllers\ProductController", "saveAdd"]);
			$router->get('/admin/product/edit/{id}', ["Controllers\ProductController", "editForm"]);
			$router->post('/admin/product/edit/{id}', ["Controllers\ProductController", "saveEdit"]);
			$router->get('/admin/product/remove/{id}', ["Controllers\ProductController", "remove"]);
			$router->post('/admin/product/deleteCheckbox', ["Controllers\ProductController", "deleteCheckbox"]);

			$dispatcher = new \Phroute\Phroute\Dispatcher($router->getData());
			$response = $dispatcher->dispatch($_SERVER['REQUEST_METHOD'], parse_url($url, PHP_URL_PATH));
			echo $response;
		}
	}
?>