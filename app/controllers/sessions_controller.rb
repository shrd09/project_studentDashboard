
#For JWT
class SessionsController < ApplicationController
  skip_before_action :authorize_request, only: [:create] # Bypass auth filter for login
  
  before_action :set_cors_headers

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password]) && user.role.to_s == params[:user][:role]
      # byebug
      jwt_token = generate_token(user.id)
      # jwt_token = encode_token(user.id)
      render json: { user: user.as_json(only: [:id, :email, :role]), token: jwt_token, message: 'Logged in successfully' }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    render json: { message: 'Logged out successfully' }, status: :ok
  end


  private

  def generate_token(user_id)
    payload = {user_id: user_id}
    JWT.encode(payload,Rails.application.secret_key_base,'HS256')
  end

  def encode_token(user_id)
    JWT.encode({ user_id: user_id }, Rails.application.secret_key_base, 'HS256')
  end

  def set_cors_headers
    response.set_header('Access-Control-Allow-Origin', 'http://localhost:3001')
    response.set_header('Access-Control-Allow-Credentials', 'true')
    response.set_header('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept, Authorization, Token')
    response.set_header('Access-Control-Allow-Methods', 'GET, POST, PATCH, PUT, DELETE, OPTIONS')
  end
end
