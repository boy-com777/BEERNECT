module V1
  class RelationshipsController < ApplicationController
    before_action :set_user
    def create
      user = @current_user.follow(@other_user)
      render json: user
    end

    def destroy
      user = @current_user.unfollow(@other_user)
      if user.destroy
        render json: user
      else
        render json: user.errors
      end
    end

    private

    def set_user
      @current_user = User.find(params[:user_id])
      @other_user = User.find(params[:follow_id])
    end
  end
end
