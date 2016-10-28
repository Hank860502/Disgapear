class EssaysController < ApplicationController
	def index
	end

	def new
		@essay = Essay.new
	end

	def create
    @essay = Essay.new(essay_params)
    @essay.user_id = current_user.id
    respond_to do |format|
      if @essay.save
        # session[:essay_id] = @essay.id
        format.html { redirect_to essay_path(@essay), notice: 'Essay was successfully created.' }
        format.json { render :show, status: :created, location: @essay }
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
    @user= User.find(@essay.user_id)
	end

  def edit
    p "+++++++"
    @essay=Essay.find(params[:id])
  end

  def update
    p "=========="
    @essay= Essay.find(params[:id])
    @essay.revision = "dsfdsf"
    @essay.save
    redirect_to essay_path(@essay)
  end

	private

	def essay_params
    params.require(:essay).permit(:user_id, :topic, :description, :content,:word_limit)
  end

end
