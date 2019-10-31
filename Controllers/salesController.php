<?php
class salesController extends Controller
{
  function index()
  {
      require(ROOT . 'Models/Sales.php');

      if (isset($_POST["filter"]))
      {
          $filter = $_POST["filter"];
      }else{
          $filter = "";
      }    

      $sales = new Sales();

      $d['sales'] = $sales->showAllSeles($filter);
      $this->set($d);
      $this->render("index");
  }

  function create()
  {
    if(isset($_POST["client"]))
    {
      require(ROOT . 'Models/Sales.php');
      
      $product = new sales();
  
      if ($product->create($_POST["client"]))
      {
          header("Location: " . WEBROOT . "sales/index");
      }
    }    
    $this->render("create");
  }

  function edit($id)
  {
      require(ROOT . 'Models/Sales.php');

      $sele = new Sales();
      
      $d['sele'] = $sele->showSale($id);

      if (isset($_POST["client"]) || isset($_POST["total"]) || $_POST["tax_total"] ||  isset($_POST["qtd_itens"]))
      {
          if ($sele->edit($id, $_POST["client"], $_POST["total"], $_POST["tax_total"], $_POST["qtd_itens"]))
          {
              header("Location: " . WEBROOT . "sales/index");
          }
      }

      $this->set($d);
      $this->render("edit");
  }

  function delete($id)
  {
      require(ROOT . 'Models/Sales.php');
      require(ROOT . 'Models/Sales_items.php');

      $sele = new Sales();
      $sele_itens = new Sales_items();
      if ($sele->delete($id))
      {
        if($sele_itens->deleteAllSele($id)){
          header("Location: " . WEBROOT . "sales/index");
        }
      }
  }
}
?>