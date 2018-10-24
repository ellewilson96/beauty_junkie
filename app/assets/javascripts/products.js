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

  $('a.all-products').on('click', function(e) {
  e.preventDefault();
    $.get(this.href+'.json', function(data) {
      $('div#page-body').html("")
      data.forEach(product => {
        const productHtml = `
        <div class="product-header"><a href="/products/${product.id}">${product.name}</a> by <a href="/brands/${product.brand.id}">${product.brand.name}</a>
          </div>
            <div class="product-description"> ${product.description} <br>
            <a href="/products/${product.id}" class="load-ingredients">Product Details</a>|
            <a href="/products/${product.id}/reviews">View All Reviews</a> | <a href="/products/${product.id}/reviews/new">Write a Review</a>
            </div><br>`
        $('div#page-body').append(productHtml)
      })
    })

  $('.load-ingredients').on('click', function(e) {

    $.get(this.href+'.json', function(data) {
        let id = data.id
        let productHtml = `${data.ingredient_list}`
        $('div.ingredients-'+id).append(productHtml);
        $('a.load-ingredients').html("Hide Ingredients");
      })
  e.preventDefault();
  })
})
})
