class BooksController < ApplicationController
  def index
  	@book = Book.new
  	@books = Book.all.order("id")
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  	book = Book.new(book_params)
  	flash[:notice] = "Book was successfully created." if book.save
  	redirect_to book_path(book)
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	flash[:notice] = "Book was successfully updated" if book.update(book_params)
  	redirect_to book_path(book.id)
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
