class BooksController < ApplicationController

  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :categoryAll

  def index
    if params[:category]
      category_id = Category.find_by_name(params[:category]).id
      @books = Book.where(:category_id => category_id)
    else
      @books = Book.all
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @book = current_user.books.build
  end

  def create

    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def destroy
    if @book.destroy
      redirect_to root_path
    else
      render book_path(@book)
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :author, :category_id, :avatar)
  end

  def find_params
    @book = Book.find(params[:id])
  end

  def categoryAll
    @categories = Category.all.map { |a| [a.name, a.id] }
  end

end
