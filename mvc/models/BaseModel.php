<?php 
	namespace Models;
	// use Illuminate\Database\Eloquent\Model;
	use \PDO;
	class BaseModel {
		function __construct() {
			$this->conn = new PDO('mysql:host=127.0.0.1;dbname=kaopiz;charset=utf8', 'root', '');
		}
		public function insert($arr) {
			$this->queryBuilder = "insert into $this->tableName ";
			$cols = " (";
			$vals = " (";
			foreach ($arr as $key => $value) {
				$cols .= " $key,";
				$vals .= " :$key,";
			}
			$cols = rtrim($cols, ',');
			$vals = rtrim($vals, ',');
			$cols .= ") ";
			$vals .= ") ";
			$this->queryBuilder .= $cols . ' values ' . $vals;
			$stmt = $this->conn
			->prepare($this->queryBuilder);
			foreach ($arr as $key => &$value) {
				$stmt->bindParam(":$key", $value);
			}
			$stmt->execute();
		}
		public function update($arr) {
			$this->queryBuilder = "update $this->tableName set ";
			foreach ($arr as $key => $value) {
				$this->queryBuilder .= " $key = :$key,";
			}
			$this->queryBuilder = rtrim($this->queryBuilder, ',');
			$this->queryBuilder .= " where id = :id";
			$stmt = $this->conn
			->prepare($this->queryBuilder);
			foreach ($arr as $key => &$value) {
				$stmt->bindParam(":$key", $value);
			}
			$stmt->bindParam(":id", $this->id);
			$stmt->execute();
		}
		public static function rawQuery($sqlQuery) {
			$model = new static();
			$model->queryBuilder = $sqlQuery;
			return $model;
		}
		public function execute() {
			$stmt = $this->conn->prepare($this->queryBuilder);
			return $stmt->execute();
		}
		public static function all() {
			$model = new static();
			$query = "select * from $model->tableName";
			$stmt = $model->conn->prepare($query);
			$stmt->execute();
			return $stmt->fetchAll(PDO::FETCH_CLASS, get_class($model));
		}
		public static function where($arr) {
			$model = new static();
			$model->queryBuilder = "select * from $model->tableName where $arr[0] $arr[1] '$arr[2]'";
			return $model;
		}
		public function andWhere($arr) {
			$this->queryBuilder .= " and $arr[0] $arr[1] '$arr[2]'";
			return $this;
		}
		public function orWhere($arr) {
			$this->queryBuilder .= " or $arr[0] $arr[1] '$arr[2]'";
			return $this;
		}
		public function first() {
			$stmt = $this->conn->prepare($this->queryBuilder);
			$stmt->execute();
			$result = $stmt->fetchAll(PDO::FETCH_CLASS, get_class($this));
			if(count($result) > 0){
				return $result[0];
			} 
			else {
				return null;
			}
		}
		public function get() {
			$stmt = $this->conn->prepare($this->queryBuilder);
			$stmt->execute();
			$result = $stmt->fetchAll(PDO::FETCH_CLASS, get_class($this));
			return $result;
		}
	}
?>