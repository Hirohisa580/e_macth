class DmsController < ApplicationController
  before_action :header_variable, only: [:show, :new]
  before_action :profile_all, only: [:show, :new]

  def new
    @dm = Dm.new
    @user = User.all
  end

  def create 
    @dm = Dm.new(dm_params)
    profile_user_id = @dm.user_ids[0]                         #選んだユーザーのユーザーidを取得
    profile_user_dm = UserDm.where(user_id: profile_user_id)  #選んだユーザーのuser_dmsレコード情報を取得
    @profile_dm_ids = profile_user_dm.pluck(:dm_id)           #選んだユーザーが持ってるdm_idを配列で取得
    user_dm= UserDm.where(user_id: current_user.id)           #現ユーザーのuser_dmsレコード情報を取得
    @dm_ids = user_dm.pluck(:dm_id)                           #現ユーザーが持ってるdm_idを配列で取得
    @intersection = @dm_ids & @profile_dm_ids                 #現ユーザーと選んだユーザーが所属しているdm_id
    if @intersection.empty?
      @dm.save
      @profile = Profile.find_by(user_id: profile_user_id)      #選んだユーザーのプロフィール情報を取得
      redirect_to dm_path(@profile.id)
    else
      redirect_to root_path
    end
  end

  def show
    @profile = Profile.find(params[:id])                      #選んだユーザーのプロフィール情報を取得
    profile_user_id = @profile.user_id                        #選んだユーザーのユーザーidを取得
    profile_user_dm = UserDm.where(user_id: profile_user_id)  #選んだユーザーのuser_dmsレコード情報を取得
    @profile_dm_ids = profile_user_dm.pluck(:dm_id)           #選んだユーザーが持ってるdm_idを配列で取得
    user_dm= UserDm.where(user_id: current_user.id)           #現ユーザーのuser_dmsレコード情報を取得
    @dm_ids = user_dm.pluck(:dm_id)                           #現ユーザーが持ってるdm_idを配列で取得
    @intersection = @dm_ids & @profile_dm_ids                 #現ユーザーと選んだユーザーが所属しているdm_id

    i = UserDm.where(dm_id: @dm_ids)                          #現ユーザーが所属しているdm_idを持っているユーザー情報を全て取得
    i_user_ids = i.pluck(:user_id)                            #現ユーザーと同じdm_idを持つユーザーのuser_id2を配列で取得
    @i_user_id = i_user_ids.uniq                              #上記で得た配列から重複したidを除外

   end

  private
    def header_variable
      @profile_user_id = Profile.pluck(:user_id)
      @user_profile = Profile.find_by(user_id: current_user.id)
      @current_profile = Profile.find_by(user_id: current_user.id)
    end

    def profile_all
      @profile_all = Profile.all
    end

    def dm_params
      params.require(:dm).permit(user_ids: [])
    end

end
