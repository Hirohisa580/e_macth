class CommentsController < ApplicationController
  before_action :header_variable


   def index
    @board = Board.find(params[:board_id])
    @comment_where = Comment.where(board_id: params[:board_id])
    @comment = Comment.new
    @profile = Profile.find_by(user_id: current_user.id)
    @profile_all = Profile.all
   end

   def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to root_path
   end


   private

   def header_variable
    @profile_user_id = Profile.pluck(:user_id)
    @user_profile = Profile.find_by(user_id: current_user.id)
    @current_profile = Profile.find_by(user_id: current_user.id)
   end

   def comment_params
    params.require(:comment).permit(:comment).merge(profile_id: params[:profile_id], board_id: params[:board_id])
   end

end
