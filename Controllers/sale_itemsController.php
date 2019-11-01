<?php
class sale_itemsController extends Controller
{
  function create()
  {
    require(ROOT . 'Models/Sale_items.php');
    $sele_items = new SaleItems();
    $d = $sele_items->create($_POST["sale_id"], $_POST["product_id"] , $_POST["description"],$_POST["unid"] ,$_POST["qtd_unids"] ,$_POST["price_unit"] ,$_POST["total"], $_POST["tax"],$_POST["tax_total_item"]);
    echo json_encode($d);
  }
  
  function ajaxgetitemssale()
  {
    require(ROOT . 'Models/Sale_items.php');

    if (isset($_POST["sale_id"]))
    {
        $filter = $_POST["sale_id"];
    
        $sele_items = new SaleItems();

        $d = $sele_items->showAllSalesItens($filter);
      
        echo json_encode($d);
    }
  }

  function delete()
  {
      $id = $_POST["id"];
      require(ROOT . 'Models/Sale_items.php');
      $sele_items = new SaleItems();
      $d = $sele_items->delete($id);
      echo json_encode($d);
  }
}
?>