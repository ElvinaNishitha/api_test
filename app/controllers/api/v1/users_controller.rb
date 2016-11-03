		class Api::V1::UsersController < ApplicationController
			def create
				@user = User.new(user_params)
				if @user.save
					render json: {message: "Successfully created", data: @user, status_code: 202}
				else
					render json: {message: "Failure", data: @user.errors, status_code: 422}
				end
			end

			def update
				@user = User.find_by_id(params[:id])
				@user.update_attributes(user_params)
				render json: {message: "Accepted", data: @user, status_code: 202}
			end

			def show
				binding.pry
				@user = User.find_by_name(params[:name])
				render json: {message: "OK", data: @user, status_code: 200}
			end

			private
			def user_params
				params.require(:user).permit(:name, :age, :role, :gender)
				
			end
		end