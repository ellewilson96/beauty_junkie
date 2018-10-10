//REQUIREMENTS

// Brands index page lists 3 products names at a time for each brand -> clicking on name renders product show page
    //names can be shown and hidden 

//Products index page

//Load ingredient list for each product on product show page

//Load list of review titles for each product on product show page that link to each review (redirect to review show page)

//load comments on review show page
//submit new comment on review show page with dynamic form




$(function(){
  $('a.load-ingredients').on('click', function(e) {

    $.get('/products' + $(this).attr("href") +".json", function(data) {
        const productHtml = data.ingredient_list
        const id = data.id
        $('div.ingredients-'+id).append(productHtml)
  })
  e.preventDefault();
})
})
