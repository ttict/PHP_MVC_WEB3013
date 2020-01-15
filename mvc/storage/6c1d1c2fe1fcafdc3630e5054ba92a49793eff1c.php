<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<fieldset>
		<legend>Bộ lọc</legend>
		<form action="" method="get" >
			<select name="cate_id">
				<option value="">--- Tất cả ---</option>
				<?php $__currentLoopData = $cates; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $ca): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
					<option 
						value="<?php echo e($ca->id); ?>"
						<?php if($cate_id == $ca->id): ?>
							selected
						<?php endif; ?>
					><?php echo e($ca->cate_name); ?></option>
				<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
			</select>
			<input type="text" name="keyword" placeholder="tên sách" value="<?php echo e($keyword); ?>">
			<button type="submit">Search</button>
			<a href="<?php echo e(getUrl('product/add-new')); ?>"><i class="fa fa-plus" aria-hidden="true"></i></a>
		</form>
	</fieldset>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Image</th>
				<th>Price</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $el): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
			<tr>
				<td><?php echo e($el->id); ?></td>
				<td><?php echo e($el->name); ?></td>
				<td>
					<img src="<?php echo e($el->image); ?>" width="80">
				</td>
				<td><?php echo e($el->price); ?></td>
				<td>
					<a href="<?php echo e(getUrl('product/detail/' . $el->id )); ?>"><i class="fa fa-file-o" aria-hidden="true"></i></a>
					<a href="<?php echo e(getUrl('product/edit/' . $el->id )); ?>" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
					<a href="<?php echo e(getUrl('product/remove/' . $el->id )); ?>"><i class="fa fa-trash" aria-hidden="true"></i></a>

				</td>

			</tr>
			<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
		</tbody>
	</table>
	
</body>
</html><?php /**PATH C:\xampp\htdocs\mvc\views/homepage.blade.php ENDPATH**/ ?>