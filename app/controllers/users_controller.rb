class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.name = params[:user][:name]
      @user.password = params[:user][:password]
      @user.height = params[:user][:height]
      @user.happiness = params[:user][:happiness]
      @user.nausea = params[:user][:nausea]
      @user.tickets = params[:user][:tickets]

      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end


  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end

end
