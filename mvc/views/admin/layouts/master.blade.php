<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>@yield('title')</title>
	<link href="{{getUrl('views/admin/layouts/css/_all-skins.css')}}" rel="stylesheet">
	<link href="{{getUrl('views/admin/layouts/css/AdminLTE.css')}}" rel="stylesheet">
	<link href="{{getUrl('views/admin/layouts/css/bootstrap.min.css')}}" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	@yield('page-style')
	@yield('head-js-files')
	@yield('head-js-script')
</head>
<body class="hold-transition skin-blue sidebar-mini">
	@yield('top-body-js-files')
	@yield('top-body-js-script')	
	<div class="wrapper">
		@include("admin.layouts.elements.sidebar")
		<div class="content-wrapper">
			<section class="content">
				@yield('content')
			</section>
		</div>
		@include("admin.layouts.elements.footer")
	</div>
	
</body>
	@yield('bottom-body-js-files')
	@yield('bottom-body-js-script')	  	
</html>