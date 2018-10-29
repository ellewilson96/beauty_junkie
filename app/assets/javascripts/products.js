//REQUIREMENTS

// Brands index page lists 3 products names at a time for each brand -> clicking on name renders product show page
    //names can be shown and hidden

//Products index page
//Load ingredient list for each product on product show page

//Load list of review titles for each product on product show page that link to each review (redirect to review show page)

//load comments on review show page
//submit new comment on review show page with dynamic form

//Load review index page on home page but in order of date created
//Load review show page on home page

//load products index page into page-body div on home page
//load brands index page into page-body div on home page


$(function(){
  attachEventListeners()

  function getProducts() {
      $('div#page-body').html(`<div class="title">Latest Products</div>`)
    $.get(`/products.json`, function(data) {
      data.forEach(product => {
        const id = product.id
        const productHtml = `
        <div class="product-header"><a href="/products/${product.id}">${product.name}</a> by <a href="/brands/${product.brand.id}">${product.brand.name}</a>
          </div>
            <div class="product-description"> ${product.description} <br>
            <a href="/products/${id}">Product Details</a>|
            <a href="/products/${product.id}/reviews">View All Reviews</a> | <a href="/products/${product.id}/reviews/new">Write a Review</a>
            </div><br>`
        $('div#page-body').append(productHtml)
      })
    })
  }



  function attachEventListeners() {

      $('a.all-products').on('click', function(e) {
      e.preventDefault();
        getProducts()
    })

}
})
