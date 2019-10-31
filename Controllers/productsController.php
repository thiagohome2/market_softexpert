<?php
class productsController extends Controller
{
    function index()
    {
        require(ROOT . 'Models/Products.php');

        if (isset($_POST["filter"]))
        {
            $filter = $_POST["filter"];
        }else{
            $filter = "";
        }    

        $products = new Products();

        $d['products'] = $products->showAllProducts($filter);
        $this->set($d);
        $this->render("index");
    }

    function create()
    {
        if (isset($_POST["group_product_id"]) || isset($_POST["description"]) || isset($_POST["price"])|| isset($_POST["unid"]))
        {
            
            $price = str_replace(',', '.',floatval($_POST["price"]));
           
            require(ROOT . 'Models/Products.php');
            
            $product = new Products();
        
            if ($product->create($_POST["group_product_id"], $_POST["description"], $price, $_POST["unid"]))
            {
                header("Location: " . WEBROOT . "products/index");
            }
        }

        require(ROOT . 'Models/Gorup_products.php');

        $groups = new GoupProducts();

        $d['groups'] = $groups->showAllGroupsProducts();

        $this->set($d);
        $this->render("create");
    }

    function edit($id)
    {
        require(ROOT . 'Models/Products.php');

        $product = new Products();
        
        $d['product'] = $product->showProduct($id);

        if (isset($_POST["group_product_id"]) || isset($_POST["description"]) || isset($_POST["price"]))
        {
            if ($product->edit($id, $_POST["group_product_id"], $_POST["description"], $_POST["price"], $_POST["unid"]))
            {
                header("Location: " . WEBROOT . "products/index");
            }
        }
        require(ROOT . 'Models/Gorup_products.php');

        $groups = new GoupProducts();

        $d['groups'] = $groups->showAllGroupsProducts();

        $this->set($d);
        $this->render("edit");
    }

    function delete($id)
    {
        require(ROOT . 'Models/Products.php');

        $product = new Products();
        if ($product->delete($id))
        {
            header("Location: " . WEBROOT . "products/index");
        }
    }
}
?>