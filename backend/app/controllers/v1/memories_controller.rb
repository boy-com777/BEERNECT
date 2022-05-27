module V1
  class MemoriesController < ApplicationController
    def index
      memory = Memory.all
      render json: memory
    end

    def create
      memory = Memory.create!(memory_params)
      if memory.save
        render json: memory
      else
        render json: memory.errors
      end
    end

    private

    def memory_params
      params.require(:memory).permit(:beer_name, :repeat, :user_id)
    end
  end
end
