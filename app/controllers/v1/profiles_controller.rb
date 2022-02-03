class ProfilesController < ApplicationController

  def index
    render json: Profile.new.map{|profile| {first_name: profile.first_name,last_name: profile.last_name, age: profile.age, user_id: profile.user_id}}
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      render json: Profile.all.map{|profile| {first_name: profile.first_name,last_name: profile.last_name, age: profile.age, user_id: profile.user_id}}
    else
      render json: { message: @profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @profile = Profile.find_by(first_name: params[:id])
    if @profile
      render json: {first_name: profile.first_name,last_name: profile.last_name, age: profile.age, user_id: profile.user_id}
    else
      render json: {message: "profile not found"}
    end
  end

  def destroy
    @profile = Profile.find_by (id: params[:id])
    if @profile.destroy
      render json: {message: "profile deleted"}
    else
      render json: {message: "profile not found"}
    end
  end
end

private
  def profile_params
    params.require(:profile).permit(:first_name,:last_name,:age,:user_id)
  end