$(function(){
  $('a.all-brands').on('click', function(e) {
      $('div.page-body').html("")
    $.get(this.href+'.json', function(data) {
      data.forEach(brand => {
        let brandHtml = `
          <h3>${brand.name}</h3>
            <p>${brand.products.length} Product(s)</p><br>`
        $('div.page-body').append(brandHtml)
      })
    })
    e.preventDefault();
  })
})
