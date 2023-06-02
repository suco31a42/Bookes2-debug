class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @user = @book.user
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @booknew = Book.new
    if @comment.save
      flash.now[:notice] = 'コメントを投稿しました'
    else
      render 'books/show'
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy
    @book = Book.find(params[:book_id])
    # redirect_back(fallback_location: root_path)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end

