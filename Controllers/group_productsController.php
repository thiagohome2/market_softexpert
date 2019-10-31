<?php
class group_productsController extends Controller
{
    function index()
    {
        require(ROOT . 'Models/Gorup_products.php');  

        $groups = new GoupProducts();

        $d['groups'] = $groups->showAllGroupsProducts();
        $this->set($d);
        $this->render("index");
    }

    function create()
    {
        if ( isset($_POST["description"]) && isset($_POST["tax"]))
        {
            require(ROOT . 'Models/Gorup_products.php');  

            $group = new GoupProducts();
        
            if ($group->create( $_POST["description"], $_POST["tax"]))
            {
                header("Location: " . WEBROOT . "group_products/index");
            }
        }
        $this->render("create");
    }

    function edit($id)
    {
        require(ROOT . 'Models/Gorup_products.php');
        $group = new GoupProducts();
        $d['group'] = $group->showGroupProduct($id);

        if ( isset($_POST["description"]) || isset($_POST["tax"]))
        {
            if ($group->edit($id, $_POST["description"], $_POST["tax"]))
            {
                header("Location: " . WEBROOT . "group_products/index");
            }
        }
        $this->set($d);
        $this->render("edit");
    }

    function delete($id)
    {
        require(ROOT . 'Models/Gorup_products.php');
        $group = new GoupProducts();
        if ($group->delete($id))
        {
            header("Location: " . WEBROOT . "group_products/index");
        }
    }
}
?>