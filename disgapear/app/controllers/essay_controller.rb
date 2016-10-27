class EssayController < ApplicationController
	def index
	end

	def new
	end

	def show
		@essay= Essay.find(params[:id])
	end
end
