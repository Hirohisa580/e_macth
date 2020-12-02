class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :header_variable, only: [:index, :new, :show, :edit]
  before_action :set_profile, only: [:show, :edit, :destroy]

  def index
    @profile = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.new(profile_params)
    profile.save
    redirect_to root_path
  end

  def show
    profile_user_id = @profile.user_id                        #選んだユーザーのユーザーidを取得
    profile_user_dm = UserDm.where(user_id: profile_user_id)  #user_dmsテーブルに登録されている選んだユーザーの情報を取得
    @profile_dm_ids = profile_user_dm.pluck(:dm_id)           #選んだユーザーが持ってるdm_idを配列で取得
    user_dm= UserDm.where(user_id: current_user.id)
    @dm_ids = user_dm.pluck(:dm_id)                           #現ユーザーが持ってるdm_idを配列で取得
    @intersection = @dm_ids & @profile_dm_ids                 #重なったdm_id

    @dm = Dm.new
    @user = User.all
    @profile_all = Profile.all
  end

  def edit 
  end

  def update
    @profile = Profile.update(profile_params)
    redirect_to profile_path
  end

  def destroy
    @profile.destroy
    redirect_to root_path
  end


  private
  def profile_params
    params.require(:profile).permit(:nickname, :age, :birthday, :area_id, :history, :public_relation, :genre_one_id, :genre_two_id, :genre_three_id, :image).merge(user_id: current_user.id)
  end


  def header_variable
    @profile_user_id = Profile.pluck(:user_id)
    @user_profile = Profile.find_by(user_id: current_user.id)
    @current_profile = Profile.find_by(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
