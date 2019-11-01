<?php
class Sales extends Model
{
    public function create(){

        $sql = "INSERT INTO sales (client, created_at, updated_at) VALUES ( :client, :created_at, :updated_at)";
        
        $req = Database::getBdd()->prepare($sql);
        
        $req->execute([
            'client' => " - ",
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ]);
        
        $sql2 = "SELECT id FROM sales ORDER BY id DESC LIMIT 1";
        $req2 = Database::getBdd()->prepare($sql2);
        $req2->execute();

        return $req2->fetch();
    }

    public function showSale($id)
    {
        $sql = "SELECT * FROM sales WHERE id =" . $id;
        $req = Database::getBdd()->prepare($sql);
        $req->execute();
        return $req->fetch();
    }

    public function showAllSeles($filter)
    {
        $sql = "SELECT * FROM sales ORDER BY id ASC";
        $req = Database::getBdd()->prepare($sql);
        $req->execute();
        return $req->fetchAll();
    }

    public function edit($id, $client, $total, $tax_total, $qtd_items)
    {
        $sql = "UPDATE sales SET  client = :client, total = :total, tax_total = :tax_total, qtd_items = :qtd_items, updated_at = :updated_at WHERE id = :id";
        
        $req = Database::getBdd()->prepare($sql);

        return $req->execute([
            'id' => $id,
            'client' => $client,
            'total' => $total,
            'tax_total' => $tax_total,
            'qtd_items' => $qtd_items,
            'updated_at' => date('Y-m-d H:i:s')
        ]);
    }

    public function delete($id)
    {
        $sql = 'DELETE FROM sales WHERE id = ?';
        $req = Database::getBdd()->prepare($sql);
        return $req->execute([$id]);
    }
}
?>