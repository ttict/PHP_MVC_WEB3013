<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title><?php echo $__env->yieldContent('title'); ?></title>
	<link href="<?php echo e(getUrl('views/admin/layouts/css/_all-skins.css')); ?>" rel="stylesheet">
	<link href="<?php echo e(getUrl('views/admin/layouts/css/AdminLTE.css')); ?>" rel="stylesheet">
	<link href="<?php echo e(getUrl('views/admin/layouts/css/bootstrap.min.css')); ?>" rel="stylesheet">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<?php echo $__env->yieldContent('page-style'); ?>
	<?php echo $__env->yieldContent('head-js-files'); ?>
	<?php echo $__env->yieldContent('head-js-script'); ?>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<?php echo $__env->yieldContent('top-body-js-files'); ?>
	<?php echo $__env->yieldContent('top-body-js-script'); ?>	
	<div class="wrapper">
		<?php echo $__env->make("admin.layouts.elements.sidebar", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
		<div class="content-wrapper">
			<section class="content">
				<?php echo $__env->yieldContent('content'); ?>
			</section>
		</div>
		<?php echo $__env->make("admin.layouts.elements.footer", \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
	</div>
	
</body>
	<?php echo $__env->yieldContent('bottom-body-js-files'); ?>
	<?php echo $__env->yieldContent('bottom-body-js-script'); ?>	  	
</html><?php /**PATH C:\xampp\htdocs\mvc\views/admin/layouts/master.blade.php ENDPATH**/ ?>