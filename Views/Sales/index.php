<h1>Vendas</h1>
<div class="row col-md-12 centered">
    <table class="table table-striped custab">
        <thead>
        <a href="/market_softexpert/sales/create/" class="btn btn-primary btn-lg pull-right">Adicionar Venda</a>
        <tr>
            <th>Código</th>
            <th>Cliente</th>
            <th>Valor Total</th>
            <th>Valor Impostos</th>
            <th>Quatidade de Itens</th>
            <th class="text-center">Ação</th>
        </tr>
        </thead>
        <?php
        foreach ($sales as $sale)
        {
            echo '<tr>';
            echo "<td>" . $sale['id'] . "</td>";
            echo "<td>" . $sale['client'] . "</td>";
            echo "<td>" . $sale['total'] . "</td>";
            echo "<td>" . $sale['tax_total'] . "</td>";
            echo "<td>" . $sale['qtd_items'] . "</td>";
            echo "<td class='text-center'><a class='btn btn-info btn-xs' href='/market_softexpert/sales/edit/" . $sale["id"] . "' ><span class='glyphicon glyphicon-edit'></span> Editar</a> <a href='/market_softexpert/sales/delete/" . $sale["id"] . "' class='btn btn-danger btn-xs'><span class='glyphicon glyphicon-remove'></span> Excluir</a></td>";
            echo "</tr>";
        }
        ?>
    </table>
</div>