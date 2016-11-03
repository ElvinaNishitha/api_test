class Api::V1::MoviesController < ApplicationController
			def create
				@movie = Movie.new(movie_params)
				if @movie.save
					render json: {message: "Successfully created", data: @movie, status_code: 202}
				else
					render json: {message: "Failure", data: @movie.errors, status_code: 422}
				end
			end

			def update
				@movie = Movie.find_by_id(params[:id])
				@movie.update_attributes(movie_params)
				render json: {message: "Accepted", data: @movie, status_code: 202}
			end

			def show
				binding.pry
				@movie = Movie.find_by_title(params[:title])
				render json: {message: "OK", data: @movie, status_code: 200}
			end

			def delete
				@movie = Movie.find_by_id(params[:id])
				@movie.destroy
				render json: {message: "Accepted", data: @movie, status_code: 202}
			end
			private
			def movie_params
				params.require(:movie).permit(:title, :year, :rating, :language)
				
			end
		end