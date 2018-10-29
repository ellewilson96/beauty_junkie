$(function(){
  attachEventListeners()

  function getBrands() {
      $('div#page-body').html(`<div class="title">Popular Brands</div>`)
      $.get(`/brands.json`, function(data) {
      data.forEach(brand => {
        if (brand.products.length !== 0) {
        let brandHtml = `
        <div class="brand-header">${brand.name}</div>
        <a href="/products/new">Add a New Product</a> |
        <a href="/products/${brand.products[0].id}"> View Existing Products </a>
      <br>`
        $('div#page-body').append(brandHtml)
    }    else {
      let brandHtml =
      `<div class="brand-header">${brand.name}</div>
      <a href="/products/new">Add a New Product</a><br>`
        $('div#page-body').append(brandHtml)
      }
    })
  })
}

function loadProducts() {
  $.get(this.href+'.json', function(data) {
    $('div.product-list').html("")
    data.forEach(brand => {
      let productHtml =
      `<ol>
      <li>${brand.products.name}
      </li>
      </ol>`
      $('div.product-list').append(productHtml)
      })
    })
}


function attachEventListeners() {
  $('a.all-brands').on('click', function(e) {
    e.preventDefault();
    getBrands()
  })

  $('a.load-products').on('click', function(e) {
    e.preventDefault();
    loadProducts()
  })
}
})
