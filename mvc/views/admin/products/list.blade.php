@extends('admin.layouts.master')

@section('title')
	Danh sách sản phẩm
@endsection

@section('page-style')
	<style type="text/css">
		.products-list-td:nth-child(4){
			text-align: left;
		}
		th, table tbody tr td.products-list-td{
			vertical-align: middle;
			text-align: center;
			overflow: hidden;
		}
		.table > thead > tr > th {
			vertical-align: middle;
		}
		.avatar{
			text-align: center;
		}
		td .img-square{
			width: 50px;
			height: 50px;
			overflow: hidden;
			object-fit: cover;
		}
	</style>
@endsection

@section('head-js-files')
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
@endsection

@section('content')
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body">
					<form name="deleteCheckboxRequest" action="{{getUrl('admin/product/deleteCheckbox')}}" method="post" enctype="multipart/form-data">
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
										<a href="{{getUrl('admin/product/add-new')}}" class="btn btn-xs btn-primary"><i class="fa fa-plus" aria-hidden="true"></i></a>
									</th>
								</tr>
							</thead>
							<tbody>
								@foreach($products as $key => $p)
								<tr>
									<td class="products-list-td avatar"><input type="checkbox" name="checkbox[]" class="child" value="{{ $p->id }}"></td>
									<td class="products-list-td">{{ $p->id }}</td>
									<td class="products-list-td">{{ $p->name }}</td>
									<td class="products-list-td">
										<img class="img-square" src="{{ $p->image }}" height="50">
									</td>
									<td class="products-list-td">							@foreach ($categories as $key => $c)
											@if ($p->cate_id == $c->id)
												{{ $c->cate_name }}
											@endif
										@endforeach
									 </td>
									<td class="products-list-td">{{ number_format($p->price) }}</td>
									<td class="products-list-td">{{ $p->short_desc }}</td>
									<td class="products-list-td">{{ $p->detail }}</td>
									<td class="products-list-td">{{ $p->star }}</td>
									<td class="products-list-td">{{ $p->views }}</td>
									<td class="products-list-td">
										<a href="{{getUrl('admin/product/edit/' . $p->id)}}" class="btn btn-xs btn-info"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
										<a href="javascript:;" url="{{getUrl('admin/product/remove/' . $p->id)}}" class="btn btn-remove btn-xs btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
									</td>
								</tr>
								@endforeach
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
										<a href="{{getUrl('admin/product/add-new')}}" class="btn btn-xs btn-primary"><i class="fa fa-plus" aria-hidden="true"></i></a>
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

@section('bottom-body-js-files')
	<script src="{{getUrl('views/admin/layouts/js/jquery.min.js')}}"></script>
	<script src="{{getUrl('views/admin/layouts/js/adminlte.min.js')}}"></script>
	<script src="{{getUrl('views/admin/layouts/js/bootstrap.min.js')}}"></script>
	<script src="{{getUrl('views/admin/layouts/js/sweetalert.min.js')}}"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
@stop

@section('bottom-body-js-script')
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

		$(function() {
			$(".child").click(function(){
				$('.deleteCheckbox').prop('disabled',$('input.checkbox:checked').length == 1);
			});
		});
	</script>
@stop
@endsection
