$(function(){
   $("a.load-comments").on("click", function(e){
  $('div.review-comments-').html("")
     $.get(this.href+'/comments.json', function(data) {
       let comments = data.comments
      comments.forEach(comment => {
        let id = comment.review_id
         let commentHtml = `
           <li>${comment.content}</li>`
       $("div.review-comments-"+id).append(commentHtml)

       })
     })
     e.preventDefault();
})
})


$(function(){
  $("#new_comment").on("submit", function(e){
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      success: function(data){
        $("div.comments ol").html("");
        const loadComments = $("div.comments ol")
        loadComments.append(data);
      }
    })
  e.preventDefault()
  })
})
