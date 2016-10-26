class UsersController < ApplicationController
	def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:success] = "You have been Registered!"
        session[:user_id] = @user.id
        format.html { redirect_to home_index_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        # redirect_to root_path
      else
        flash[:danger] = @user.errors.full_messages.to_sentence
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }

        # render 'new'
      end
    end
  end

  def show
    @guide = User.find(params[:id])
    
  end

  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

end
