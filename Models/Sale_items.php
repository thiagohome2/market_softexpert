<?php
class SaleItems extends Model
{
    public function create($sale_id, $product_id, $description, $unid, $qtd_unids, $price_unit, $total, $tax, $tax_total_item)
    {
        $sql = "INSERT INTO sale_items (sale_id, product_id, description, unid, qtd_unids, price_unit, total, tax, tax_total_item, created_at, updated_at) VALUES ( :sale_id, :product_id, :description, :unid, :qtd_unids, :price_unit, :total, :tax, :tax_total_item, :created_at, :updated_at)";
        
        $req = Database::getBdd()->prepare($sql);
        
        return $req->execute([
            'sale_id' => $sale_id, 
            'product_id' => $product_id, 
            'description' => $description,
            'unid' => $unid,
            'qtd_unids' => $qtd_unids, 
            'price_unit' => $price_unit, 
            'total' => $total, 
            'tax' => $tax, 
            'tax_total_item' => $tax_total_item,
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s')
        ]);
    }


    public function showAllSalesItens($sale_id)
    {
        $sql = 'SELECT * FROM sale_items  WHERE sale_id =  ?';
        $req = Database::getBdd()->prepare($sql);
        $req->execute([$sale_id]);
        return $req->fetchAll();
    }


    public function delete($id)
    {
        $sql = 'DELETE FROM sale_items WHERE id = ?';
        $req = Database::getBdd()->prepare($sql);
        return $req->execute([$id]);
    }

    public function deleteAllSele($sele_id)
    {
        $sql = 'DELETE FROM sale_items WHERE sale_id = ?';
        $req = Database::getBdd()->prepare($sql);
        return $req->execute([$sele_id]);
    }
}
?>