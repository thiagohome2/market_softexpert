<h1>Editar Produto</h1>
<div class="row">
  <div class="col-md-6">
    <form method='post' action='#'>
        <div class="form-group">
            <input type="text" class="form-control form-control-lg" id="description" placeholder="Informe a descrição" name="description" require  value ="<?php if (isset($product["description"])) echo $product["description"];?>">
        </div>
        <div class="form-group">
            <select class="form-control form-control-lg" id="group_product_id" name="group_product_id" >
                <option value="0">Selecione o grupo do produto</option>
                <?php
                    foreach ($groups as $group)
                    {
                        if ($product["group_product_id"] === $group['id']) { $selected = "selected"; }else{ $selected = "";}
                        echo "<option  value=".$group['id']." ". $selected ."> ".$group['description']."</option>";
                    }
                ?>
            </select>
        </div>    
        <div class="form-group">
            <input type="text" class="form-control form-control-lg" id="price" placeholder="Informe o valor unitário" name="price" require value ="<?php if (isset($product["price"])) echo $product["price"];?>">
        </div>
        <div class="form-group">
            <select class="form-control form-control-lg" id="unid" name="unid">
            
                <option>Selecione a unidade de medida</option>
                <option value="Kg" <?php if ($product["unid"] == 'Kg') { echo "selected"; } ?>>Kg - Kilograma(s)</option>
                <option value="Un" <?php if ($product["unid"] == 'Un') { echo "selected"; } ?>>Un - Unidade(s)</option>
                <option value="Cx" <?php if ($product["unid"] == 'Cx') { echo "selected"; } ?>>Cx - Caixa (s)</option>
                <option value="Lt" <?php if ($product["unid"] == 'Lt') { echo "selected"; } ?>>Lt - Litro (s)</option>
            </select>
        </div>  
        <button type="submit" class="btn btn-primary btn-lg">Adicionar Produto</button>
    </form>
  </div>
  <div class="col-md-6"></div>
</div>  
