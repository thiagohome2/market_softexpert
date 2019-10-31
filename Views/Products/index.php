<h1>Produtos</h1>
<div class="row col-md-12 centered">
    <table class="table table-striped custab">
        <thead>
        <a href="/market_softexpert/products/create/" class="btn btn-primary btn-xs pull-right">Adicionar Produto</a>
        <tr>
            <th>Código</th>
            <th>Descrição</th>
            <th>Valor Unitario</th>
            <th>Grupo de Produto</th>
            <th>Valor Venda</th>
            <th class="text-center">Ação</th>
        </tr>
        </thead>
        <?php
        foreach ($products as $product)
        {
            $tax_perc = floatval($product['tax']);
            $price_unit = floatval($product['price']);
            $value_perc = ($tax_perc / 100) * $price_unit;
            $total_venda = $price_unit + $value_perc;

            echo '<tr>';
            echo "<td>" . $product['id_product'] . "</td>";
            echo "<td>" . $product['desc_product'] . "</td>";
            echo "<td> R$" . str_replace('.', ',',number_format($product['price'],2)) ." / ".$product['unid']. " </td>";
            if(isset($product['tax']))
            {
                $desc_grupo = $product['desc_group'] . " <br /> <small>+". $product['tax']."% = R$".  str_replace('.', ',',number_format($value_perc,2)) . "</small>";
            }else
            {
                $desc_grupo = "Sem grupo de produto";
            }
            echo "<td>" . $desc_grupo ."</td>";
            echo "<td> R$" . str_replace('.', ',',number_format($total_venda,2)) . "</td>";
            echo "<td class='text-center'><a class='btn btn-info btn-xs' href='/market_softexpert/products/edit/" . $product["id_product"] . "' ><span class='glyphicon glyphicon-edit'></span> Editar</a> <a href='/market_softexpert/products/delete/" . $product["id_product"] . "' class='btn btn-danger btn-xs'><span class='glyphicon glyphicon-remove'></span> Excluir</a></td>";
            echo "</tr>";
        }
        ?>
    </table>
</div>