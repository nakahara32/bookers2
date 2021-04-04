class BooksController < ApplicationController
  def new
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id = current_user.id
    @books = Book.all
    if @book.save
      redirect_to book_path(@book.id), notice: "successfully"
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @books = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
    @user = current_user
    if @book.user!=current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path, notice: "successfully"
    else
      render:edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
