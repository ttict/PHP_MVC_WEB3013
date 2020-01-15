<?php 
	namespace Controllers;
	use Jenssegers\Blade\Blade;
	class BaseController
	{
		protected function render($view, $var = [])
		{
			$blade = new Blade('views', 'storage');
			echo $blade->make($view, $var);
		}
	}
?>