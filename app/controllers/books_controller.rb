class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user, only: [:edit, :update]
  # before_action :set_book
  

    def index
      @book = Book.new
      @books = Book.all

    end


    def create
      @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "You have creatad book successfully."
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        render 'index'
      end
    end


    def show
      @book = Book.find(params[:id])
      # redirect_to books_url if @book.blank?
    end


    def edit
      @book = Book.find(params[:id])
      # redirect_to books_path unless current_user.id == @book.user_id
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
    
    def baria_user
      # unless Book.find(params[:id]).user.id == current_user.id
      unless Book.find(params[:id]).user_id == current_user.id
        redirect_to books_path  
      end
    end

    # def set_book
    #   @book = current_user.books.find_by(id: params[:id])
    # end



end
