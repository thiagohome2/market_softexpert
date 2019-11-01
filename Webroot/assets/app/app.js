'use strict';
var Seles = (function() {
  var $cod_sale = $('#cod_sale');
  var $total_sale = $('#total_sale');
  var $tax_total_sale = $('#tax_total_sale');
  var $qtd_items_sale = $('#qtd_items_sale');

  function init() {
    bindings();
  }

  function bindings() {
    $('#description-item-new-sale').keyup(function() {
      var $description_item_new_sale = $('#description-item-new-sale').val();
      //if ($description_item_new_sale.length >= 4) {
      buscar_produtos($description_item_new_sale);
      //}
    });

    $(document).on('blur', '#client-identification-new-sale', function() {
      atualizar_dados_venda(
        $cod_sale.val(),
        $total_sale.val(),
        $tax_total_sale.val(),
        $qtd_items_sale.val()
      );
    });

    $(document).on('click', '.add-item-new-sale', function() {
      var id_product = $(this).data('idproduct');
      var value_perc = $(this).data('valueperc');
      var value_unit = $(this).data('valueunit');
      var desc_product = $(this).data('descproduct');
      var unid = $(this).data('unid');
      var tax = $(this).data('tax');
      var price = $(this).data('price');

      var qtd_items = $('#input-qtd-new-sale-' + id_product).val();
      adicionar_item_venda(
        id_product,
        value_perc,
        value_unit,
        qtd_items,
        desc_product,
        unid,
        tax,
        price
      );
    });
    $(document).on('click', '.excluir-item-sale', function() {
      var id_item_sale = $(this).data('iditemsale');
      exclui_item_venda(id_item_sale);
    });
  }

  function adicionar_item_venda(
    id_product,
    value_perc,
    value_unit,
    qtd_items,
    desc_product,
    unid,
    tax,
    price
  ) {
    if (tax == null) {
      tax = 0;
    }

    //gravar na base
    var dados = {
      sale_id: $cod_sale.val(),
      product_id: id_product,
      description: desc_product,
      unid: unid,
      qtd_unids: qtd_items,
      price_unit: price,
      total: value_unit,
      tax: tax,
      tax_total_item: value_perc
    };
    $.ajax({
      type: 'POST',
      url: '/market_softexpert/sale_items/create/',
      data: dados,
      dataType: 'json',
      success: function(data) {
        console.log('Cadastrou certinho!');
        atualizar_tela(data);
      }
    });
  }

  function exclui_item_venda(id) {
    var dados = {
      id: id
    };
    $.ajax({
      type: 'POST',
      url: '/market_softexpert/sale_items/delete/',
      data: dados,
      dataType: 'json',
      success: function(data) {
        console.log('Excluiu certinho!');
        atualizar_tela(data);
      }
    });
  }

  function atualizar_tela(obj) {
    var dados = {
      ok: obj,
      sale_id: $cod_sale.val()
    };
    $.ajax({
      type: 'POST',
      url: '/market_softexpert/sale_items/ajaxgetitemssale/',
      data: dados,
      dataType: 'json',
      success: function(data) {
        montar_lista_itens_venda(data);
      }
    });
  }

  function buscar_produtos(filter) {
    var dados = {
      filter: filter
    };

    $.ajax({
      type: 'POST',
      url: '/market_softexpert/products/ajaxgetproducts/',
      data: dados,
      dataType: 'json',
      success: function(data) {
        console.log(data);
        //var obj = JSON.parse(data);
        montar_lista_produtos(data);
      }
    });
  }

  function montar_lista_produtos(obj) {
    var $table = $('<table/>', {
      class: 'table table-bordered mim',
      style: 'margin-bottom: 0'
    });
    var $thead = $('<thead/>');
    $('<th/>', {
      align: 'center',
      html: 'Cod.'
    }).appendTo($thead);
    $('<th/>', {
      align: 'center',
      html: 'Descrição'
    }).appendTo($thead);
    $('<th/>')
      .html('Valor Unitário')
      .appendTo($thead);
    $('<th/>')
      .html('Quantidade')
      .appendTo($thead);
    $('<th/>')
      .html('')
      .appendTo($thead);
    $thead.appendTo($table);

    var $tbody = $('<tbody/>');

    obj.forEach(function(o, index) {
      var $tr_product = $('<tr/>');
      var value_perc = (parseFloat(o.tax) / 100) * parseFloat(o.price) || 0;
      var value_unit = parseFloat(o.price) + value_perc;
      value_unit = parseFloat(value_unit).toFixed(2);
      $('<td/>', {
        align: 'center',
        width: '30px',
        text: o.id_product
      }).appendTo($tr_product);
      $('<td/>', { text: o.desc_product }).appendTo($tr_product);
      $('<td/>', {
        align: 'center',
        width: '100px',
        text: 'R$' + value_unit.toString().replace('.', ',') + ' ' + o.unid
      }).appendTo($tr_product);
      $('<td/>', {
        width: '100px',
        html:
          '<input type="number" value="1" id="input-qtd-new-sale-' +
          o.id_product +
          '" class="form-control" min="1" placeholder="QTD">'
      }).appendTo($tr_product);
      $('<td/>', {
        width: '50px',
        html:
          '<button class="btn btn-default add-item-new-sale" data-idproduct="' +
          o.id_product +
          '" data-valueperc="' +
          value_perc +
          '"  data-valueunit="' +
          value_unit +
          '"  data-descproduct="' +
          o.desc_product +
          '"  data-unid="' +
          o.unid +
          '"  data-tax="' +
          o.tax +
          '"  data-price="' +
          o.price +
          '" role="button"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button>'
      }).appendTo($tr_product);
      $tr_product.appendTo($tbody);
    });

    $tbody.appendTo($table);

    $('#lista-produto').html($table);
  }

  function atualiza_placar(value_total_sale, value_total_tax, qtd_items) {
    value_total_sale;

    $('#placar_total').html(
      '<strong>Total: </strong> R$' +
        value_total_sale.toString().replace('.', ',') +
        '</h3>'
    );
    $('#placar_impostos').html(
      '<strong>Total Impostos: </strong> R$' +
        value_total_tax.toString().replace('.', ',') +
        '</h3>'
    );
    $('#placar_itens').html('<strong>Itens: </strong> ' + qtd_items + '</h3>');
  }

  function atualizar_dados_venda(id, total, tax_total, qtd_items) {
    var dados = {
      id: id,
      client: $('#client-identification-new-sale').val(),
      total: total,
      tax_total: tax_total,
      qtd_items: qtd_items
    };

    $.ajax({
      type: 'POST',
      url: '/market_softexpert/sales/ajax_edit_view_create/',
      data: dados,
      dataType: 'json',
      success: function(data) {
        console.log('Atualizou certinho!');
      }
    });
  }

  function montar_lista_itens_venda(obj) {
    $total_sale.val(''), $tax_total_sale.val(''), $qtd_items_sale.val('');
    var total_item = 0;
    var total_sale = 0;
    var tax_total_sale = 0;
    var sum_tax_item = 0;
    var cont = 0;
    $('#list_items_sale').html('');
    obj.forEach(function(o, index) {
      cont = cont + 1;
      total_item = parseFloat(o.total) * parseFloat(o.qtd_unids);
      total_item = parseFloat(total_item).toFixed(2);

      total_sale = parseFloat(total_sale) + parseFloat(total_item);
      total_sale = parseFloat(total_sale).toFixed(2);

      sum_tax_item = o.tax_total_item * o.qtd_unids;
      tax_total_sale = parseFloat(tax_total_sale) + parseFloat(sum_tax_item);
      tax_total_sale = parseFloat(tax_total_sale).toFixed(2);

      var $ul = $('#list_items_sale');
      $('<li/>', {
        class: 'list-group-item list-group-item-warning',
        html:
          cont +
          ') ' +
          '#' +
          o.product_id +
          '-' +
          o.description.toUpperCase() +
          ' <button type="button" class="close excluir-item-sale" data-iditemsale="' +
          o.id +
          '" aria-label="Excluir"><span aria-hidden="true">&times;</span></button> <br /> <table class="table-condensed" width="100%"><tr><td>' +
          o.qtd_unids +
          ' ' +
          o.unid.toUpperCase() +
          ' </td><td align="center">x</td><td>R$' +
          o.total.toString().replace('.', ',') +
          ' </td><td align="right">T ' +
          o.tax +
          '% </td><td align="right"> = </td><td align="right"><strong>R$' +
          total_item.toString().replace('.', ',') +
          '</strong></td></tr></table>'
      }).appendTo($ul);
    });

    $total_sale.val(total_sale);
    $tax_total_sale.val(tax_total_sale);
    $qtd_items_sale.val(cont);

    atualizar_dados_venda($cod_sale.val(), total_sale, tax_total_sale, cont);
    atualiza_placar(total_sale, tax_total_sale, cont);
  }

  return {
    init: init
  };
})();

Seles.init();
