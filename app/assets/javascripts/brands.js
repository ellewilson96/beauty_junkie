$(function(){
  attachEventListeners()

  function getBrands() {
      $('div#page-body').html(`<div class="title">Popular Brands</div>`)
      $.get(`/brands.json`, function(data) {
      data.forEach(brand => {
        if (brand.products.length !== 0) {
        let brandHtml = `
      <div class="brand-header">${brand.name}</div>
        <a href="/brands/${brand.id}/products">${brand.products.length} Product(s)</a>
        <br><br>
        <div class="product-list">

        </div>`
        $('div#page-body').append(brandHtml)
    }    else {
      let brandHtml =
      `<div class="brand-header">${brand.name}</div>
      <a href="/products/new">Add a New Product</a><br><br>`
        $('div#page-body').append(brandHtml)
      }
    })
  })
}

function loadProducts() {
  $.get(this.href+'.json', function(data) {
    data.forEach(brand => {
      if (brand.products.length !== 0) {
      $('div.product-list').html("")
      let productHtml =
      `<ol>
      <li>${brand.products}
      </li>
      </ol>`
      $('div.product-list').append(productHtml)
    } else {
        let productHtml = `Add a new product`
      }
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
