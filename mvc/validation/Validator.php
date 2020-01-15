<?php
    namespace Validation;
    use Models\Product; 
    class Validator {
        private $_errors = [];
        public function validate($src, $rules = [] ){
            foreach($src as $item => $item_value) {
                if(key_exists($item, $rules)){
                    foreach($rules[$item] as $rule => $rule_value){
                        if(is_int($rule))
                           $rule = $rule_value;
                        switch ($rule) {
                            case 'required':
                            if(empty($item_value) && $rule_value){
                                $this->addError($item, ' Vui lòng không để trống');
                            }
                            break;

                            case 'minLen':
                            if(strlen($item_value) < $rule_value){
                                $this->addError($item, 'Phải có ít nhất '.$rule_value. ' ký tự');
                            }       
                            break;

                            case 'maxLen':
                            if(strlen($item_value) > $rule_value){
                                $this->addError($item, 'Không vượt quá '.$rule_value. ' ký tự');
                            }
                            break;

                            case 'numeric':
                            if(!ctype_digit($item_value) && $rule_value){
                                $this->addError($item, 'Chỉ cho phép ký tự số');
                            }
                            break;

                            case 'alpha':
                            if(!ctype_alpha($item_value) && $rule_value){
                                $this->addError($item, ucwords($item). ' should be alphabetic characters');
                            }
                            break;

                            case 'specialSymbol':
                            if (preg_match('/[!@#$%^&*()+=\-\[\]\';,.\/{}|":<>?~\\\\]/', $rule_value)) {
                                $this->addError($item, 'Tên sản phẩm không chứa ký tự đặc biệt! Chỉ cho phép a-z, A-Z, 0-9');
                            }
                            break;

                            case 'duplicateProductName':
                            $products = Product::all();
                            foreach ($products as $key => $p) {
                                if ($p->name == trim($rule_value)) {
                                    $this->addError($item,'Tên sản phẩm đã bị trùng. Vui lòng nhập lại');
                                }
                            }
                            break;

                            case 'duplicateProductNameID':
                            $products = Product::all();
                            foreach ($products as $key => $p) {
                                if ($p->id != $rule_value['id'] && $p->name == trim($rule_value['name'])) {
                                    $this->addError($item,'Tên sản phẩm đã bị trùng. Vui lòng nhập lại');
                                }
                            }
                            break;

                            case 'avatar':
                            if (isset($_FILES['avatar'])) {
                                if ($rule_value != '') {
                                    $supporttedFormats =  ['gif','png' ,'jpg', 'jpeg'];
                                    $fileNameUpload = $_FILES['avatar']['name'];
                                    $ext = pathinfo($fileNameUpload, PATHINFO_EXTENSION);
                                    if($_FILES['avatar']['size'] == 0 || !in_array($ext,$supporttedFormats) ) {
                                        $this->addError($item,'Vui lòng chọn ảnh và đúng định dạng file (gif, png, jpg, jpeg');
                                    }
                                }
                            }
                            break;

                            case 'images':
                            if (isset($_FILES['images'])) {
                                if ($rule_value != '') {
                                    for ($i=0; $i < count($_FILES['images']['name']); $i++) { 
                                        $supporttedFormats =  ['gif','png' ,'jpg', 'jpeg'];
                                        $fileNameUpload = $_FILES['images']['name'][$i];
                                        $ext = pathinfo($fileNameUpload, PATHINFO_EXTENSION);
                                        if($_FILES['images']['size'][$i] == 0 || !in_array($ext,$supporttedFormats)){
                                            $this->addError($item,'Vui lòng chọn ảnh và đúng định dạng file (gif, png, jpg, jpeg');
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }    
        }

        private function addError($item, $error){
            $this->_errors[$item][] = $error;
        }

        public function error(){
            if(empty($this->_errors)) return false;
            return $this->_errors;
        }
    }
?>