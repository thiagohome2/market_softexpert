<h1>Nova Venda: Nº <?php echo $sale['id'] ;?></h1>
<?php// print_r($sale);?>
<div class="row">
  <div class="col-md-6">
  <h5>Dados da Venda</h5>
    <form>
        <div class="form-group">
            <input type="text"  class="form-control" id="client-identification-new-sale" placeholder="Identificação do cliente ou venda">
            <input type="hidden" id="cod_sale" value="<?php echo $sale['id'] ;?>" />
            <input type="hidden" id="total_sale" value="0" />
            <input type="hidden" id="tax_total_sale" value="0" />
            <input type="hidden" id="qtd_items_sale" value="0" />
        </div>
  </form>
  <h5>Adicionar Itens</h5>
    <form>
        <div class="form-group">
            <input type="text"  class="form-control" id="description-item-new-sale" placeholder="Buscar item por código">
        </div>
    </form>
    <br/>
    <div id="lista-produto"></div>
  </div>
  <div class="col-md-6">
    <div class="row jumbotron">
        <div class="col-md-8">
            <h3 id="placar_total"><strong>Total: </strong>R$0,00</h3>
            <h3 id="placar_impostos"><strong>Total Impostos: </strong>R$0,00</h3>
            <h3 id="placar_itens"><strong>Itens: </strong>0</h3>
        </div>
        <div class="col-md-4">
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Finalizar Venda</a></p>
        </div>
    </div>    
    <ul class="list-group" id="list_items_sale"></ul>
   
    </div>
</div>