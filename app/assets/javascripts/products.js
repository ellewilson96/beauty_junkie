$(function(){
    eListeners();
})

function getProducts() {
  $.get((`/products/${id}.json`), function(data) {
    data.forEach(product => {
      $('#product-details').html("<h2>Product Details</h2>")
      let np =
      `<h2> ${product.name} </h2>
       <h3>  ${product.description} </h3>
       <p>  ${product.ingredient_list} </p>`
      $('#product-details').append(np)
      product.reviews.forEach(review => {
        let nr =
          `<li><a onclick="getThis(${review.user_id}, ${review.id})">◦ ${review.title} ◦</a></li>`
          $('#review-details').append(nr)
      })
    })
  })
}


function eListeners() {

  $('a.product-details').on('click', function(e) {
    e.preventDefault()
    getProducts()
  })
  }
