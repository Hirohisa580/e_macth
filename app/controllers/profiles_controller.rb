class ProfilesController < ApplicationController

  def index
    @profile_user_id = Profile.pluck(:user_id)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    redirect_to root_path
  end


  private
  
  def profile_params
    params.require(:profile).permit(:nick_name, :age, :birthday, :area_id, :history, :public_relation, :genre_one_id, :genre_two_id, :genre_three_id, :image).merge(user_id: current_user.id)
  end

end
