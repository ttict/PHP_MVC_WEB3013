<?php 
	use Models\Product;
	use Models\Category;
	use Models\ProductGalleries;
	$categories = Category::all(); 
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Thêm sản phẩm</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="//cdn.ckeditor.com/4.11.3/standard/ckeditor.js"></script>
	<style type="text/css">
		.avatar {
			height: 100px;
			width: 100px;
			float: left;
			object-fit: cover;
			margin: 0 20px 15px 0;
		}
		.avatar img{
			width: 100%;
			height: 100%;
		}
		.box-image-input {
			margin: 10px 0;
		}
		.clear {
			clear: both;
		}
	</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<script type="text/javascript">
		$(document).ready(function() {
			var max_fields = 6;
			var wrapper = $(".input_fields_wrap");
			var add_button = $(".add_field_button");
			var x = 1; 
			$(add_button).click(function(e){ 
				e.preventDefault();
				if(x < max_fields){
					x++;
					$(wrapper).append('<div class="box-image-input"><input class="image-input" type="file" name="galleries[]" style="float:left; margin-right:5px;"><a href="#" class="remove_field"><i class="fa fa-trash-o" aria-hidden="true"></i></a></div>');
				}
			});

			$(wrapper).on("click",".remove_field", function(e){
				e.preventDefault(); $(this).parent('div').remove(); x--;
			})
		});
	</script>
	<form action="" method="post" enctype="multipart/form-data">
		<div>
			<label for="name">Tên sản phẩm</label>
			<input id="name" type="text" name="name" placeholder="Nhập tên sản phẩm..." value="<?php echo e($product->name); ?>">
		</div>
		<div>
			<label for="feature_image">Ảnh đại diện</label>
			<div class="clear"></div>
			<div class="avatar">
				<img src="<?php echo e($product->image); ?>" alt="" class="img-responsive">
			</div>
			<div class="clear"></div>
			<input id="feature_image" type="file" name="feature_image">
		</div>
		<div>
			<label for="">Ảnh sản phẩm</label>
			<div class="input_fields_wrap">
				<button class="add_field_button"><i class="fa fa-plus" aria-hidden="true"></i></button>
				<div class="clear"></div>
			</div>
		</div>
		<div>
			<label for="short_desc">Mô tả ngắn</label>
			<div class="clear"></div>
			<textarea id="short_desc" name="short_desc" rows="3" maxlength="255" placeholder="Hãy nhập nội dung mô tả cho sản phẩm..." style="width: 100%"><?php echo e($product->short_desc); ?></textarea>
		</div>
		<div>
			<label for="detail">Chi tiết sản phẩm</label>
			<textarea id="detail" name="detail" rows="10"><?php echo e($product->detail); ?></textarea>
			<script>
				CKEDITOR.replace('detail');
			</script>
		</div>
		<div>
			<label for="price">Giá</label>
			<input id="price" type="number" name="price" placeholder="Giá sản phẩm" value="<?php echo e($product->price); ?>">
		</div>
		<div>
			<label for="cate_id">Danh mục</label>
			<select id="cate_id" name="cate_id">
				<?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
					<option <?php echo e(($product->cate_id == $value->id) ? ' selected=selected ' : ''); ?> value="<?php echo e($value->id); ?>"><?php echo e($value->id . '. ' . $value->cate_name); ?></option>
				<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
			</select>
		</div>
		<div>
			<button type="submit">Lưu</button>
			<a href="<?php echo e(getUrl('/')); ?>">Hủy</a>
		</div>
	</form>
</body>
</html><?php /**PATH C:\xampp\htdocs\mvc\views/product/edit-form.blade.php ENDPATH**/ ?>