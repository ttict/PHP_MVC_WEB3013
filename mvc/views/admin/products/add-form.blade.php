@extends('admin.layouts.master')

@section('title')
	Thêm mới sản phẩm
@endsection

@section('head-js-files')
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//cdn.ckeditor.com/4.11.3/standard/ckeditor.js"></script>
@endsection

@section('head-js-script')
	<script type="text/javascript">
		function ChangeToSlug()	{
			var productName, slug;
			//Lấy text từ thẻ input title 
			productName = document.getElementById("productName").value;

			//Đổi chữ hoa thành chữ thường
			slug = productName.toLowerCase();

			//Đổi ký tự có dấu thành không dấu
			slug = slug.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
			slug = slug.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
			slug = slug.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
			slug = slug.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
			slug = slug.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
			slug = slug.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
			slug = slug.replace(/đ/gi, 'd');
			//Xóa các ký tự đặt biệt
			slug = slug.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '');
			//Đổi khoảng trắng thành ký tự gạch ngang
			slug = slug.replace(/ /gi, "-");
			//Đổi nhiều ký tự gạch ngang liên tiếp thành 1 ký tự gạch ngang
			//Phòng trường hợp người nhập vào quá nhiều ký tự trắng
			slug = slug.replace(/\-\-\-\-\-/gi, '-');
			slug = slug.replace(/\-\-\-\-/gi, '-');
			slug = slug.replace(/\-\-\-/gi, '-');
			slug = slug.replace(/\-\-/gi, '-');
			//Xóa các ký tự gạch ngang ở đầu và cuối
			slug = '@' + slug + '@';
			slug = slug.replace(/\@\-|\-\@|\@/gi, '');
			//In slug ra textbox có id “slug”
			document.getElementById('slug').value = slug;
		}
	</script>
@endsection

@section('top-body-js-script')
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
					$(wrapper).append('<div class="box-image-input"><input class="image-input" type="file" name="images[]" style="float:left; margin-right:5px;"><a href="#" class="remove_field"><i class="fa fa-trash-o" aria-hidden="true"></i></a></div><div style="clear: both;"></div>');
				}
			});

			$(wrapper).on("click",".remove_field", function(e){
				e.preventDefault(); $(this).parent('div').remove(); x--;
			})
		});
	</script>
@endsection

@section('content')
	<section class="content-header">
		<h1><i class="fa fa-list-alt"></i>
			Thêm sản phẩm
		</h1>
		<ol class="breadcrumb">
			<li><a href="{{ getUrl('admin/product/list')}}"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
			<li class="active">Thêm sản phẩm</li>
		</ol>
	</section>
	<section class="content">
		<div class="box row">
			<div class="col-md-12">
				<form action="" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="name">Tên sản phẩm</label>
						<input id="name" type="text" name="name" placeholder="Nhập tên sản phẩm..." class="form-control" onkeyup="ChangeToSlug();">
						<div class="form-group">
							@isset ($validate['name'])
								@foreach ($validate['name'] as $key => $err)
									<span class="text-danger">{{ $err }}</span>
									<br>
								@endforeach
							@endisset
						</div>
					</div>
					<div class="form-group">
						<label for="avatar">Ảnh đại diện</label>
						<input id="avatar" type="file" name="avatar">
						<div class="form-group">
							@isset ($validate['avatar'])
								@foreach ($validate['avatar'] as $key => $err)
									<span class="text-danger">{{ $err }}</span>
									<br>
								@endforeach
							@endisset
						</div>
					</div>
					<div class="form-group">
						<label for="">Ảnh sản phẩm</label>
						<div class="input_fields_wrap">
							<button class="add_field_button"><i class="fa fa-plus" aria-hidden="true"></i></button>
							<div style="clear: both;"></div>
						</div>
					</div>
					<div class="form-group">
						<label for="short_desc">Mô tả ngắn</label>
						<textarea class="form-control" id="short_desc" name="short_desc" rows="3" maxlength="255" placeholder="Hãy nhập nội dung mô tả cho sản phẩm..."></textarea>
						<div class="form-group">
							@isset ($validate['short_desc'])
								@foreach ($validate['short_desc'] as $key => $err)
									<span class="text-danger">{{ $err }}</span>
									<br>
								@endforeach
							@endisset
						</div>
					</div>
					<div class="form-group">
						<label for="detail">Chi tiết sản phẩm</label>
						<textarea id="detail" name="detail" rows="10" class="form-control"></textarea>
						@section('page-js-files')
							<script>
								CKEDITOR.replace('detail');
							</script>
						@stop
						<div class="form-group">
							@isset ($validate['detail'])
								@foreach ($validate['detail'] as $key => $err)
									<span class="text-danger">{{ $err }}</span>
									<br>
								@endforeach
							@endisset
						</div>
					</div>
					<div class="form-group">
						<label for="price">Giá</label>
						<input id="price" type="number" name="price" class="form-control">
						<div class="form-group">
							@isset ($validate['price'])
								@foreach ($validate['price'] as $key => $err)
									<span class="text-danger">{{ $err }}</span>
									<br>
								@endforeach
							@endisset
						</div>
					</div>
					<div class="form-group">
						<label for="cate_id">Danh mục</label>
						<select id="cate_id" class="form-control" name="cate_id">
							@foreach ($categories as $key => $c)
								<option value="{{$c->id}}">
									{{$c->id . '. ' . $c->cate_name}}
								</option>
							@endforeach
						</select>
					</div>
					<div class="text-center" style="padding-bottom: 15px;">
						<button type="submit" class="btn btn-sm btn-primary">Lưu</button>
						<a href="{{getUrl('admin/product/list')}}" class="btn btn-sm btn-danger">Hủy</a>
					</div>
				</form>
			</div>
		</div>
	</section>
@endsection	