<?php 
	require_once './vendor/autoload.php';
	use Illuminate\Database\Capsule\Manager as Capsule;
	$capsule = new Capsule;
	$capsule->addConnection([
		'driver'    => 'mysql',
		'host'      => '127.0.0.1',
		'database'  => 'kaopiz',
		'username'  => 'root',
		'password'  => '',
		'charset'   => 'utf8',
		'collation' => 'utf8_unicode_ci',
		'prefix'    => '',
	]);
	use Illuminate\Events\Dispatcher;
	use Illuminate\Container\Container;
	$capsule->setEventDispatcher(new Dispatcher(new Container));
	$capsule->setAsGlobal();
	$capsule->bootEloquent();
?>