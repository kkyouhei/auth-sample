class Api::UserSessionsController < Api::ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])
 
    if user
      token = Jwt::TokenProvider.(user_id: user.id)
      render json: {user: user, token: token}
    else
      render json: {error: 'Error description'}, status: 422
    end
  end
end