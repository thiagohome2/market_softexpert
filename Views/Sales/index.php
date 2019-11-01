<h1>Vendas</h1>
<div class="row col-md-12 centered">
    <table class="table table-striped custab">
        <thead>
        <a href="/market_softexpert/sales/create/" class="btn btn-primary btn-lg pull-right">Adicionar Venda</a>
        <tr>
            <th>Código</th>
            <th>Cliente</th>
            <th align='right' >Valor Total</th>
            <th align='right'>Valor Impostos</th>
            <th align='center'>Quatidade de Itens</th>
            <th class="text-center">Ação</th>
        </tr>
        </thead>
        <?php
        $sum_total = 0;
        $sum_tax = 0;
        foreach ($sales as $sale)
        {

            echo "<tr>";
            echo "<td>" . $sale['id'] . "</td>";
            echo "<td>" . $sale['client'] . "</td>";
            echo "<td align='right'>R$" . str_replace('.', ',',number_format($sale['total'],2)) . "</td>";
            echo "<td align='right'>R$" . str_replace('.', ',',number_format($sale['tax_total'],2)) . "</td>";
            echo "<td align='center'>" . $sale['qtd_items'] . "</td>";
            echo "<td class='text-center'> <a href='/market_softexpert/sales/delete/" . $sale["id"] . "' class='btn btn-danger btn-xs'><span class='glyphicon glyphicon-remove'></span> Excluir</a></td>";
            echo "</tr>";
            $sum_total = $sum_total + $sale['total'];
            $sum_tax = $sum_tax + $sale['tax_total'];
        }
        echo "<tr  class='success'>";
        echo "<td colspan='2'>TOTAL:</td>";
        echo "<td align='right'>R$" . str_replace('.', ',',number_format($sum_total,2)) . "</td>";
        echo "<td align='right'>R$" . str_replace('.', ',',number_format($sum_tax,2)) . "</td>";
        echo "<td colspan='2'></td>";
        echo "</tr>";
        ?>
    </table>
</div>