class UsersController < ApplicationController
  # before_action :authorize_user
  before_action :authorize_request
  # , except: [:create]
  def index
    user = User.all.order(created_at: :desc)
    render json: user
  end

  def create
    # puts "Received parameters: #{params.inspect}"
    # puts "User params: #{user_params.inspect}"

    user = User.create!(email:params["email"],password:params["password"],role:params["role"]) 
    if user.valid?
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    email = params[:email]
    user = User.find_by(email: email)
    puts "user params: #{user.inspect}"
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head :no_content
  end

  private

  def authorize_user
    authorize User
  end
end
