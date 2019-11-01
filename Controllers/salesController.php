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

    require(ROOT . 'Models/Sales.php');
      
    $sale = new sales();
      
    $d['sale'] = $sale->create("Não Informado");
    
    $this->set($d);
    $this->render("create");
  }

  function ajax_edit_view_create()
  {
      require(ROOT . 'Models/Sales.php');

      $sele = new Sales();
      
      $return = $sele->edit($_POST["id"], $_POST["client"], $_POST["total"], $_POST["tax_total"], $_POST["qtd_items"]);
      
      return $return;
  }

  function edit($id)
  {
      require(ROOT . 'Models/Sales.php');

      $sele = new Sales();
      
      $d['sale'] = $sele->showSale($id);

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
      require(ROOT . 'Models/Sale_items.php');

      $sele_itens = new SaleItems();
      $sele_itens->deleteAllSele($id);

      $sele = new Sales();
      $sele->delete($id);
      
      header("Location: " . WEBROOT . "sales/index");
  }
}
?>