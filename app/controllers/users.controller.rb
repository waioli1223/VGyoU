class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # user = User.find(params[:id])
    # @nickname = user.nickname
  end
end
