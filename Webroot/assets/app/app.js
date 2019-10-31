'use strict';

var Seles = (function() {
  var $description_item_new_sale = $('#description_item_new_sale');
  var $qtd_item_new_sale = $('#description_item_new_sale');
  var $unid_item_new_sele = $('#description_item_new_sale');

  function init() {
    bindings();
  }

  function bindings() {
    $($description_item_new_sale).change(function() {
      alert('Opa ta acontecendo alguma coisa!.');
    });
  }

  return {
    init: init
  };
})();

Seles.init();
