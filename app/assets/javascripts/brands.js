$(function(){
  attachEventListeners();
})

  function getBrands() {
      $('div#page-body').html("")
      $.get(`/brands.json`, function(data) {
      data.forEach(brand => {

        let brandHtml = `
      <div class="brand-header">${brand.name}</div>
        <a href="/products" class="drop-down">${brand.products.length} Product(s)</a><br>
        <div id="product-drop-down"></div>`
        $('div#page-body').append(brandHtml)
      })
    })
  }

  function getDropDown() {
    $('div#product-drop-down').html("")
    $.get(this.href+'.json', function(data) {
      data.forEach(product => {
        let productHtml =
        `${product.name}`
        $('div#product-drop-down').append(productHtml)
      })
    })
}


function attachEventListeners() {
  $('a.all-brands').on('click', function(e) {
    e.preventDefault();
    getBrands();
  })

  $('a.drop-down').on('click', function(e) {
    e.preventDefault();
    getDropDown();
  })
    }
