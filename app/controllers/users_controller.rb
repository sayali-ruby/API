class UsersController < ApplicationController

    def index
        render json: User.all.map{|user| {email: user.email}}
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
            render json: User.all.map{|user| {email: user.email}}
        else
            render json: { message: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def show
        @user = User.find_by(email: params[:id])
        if @user
            render json: User.all.map{|user| {email: user.email}}
        else
            render json: {message: "User not found"}
        end  
     end
end
