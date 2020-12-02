class MessagesController < ApplicationController
  before_action :header_variable

  def index
    user_id = params[:dm_id]
    @profile = Profile.find_by(user_id: user_id)
  end
    


  private
  def header_variable
    @profile_user_id = Profile.pluck(:user_id)
    @user_profile = Profile.find_by(user_id: current_user.id)
    @current_profile = Profile.find_by(user_id: current_user.id)
  end
end
