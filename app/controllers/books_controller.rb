class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        title = params[:book][:title]
        author = params[:book][:author]
        price = params[:book][:price]
        # date
        published = params[:book][:published]
        begin
            @book = Book.new(
                title: title,
                author: author,
                price: price,
                published: published
            )
            if @book.save
                redirect_to books_path, notice: "Book created successfully."
            else
                render :new
            end
        rescue
            render :new
        end
    end
def edit
    @book = Book.find(params[:id])
end

def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        redirect_to books_path, notice: "Book updated successfully."
    else
        render :edit
    end
end

def show
    @book = Book.find(params[:id])
end

def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book deleted successfully."
end

private

def book_params
    params.require(:book).permit(
        :title,
        :author,
        :price,
        :published
    )
end
end
