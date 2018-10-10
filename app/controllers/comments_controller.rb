class CommentsController < ApplicationController
  before_action :set_review

  def index
    @comments = @review.comments.order(created_at: :asc)

    respond_to do |f|
     f.html {render 'index.html', :layout => false}
     f.js {render 'index.js', :layout => false}
   end
  end

 def create
   @comment = @review.comments.build(comments_params)
   if @comment.save
     # I need to render something that just has the LI I want...
     # why not just create a comments/show view that shows the LI of one comment?
     render 'comments/show', :layout => false
   else
     render "reviews/show"
   end
 end

 private

 def set_review
    @review = Review.find(params[:review_id])
  end

  def comments_params
    params.require(:comment).permit(:content)
  end

end
