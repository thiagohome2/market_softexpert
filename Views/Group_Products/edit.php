<h1>Editar Grupo de Produto</h1>
<div class="row">
  <div class="col-md-6">
    <form method='post' action='#'>
        <div class="form-group">
            <input type="text" required class="form-control form-control-lg" id="description" placeholder="Informe a descrição do grupo" name="description"  value ="<?php if (isset($group["description"])) echo $group["description"];?>">
        </div>  
        <div class="form-group">
            <input type="text" required class="form-control form-control-lg" id="tax" placeholder="Informe a taxa percentual de imposto Ex.: 12.5" name="tax" value ="<?php if (isset($group["tax"])) echo $group["tax"];?>">
        </div>
        <button type="submit" class="btn btn-primary btn-lg">Editar Grupo</button>
    </form>
    </div>
    <div class="col-md-6"></div>
</div>     