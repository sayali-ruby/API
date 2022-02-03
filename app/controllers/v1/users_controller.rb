class V1::UsersController < ApplicationController

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
            render json: {email: @user.mail }
        else
            render json: {message: "User not found"}
        end  
     end

      def destroy
        @user.destroy
        if@user = User.find_by(email: params[:id])
            render json: { message:"user deleted"}
        else
            render json: {message:"user not found"}
        end
    end
    private
  
      def user_params
        params.require(:user).permit(:email)
        end
end

