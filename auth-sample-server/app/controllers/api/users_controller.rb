class Api::UsersController < Api::ApplicationController
  before_action :authenticate

  def show
    render json: current_user
  end
end
