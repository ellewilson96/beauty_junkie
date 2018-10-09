$(function(){
  $('a.load-ingredients').on('click', function(e) {
    $.get(('/products.json'), function(data) {
      data.forEach(product => {
        const id = product.id
        const productHtml = product.ingredient_list
        $('div.ingredients-'+id).append(productHtml)
        $('a.load-ingredients').html("Hide Ingredients");
      });
  })
  e.preventDefault();
})
})
