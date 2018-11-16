$(function(){
  attachEventListeners()


  class Comment {
    constructor(i) {
    this.id = i.id
    this.content = i.content;
    this.review = i.review;
    this.review_id = i.review_id;
  }
}


Comment.prototype.renderComment = function() {
  let commentHtml =
  `
  <li>${this.content}</li>
  `
  return commentHtml
}

function getComments(e) {
  e.preventDefault();
    $("div.review-comments-").html("")
     $.get(this.href+'.json', function(data) {
       data.comments.sort(function(a, b) {
         var contentA = a.content.toUpperCase();
         var contentB = b.content.toUpperCase();
         if (contentA < contentB) {
           return -1;
         }
         if (contentA > contentB) {
           return 1;
         }
         return 0;
       })
         data.comments.forEach(commentNew => {
          let lc = new Comment(commentNew).renderComment()
          let id = commentNew.review_id
       $("div.review-comments-"+id).append(lc)
     })
     })
   }

function createComments(e) {
   e.preventDefault();
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      dataType: "json",
      data: $(this).serialize(),
      success: function(data){
        const commentData = data.comments
        const newComment = new Comment(commentData)
        let nc = newComment.renderComment()
        let id = newComment.review_id
        $("div.review-comments-"+id).append(nc)
      }
    })
  }

// Comment.prototype.renderComment = function(){}


function attachEventListeners() {

    $('a.load-comments').on('click', getComments)

      $('a.hide-comments').click(function(){
        $("div.review-comments-"+id).toggle(false);
      });

    $("#new_comment").on("submit", createComments)
}
})
