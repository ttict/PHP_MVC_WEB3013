<?php 
	namespace Models;
	use Illuminate\Database\Eloquent\Model as Eloquent;
	use Models\Product;
	class Product extends Eloquent {
		protected $table = 'products';
		public static function uploadAvatar() {
			if (isset($_FILES['avatar'])) {
				if ($_FILES['avatar']['size'] > 0){
					$filename = 'public/' . uniqid() .'-'. $_FILES['avatar']['name'];
					move_uploaded_file($_FILES['avatar']['tmp_name'],  './'.$filename);
					$imgLink = getUrl($filename);
					return $imgLink;
				}
			}
		}
		public static function uploadImgs($lastProdID) {
			if (isset($_FILES['images'])) {
				for ($i = 0; $i < count($_FILES['images']['name']); $i++) { 
					if($_FILES['images']['size'][$i] > 0){
						$filename = 'public/' . uniqid() . '-' . $_FILES['images']['name'][$i];
						move_uploaded_file($_FILES['images']['tmp_name'][$i], $filename);
						$imgLink = getUrl($filename);
						$galleries = new ProductGalleries();
						$galleries->product_id = $lastProdID;
						$galleries->img_url = $imgLink;
						$galleries->save();
					}
				}
			}			
		}
	}
?>