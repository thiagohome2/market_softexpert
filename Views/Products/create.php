<h1>Novo Produto</h1>
<div class="row">
  <div class="col-md-6">
    <form method='post' action='#'>
        <div class="form-group">
            <input type="text" class="form-control form-control-lg" id="description" placeholder="Informe a descrição" name="description" require>
        </div>
        <div class="form-group">
            <select class="form-control form-control-lg" id="group_product_id" name="group_product_id">
                <option value="0">Selecione o grupo do produto</option>
                <?php
                    foreach ($groups as $group)
                    {
                        echo "<option value=".$group['id'].">".$group['description']."</option>";
                    }
                ?>
            </select>
        </div>    
        <div class="form-group">
            <input type="text" class="form-control form-control-lg" id="price" placeholder="Informe o valor unitário" name="price" require>
        </div>
        <div class="form-group">
            <select class="form-control form-control-lg" id="unid" name="unid">
                <option>Selecione a unidade de medida</option>
                <option value="Kg">Kg - Kilograma(s)</option>
                <option value="Un">Un - Unidade(s)</option>
                <option value="Cx">Cx - Caixa (s)</option>
                <option value="Lt">Lt - Litro (s)</option>
            </select>
        </div>  
        <button type="submit" class="btn btn-primary btn-lg">Adicionar Produto</button>
    </form>
  </div>
  <div class="col-md-6"></div>
</div>  
