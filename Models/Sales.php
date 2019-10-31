<?php
class Sales extends Model
{
    public function create($client)
    {
        $sql = "INSERT INTO sales (client, created_at, updated_at) VALUES ( :client, :created_at, :updated_at)";
        
        $req = Database::getBdd()->prepare($sql);
        
        return $req->execute([
            'client' => $client,
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ]);
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
        $sql = "SELECT * FROM sales";
        $req = Database::getBdd()->prepare($sql);
        $req->execute();
        return $req->fetchAll();
    }

    public function edit($id, $client, $total, $tax_total, $qtd_itens)
    {
        $sql = "UPDATE sales SET  client = :client, total = :total, tax_total = :tax_total, qtd_itens = :qtd_itens, updated_at = :updated_at WHERE id = :id";

        $req = Database::getBdd()->prepare($sql);

        return $req->execute([
            'id' => $id,
            'client' => $client,
            'total' => $total,
            'tax_total' => $tax_total,
            'qtd_itens' => $qtd_itens,
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