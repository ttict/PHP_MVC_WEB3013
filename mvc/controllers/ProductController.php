<?php 
	namespace Controllers;
	use Models\Product;
	use Models\Category;
	use Models\ProductGalleries;
	use Validation\Validator;

	class ProductController extends BaseController {
		function list() {
			$keyword = isset($_GET['keyword']) == true ? $_GET['keyword'] : null;
			$cate_id = isset($_GET['cate_id']) == true ? $_GET['cate_id'] : null;
			$query = Product::where('name', 'like', "%$keyword%");
			if($cate_id != null){
				$query->where('cate_id', $cate_id);
			}
			$products = $query->get();
			$categories = Category::all();
			return $this->render('admin.products.list', [	
				'keyword' => $keyword,
				'cate_id' => $cate_id,
				'products' => $products,
				'categories' => $categories
			]);
		}
		public function addForm(){
			$categories = Category::all();
			return $this->render('admin.products.add-form', ['categories' => $categories]);
		}
		public function saveAdd(){
			$product = new Product();
			$product->name = $_POST['name'];
			$product->image = Product::uploadAvatar();
			$product->cate_id = $_POST['cate_id'];
			$product->price = $_POST['price'];
			$product->short_desc = $_POST['short_desc'];
			$product->detail = $_POST['detail'];
			$data = [
						'name' => $product->name,
						'avatar' => $product->image,
						'price' => $product->price,
						'short_desc' => $product->short_desc,
						'detail' => $product->detail
					];
		
			$rules = [
				'name' => ['required', 'minLen' => 6,'maxLen' => 150, 'specialSymbol' => $product->name, 'duplicateProductName' => $product->name],
				'avatar' => ['avatar'],
				'price' => ['required', 'minLen' => 1, 'numeric'],
				'short_desc' => ['required', 'minLen' => 6,'maxLen' => 255],
				'detail' => ['required']
			];
			$validate = new Validator();
			$validate->validate($data, $rules);
			if($validate->error()){
				$categories = Category::all();
				return $this->render('admin.products.add-form', [
						'categories' => $categories,
						'validate' => $validate->error()
					]);
			} else {
				$product->save();
				$lastProdID = $product->id;
				if (isset($_FILES['images'])) {
					Product::uploadImgs($lastProdID);
				}
				header('location: ' . getUrl('admin/product/list'));
			}
			
		}

		public function editForm($id){
			$product = Product::find($id);
			$categories = Category::all();
			$productGalleries = ProductGalleries::where('product_id', '=', "$id")->get();
			return $this->render('admin.products.edit-form', 
				[
					'product' => $product,
					'categories' => $categories,
					'productGalleries' => $productGalleries
				]);
		}

		public function saveEdit($id){
			$product = Product::find($id);
			if (isset($_FILES['images'])) {
				Product::uploadImgs($id);
			}
			$oriImgLink = $product->image;
			$product->image = $oriImgLink;

			if (isset($_FILES['avatar'])) {
				$avatar = $_FILES['avatar'];
				if ($avatar['size'] > 0){
					$filename = 'public/' . uniqid() .'-'. $avatar['name'];
					move_uploaded_file($avatar['tmp_name'],  './'.$filename);
					$imgLink = getUrl($filename);
					$product->image = $imgLink;
				}
			}

			if (isset($_POST['delImg'])) {
				ProductGalleries::destroy($_POST['delImg']);
			}

			$product->name = $_POST['name'];
			$product->cate_id = $_POST['cate_id'];
			$product->price = $_POST['price'];
			$product->short_desc = $_POST['short_desc'];
			$product->detail = $_POST['detail'];

			$productID = $product->id;
			$productName = $product->name;
			$data = [
						'name' => $product->name,
						'avatar' => $product->image,
						'price' => $product->price,
						'short_desc' => $product->short_desc,
						'detail' => $product->detail
					];

			$rules = [
				'name' => ['required', 'minLen' => 6,'maxLen' => 150, 'specialSymbol' => $product->name, 'duplicateProductNameID' => ['id' => $productID, 'name' => $productName]],
				'price' => ['required', 'minLen' => 1, 'numeric'],
				'short_desc' => ['required', 'minLen' => 6,'maxLen' => 255],
				'detail' => ['required']
			];
			$validate = new Validator();
			$validate->validate($data, $rules);
			if ($validate->error()){
				$product = Product::find($id);
				$categories = Category::all();
				$productGalleries = ProductGalleries::where('product_id', '=', "$id")->get();
				return $this->render('admin.products.edit-form',
					[
						'product' => $product,
						'categories' => $categories,
						'productGalleries' => $productGalleries,
						'validate' => $validate->error()
					]);
			}
			$product->save();
			header('location: ' . getUrl('admin/product/list'));
		}

		public function remove($id){
			$productGalleries = ProductGalleries::where('product_id', '=', $id)->get();
			foreach ($productGalleries as $key => $value) {
				ProductGalleries::destroy($value->id);
			}
			Product::destroy($id);
			header('location: ' . getUrl('admin/product/list'));
		}

		public function deleteCheckbox(){
			$getCheckbox = $_POST['checkbox'];
			Product::destroy($getCheckbox);
			header('location: ' . getUrl('admin/product/list'));
		}
	}
?>