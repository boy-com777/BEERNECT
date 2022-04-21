module V1
  class UsersController < ApplicationController
    def index
      users = if params[:uid]
                User.find_by(uid: params[:uid])
              else
                User.all
              end
      render json: users
    end
  end

  def create
    user = User.create!(user_params)
    if user.save
      render json: user
    else
      render json: user.errors
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    if user.save
      render json: user
    else
      render json: user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :uid, :profile, :favorite_beer, :avatar)
  end
end
