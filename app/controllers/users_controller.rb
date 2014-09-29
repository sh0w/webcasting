class UsersController < ApplicationController
  before_filter :authenticate_user!

  def search
    query = "%#{params[:q]}%"
    @users = User.where("name LIKE ? OR
                         city LIKE ? OR
                         country LIKE ? OR
                         description LIKE ? OR
                         email LIKE ?",
                         query,query,query,query,query).all
  end

  def show
    @user = User.find(params[:id])
  end

end
