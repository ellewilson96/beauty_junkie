$(function(){
  $('a.all-brands').on('click', function(e) {

      $('div#page-body').html("")
      $.get(this.href+'.json', function(data) {

      data.forEach(brand => {

        let brandHtml = `
          <div class="brand-header">${brand.name}</div>
            <a href="/brands/${brand.id}/products"><p>${brand.products.length} Product(s)</p></a><br>
            `
        $('div#page-body').append(brandHtml)
      })
    })
    e.preventDefault();
  })
})
