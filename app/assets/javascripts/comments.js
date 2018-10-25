$(function(){
   $("a.load-comments").on("click", function(e){
  $('div.comments').html("")
     $.get(this.href+'.json', function(data) {
       data.forEach(comment => {
         let commentHtml = `
           <li><%= comment.content %></li>`
       $("div.comments").append(commentHtml)
          //with each comment data, append an LI to the OL with the comment content
       })
     })
     e.preventDefault();
})
})


$(function(){
  $("#new_comment").on("submit", function(e){
    e.preventDefault()
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      success: function(data){
        $("div.comments").html("");
        const $ol = $("div.comments ol")
        $ol.append(data);
      }
    });
  })
})
