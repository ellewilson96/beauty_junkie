$(function(){
  attachEventListeners();
})

  class Comment {
  constructor(i) {
    this.id = i.id
    this.user = i.user;
    this.user_id = i.user_id;
    this.content = i.content;
  }

    formatIndex() {
      let commentHtml =
      `<ol><li> ${this.user.email} wrote ${this.content} </li></ol>
      `
      return commentHtml
    }

    getComments() {
    $.get(("/comments.json"), function(data) {
      data.forEach(comment => {
        let newComment = new Comment(comment)
        let ih = newComment.formatIndex()
        $('div.comments').append(ih)
      })
    })
  }


  function attachEventListeners () {
  $('.load-comments').on('click', function(e) {
        e.preventDefault()
        getComments();
      })
    }
  }
