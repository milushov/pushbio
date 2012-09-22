class UsersController < ApplicationController
  def show
    render json: if params[:id] == 'current'
      current_user
    else
      User.find(params[:id])
    end
  end
end
