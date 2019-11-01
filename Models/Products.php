<?php
class Products extends Model
{
    public function create($group_product_id, $description, $price ,$unid )
    {
        $sql = "INSERT INTO products (group_product_id, description, price, unid, created_at, updated_at) VALUES (:group_product_id, :description, :price, :unid, :created_at, :updated_at)";
        
        $req = Database::getBdd()->prepare($sql);
        
        return $req->execute([
            'group_product_id' => $group_product_id,
            'description' => $description,
            'price' => $price,
            'unid' => $unid,
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ]);
    }

    public function showProduct($id)
    {
        $sql = "SELECT * FROM products WHERE id =" . $id;
        $req = Database::getBdd()->prepare($sql);
        $req->execute();
        return $req->fetch();
    }

    public function showAllProducts($filter)
    {
        $sql_filter = "";

        if($filter != "" )
        {
            //$sql_filter = "WHERE a.description LIKE '%" . $filter. "%' OR a.id IN ('".$filter."')";
            $sql_filter = "WHERE  a.id IN ('".$filter."')";
        }

        $sql = "SELECT 
        a.id as id_product, 
        a.description as desc_product, 
        a.price,
        a.unid,
        b.description as desc_group, 
        b.id as id_group,
        b.tax
        FROM products AS a 
        LEFT JOIN group_products AS b ON a.group_product_id = b.id " . $sql_filter;
        $req = Database::getBdd()->prepare($sql);
        $req->execute();
        return $req->fetchAll();
    }

    public function edit($id, $group_product_id, $description, $price ,$unid)
    {
        $sql = "UPDATE products SET group_product_id = :group_product_id, description = :description , price = :price, unid = :unid, updated_at = :updated_at WHERE id = :id";

        $req = Database::getBdd()->prepare($sql);

        return $req->execute([
            'id' => $id,
            'group_product_id' => $group_product_id,
            'description' => $description,
            'price' => $price,
            'unid' => $unid,
            'updated_at' => date('Y-m-d H:i:s')
        ]);
    }

    public function delete($id)
    {
        $sql = 'DELETE FROM products WHERE id = ?';
        $req = Database::getBdd()->prepare($sql);
        return $req->execute([$id]);
    }
}
?>