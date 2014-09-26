class UserController < ApplicationController
  def index
    @users = User.all
  end

  def search
    @users = User.all
  end

  def black_board
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
