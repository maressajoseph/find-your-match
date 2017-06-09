class UsersController < ApplicationController
  before_action :set_user, only: [:update, :change_admin]
  helper_method :change_admin

  def index
    @users = User.all
  end

  def edit
  end

  def update
  end

  def change_admin
    @user.change_admin
    respond_to do |format|
       format.html { redirect_to adminpage_path, notice: "The user's admin status is now changed" }
       format.json { render json: @user }
     end
  end

private

  def set_user
    @user = User.find(params[:id])
  end
end
