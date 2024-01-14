class CoursesController < ApplicationController
    # before_action :authorize_request, except: [:index, :show]
    before_action :authorize_request
    def show
        user_id = params[:id]
        courses = Course.where(user_id: user_id)
      
        if courses.any?
          render json: courses, status: :ok
        else
          render json: { error: 'No courses for the signed-in teacher' }, status: :not_found
        end
    end


    def index
        courses = Course.includes(:teacher).all

        if courses.any?
        render json: courses, include: [:teacher], status: :ok
        else
        render json: { error: 'No courses available' }, status: :not_found
        end
    end
end
