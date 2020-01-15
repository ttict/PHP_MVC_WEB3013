<?php $__env->startSection('content'); ?>
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body">
					<form name="deleteCheckboxRequest" action="<?= 'deleteCheckbox.php'?>" method="post" enctype="multipart/form-data">
						<table id="mydata" class="table table-bordered table-striped table-responsive">
							<thead>
								<tr>
									<th></th>
									<th>ID</th>
									<th>Tên sản phẩm</th>
									<th>Ảnh</th>
									<th>Danh mục</th>
									<th>Giá</th>
									<th>Mô tả</th>
									<th>Chi tiết</th>
									<th>Đánh giá</th>
									<th>Lượt xem</th>
									<th>
										<a href="add-new" class="btn btn-xs btn-primary"><i class="fa fa-plus" aria-hidden="true"></i></a>
									</th>
								</tr>
							</thead>
							<tbody>
								<?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
								<tr>
									<td class="products-list-td avatar"><input type="checkbox" name="checkbox[]" class="child" value="<?php echo e($value->id); ?>"></td>
									<td class="products-list-td"><?php echo e($value->id); ?></td>
									<td class="products-list-td"><?php echo e($value->name); ?></td>
									<td class="products-list-td">
										<img class="img-square" src="<?php echo e($value->image); ?>" height="50">
									</td>
									<td class="products-list-td">							<?php $__currentLoopData = $cates; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $cate): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
											<?php if($value->cate_id == $cate->id): ?>
												<?php echo e($cate->cate_name); ?>

											<?php endif; ?>
										<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
									 </td>
									<td class="products-list-td"><?php echo e(number_format($value->price)); ?></td>
									<td class="products-list-td"><?php echo e($value->short_desc); ?></td>
									<td class="products-list-td"><?php echo e($value->detail); ?></td>
									<td class="products-list-td"><?php echo e($value->star); ?></td>
									<td class="products-list-td"><?php echo e($value->views); ?></td>
									<td class="products-list-td">
										<a href="<?= 'edit.php?id=' . $p['id']?>" class="btn btn-xs btn-info"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
										<a href="javascript:;" url="<?= 'remove.php?id=' . $p['id'] ?>" class="btn btn-remove btn-xs btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
									</td>
								</tr>
								<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
							</tbody>
							<tfoot>
								<tr>
									<th></th>
									<th>ID</th>
									<th>Tên sản phẩm</th>
									<th>Ảnh</th>
									<th>Danh mục</th>
									<th>Giá</th>
									<th>Mô tả</th>
									<th>Chi tiết</th>
									<th>Đánh giá</th>
									<th>Lượt xem</th>
									<th>
										<a href="add-new" class="btn btn-xs btn-primary"><i class="fa fa-plus" aria-hidden="true"></i></a>
									</th>
								</tr>
							</tfoot>
						</table>
						<a href="javascript:;" class="btn btn-remove btn-xs btn-danger deleteCheckbox"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete Selected</a>
						<!-- <button type="submit" class="btn btn-danger">Delete Selected</button> -->
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<?php $__env->startSection('page-js-files'); ?>
	<script src="views/admin/layouts/js/jquery.min.js"></script>
	<script src="views/admin/layouts/js/adminlte.min.js"></script>
	<script src="views/admin/layouts/js/bootstrap.min.js"></script>
	<script src="views/admin/layouts/js/sweetalert.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('page-js-files'); ?>
	<script type="text/javascript">
		// DataTable
		$(document).ready( function () {
			$('#mydata').DataTable();
		} );

		$('.btn-remove').click(function(){
			var hrefUrl = $(this).attr('url');
			swal({
				title: "Thông báo!",
				text: "Bạn có chắc chắn muốn xóa sản phẩm này?",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			}).then(function(willDelete){
				if(willDelete === true){
					window.location.href = hrefUrl;
				}
			});
		});

		$('.deleteCheckbox').click(function(){
			swal({
				title: "Thông báo!",
				text: "Bạn có chắc chắn muốn xóa các sản phẩm này?",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			}).then(function(willDelete){
				if(willDelete === true){
					document.deleteCheckboxRequest.submit();
				}
			});
		});
	</script>
<?php $__env->stopSection(); ?>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('admin.layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\mvc\views/admin/layouts/homepage.blade.php ENDPATH**/ ?>