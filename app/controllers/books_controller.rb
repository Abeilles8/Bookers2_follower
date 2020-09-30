class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @book = Book.new
    @books = Book.all

  end


  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have creatad book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end


  def show
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to book_path
    end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have update book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'edit'
    end
  end


  def destroy
    book = Book.find(params[:id]) 
    book.destroy 
    redirect_to books_path 
  end
  

  private
  def book_params
    params.require(:book).permit(:title, :body).merge(user_id: current_user.id)
  end

end
