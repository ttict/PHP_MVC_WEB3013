<?php 
	namespace Models;
	use Illuminate\Database\Eloquent\Model as Eloquent;
	class ProductGalleries extends Eloquent {
		protected $table = 'product_galleries';
		public function NewProductGalleries () {
			if (isset($_FILES['productGalleries'])) {
				$productGalleries = $_FILES['productGalleries'];
				for ($i=0; $i < count($productGalleries['name']); $i++) { 
					if($productGalleries['size'][$i] > 0){
						$productGalleriesName = 'public/' . uniqid() . '-' . $productGalleries['name'][$i];
						move_uploaded_file($productGalleries['tmp_name'][$i], $productGalleriesName);
						$productGalleriesName = getUrl($productGalleriesName);

						$newProductGalleries = new ProductGalleries();
						$newProductGalleries->product_id = $product->id;
						$newProductGalleries->img_url = $productGalleriesName;
						$newProductGalleries->save();
					}
				}
			}
		}
	}
?>