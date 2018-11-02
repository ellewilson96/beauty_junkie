$(function(){
  attachEventListeners()
})

  class Comment {
    constructor(i) {
    this.id = i.id
    this.content = i.content;
    this.review = i.review;
    this.review_id = i.review_id;
  }

  renderComment(){
    `
    <li>${this.content}</li>`
  }
}

function getProducts(e){
  e.preventDefault();
    $("div.comments-list").html("")
     $.get(this.href+'.json', function(data) {
       commentData = data.comments
       const loadComments = commentData
       let commentHtml = loadComments.renderComment()
       $("div.comments-list").append(commentHtml)
   })
}
// Comment.prototype.renderComment = function(){}

function createProduct(e) {
   e.preventDefault();
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      success: function(data){
        const commentData = data.comments
        const newComment = new Comment(commentData)
        let nc = newComment.renderComment()
        $("div.comments-list").append(nc)
      }
    })
  }

function attachEventListeners() {

    $('.load-comments').on('click', getProducts)

    $("#new_comment").on("submit", createProduct)
}
