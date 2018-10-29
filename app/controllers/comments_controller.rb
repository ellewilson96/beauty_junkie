class CommentsController < ApplicationController
  before_action :set_review

  def index
    @comments = @review.comments.order(created_at: :asc)

    respond_to do |f|
      f.html
      f.json {render json: @review, layout: false}
   end
  end

 def create
   @comment = @review.comments.build(comments_params)
   if @comment.save
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
