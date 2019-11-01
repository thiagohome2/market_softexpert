<h1>Grupos de Produtos</h1>
<div class="row col-md-12 centered">
    <table class="table table-striped custab">
        <thead>
        <a href="/market_softexpert/group_products/create/" class="btn btn-primary btn-xs pull-right">Adicionar Grupo</a>
        <tr>
            <th>Código</th>
            <th>Descrição</th>
            <th>Percentual de Imposto</th>
            <th class="text-center">Ação</th>
        </tr>
        </thead>
        <?php
        foreach ($groups as $group)
        {
            echo '<tr>';
            echo "<td>" . $group['id'] . "</td>";
            echo "<td>" . $group['description'] . "</td>";
            echo "<td>" . $group['tax'] . " %</td>";
            echo "<td class='text-center'><a class='btn btn-info btn-xs' href='/market_softexpert/group_products/edit/" . $group["id"] . "' ><span class='glyphicon glyphicon-edit'></span> Editar</a> <a href='/market_softexpert/group_products/delete/" . $group["id"] . "' class='btn btn-danger btn-xs'><span class='glyphicon glyphicon-remove'></span> Excluir</a></td>";
            echo "</tr>";
        }
        ?>
    </table>
</div>