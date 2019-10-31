<?php
class Database{
  private static $bdd = null;
  private function __construct(){

  }
  public static function getBdd(){
    if(is_null(self::$bdd)){
      self::$bdd = new PDO("pgsql:host=localhost;port=5432;dbname=market_softexpert", 'postgres', 'root');
    }
    return self::$bdd;
  }
}
?>