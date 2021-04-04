class UsersController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @books = Book.all
    if @book.save
      redirect_to book_path(@book.id), notice: "successfully"
    else
      render action: :show
    end
  end

  def index
    @users = User.all
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
     @user = User.find(params[:id])
     @books = @user.books.all
     @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user==current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "successfully"
    else
      render:edit
    end
  end

  def destroy
    Book.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
