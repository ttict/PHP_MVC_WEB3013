<?php $__env->startSection('title'); ?>
	Trang chủ
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
	<section class="content">
		<div class="box row">
			<div class="col-md-4 offset-md-4 form-div login">
				<div class="alert alert-success">
					Bạn đã đăng nhập thành công!
				</div>
				<h3>Xin chào, TT</h3>
				<a href="#" class="logout">Đăng xuất</a>
				<div class="alert alert-success">
					Bạn cần xác nhận tài khoản.
					Đăng nhập email của bạn và click vào liên kết xác nhận chúng tôi đã gửi
					<strong>TT@gmail.com</strong>
				</div>
				<button class="btn btn-block btn-lg btn-primary">Tôi đã xác nhận</button>
			</div>
		</div>
	</section>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\mvc\views/index.blade.php ENDPATH**/ ?>