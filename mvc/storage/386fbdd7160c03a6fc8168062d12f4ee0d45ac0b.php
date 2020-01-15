<?php $__env->startSection('title'); ?>
	Đăng ký
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
	<section class="content">
		<div class="box row">
			<div class="col-md-4">
				<form action="signup" method="post">
					<h3>ĐĂNG KÝ</h3>
					<div class="form-group">
						<label for="name">Tên đăng ký</label>
						<input id="name" type="text" name="name" class="form-control form-control-lg">
					</div>
					<div class="form-group">
						<label for="email">Email</label>
						<input id="email" type="email" name="email" class="form-control form-control-lg">
					</div>
					<div class="form-group">
						<label for="password">Mật khẩu</label>
						<input id="password" type="password" name="password" class="form-control form-control-lg">
					</div>
					<div class="form-group">
						<label for="passwordConf">Xác nhận mật khẩu</label>
						<input id="passwordConf" type="password" name="passwordConf" class="form-control form-control-lg">
					</div>
					<div class="form-group">
						<button type="submit" name="signup-btn" class="btn btn-primary btn-block btn-lg">Đăng ký</button>
					</div>
					<p class="text-center">Đã có tài khoản? <a href="login">Đăng nhập</a></p>

				</form>
			</div>
		</div>
	</section>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\mvc\views/signup.blade.php ENDPATH**/ ?>