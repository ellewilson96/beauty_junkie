class CommentsController < ApplicationController
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!


 def create
   @review = Review.find(params[:review_id])
   @user = current_user
   @comment = @review.comments.create(comment_params)
   @review.comments << @comment
 end

 def index
   @review = Review.find_by(params[:review_id])
   @comments = @review.comments.order(created_at: :asc)
 end

 private

 def comment_params
   params.require(:comment).permit(:content)
 end

end
