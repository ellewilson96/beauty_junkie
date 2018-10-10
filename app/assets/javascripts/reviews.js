function Review(attr) {
   this.id = attr.id
   this.title = attr.title
   this.body = attr.body
   this.user_id = attr.user_id
   this.comments = attr.comments
 }

 Review.prototype.renderComments = function() {
  var comments = this.comments
  $(".comments-list").empty()
  comments.forEach(function(c) {
    const dateFormat = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute:'2-digit', hour12: true }
    c.created_at = new Date(c.created_at).toLocaleDateString("en-US", dateFormat)
    $(".comments-list").append("<li>" + c.comment + " // " + c.user.email + " // " + c.created_at + "</li>")
  })
}
