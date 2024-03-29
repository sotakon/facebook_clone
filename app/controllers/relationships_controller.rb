class RelationshipsController < ApplicationController
  respond_to? :js # 存在するアクションのrespondを全てjsで返す場合はこのような記述でも可能。
  def create
    # 自身で作ったログイン機能であれば、独自実装してあるはずの
    # logged_in?メソッドを使用して、ログイン時のみフォローできるようにする。
    if logged_in?
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
  end
end
