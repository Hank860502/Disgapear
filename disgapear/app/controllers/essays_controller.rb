class EssaysController < ApplicationController
	def index
	end

	def new
		@essay = Essay.new
	end

	def create
    @essay = Essay.new(essay_params)
    @essay.user_id = current_user.id
    p '================'
    p @essay
    p '================'
    respond_to do |format|
      if @essay.save
        # session[:essay_id] = @essay.id
        format.html { redirect_to essays_path, notice: 'Essay was successfully created.' }
        format.json { render :show, status: :created, location: @essay }
        p '++++++++++++'
        p @essay
        p '++++++++++++'
        # redirect_to root_path
      else
        flash[:danger] = @essay.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @essay.errors, status: :unprocessable_entity }

        # render 'new'
      end
    end
  end

	def show
		@essay= Essay.find(params[:id])
	end

	private

	def essay_params
    params.require(:essay).permit(:user_id, :topic, :description, :content,:word_limit)
  end

end
