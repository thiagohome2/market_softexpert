<?php
class GoupProducts extends Model
{
    public function create($description, $tax)
    {
        $sql = "INSERT INTO group_products (description, tax, created_at, updated_at) VALUES ( :description, :tax, :created_at, :updated_at)";
        
        $req = Database::getBdd()->prepare($sql);
        
        return $req->execute([
            'description' => $description,
            'tax' => $tax,
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ]);
    }

    public function showGroupProduct($id)
    {
        $sql = "SELECT * FROM group_products WHERE id =" . $id;
        $req = Database::getBdd()->prepare($sql);
        $req->execute();
        return $req->fetch();
    }

    public function showAllGroupsProducts()
    {
        $sql = "SELECT * FROM group_products";
        $req = Database::getBdd()->prepare($sql);
        $req->execute();
        return $req->fetchAll();
    }

    public function edit($id, $description, $tax)
    {
        $sql = "UPDATE group_products SET  description = :description , tax = :tax, updated_at = :updated_at WHERE id = :id";

        $req = Database::getBdd()->prepare($sql);

        return $req->execute([
            'id' => $id,
            'description' => $description,
            'tax' => $tax,
            'updated_at' => date('Y-m-d H:i:s')

        ]);
    }

    public function delete($id)
    {
        $sql = 'DELETE FROM group_products WHERE id = ?';
        $req = Database::getBdd()->prepare($sql);
        return $req->execute([$id]);
    }
}
?>