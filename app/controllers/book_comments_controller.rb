class BookCommentsController < ApplicationController
  def create
    # createアクションを実行するときにどの本に保存するか
    book = Book.find(params[:book_id])
    # コメントするための空の箱を作る(下記の短縮形)
    # comment =BookComment.new(book_comment_params)
    # comment.user_id = current_user.id
    comment = current_user.book_comments.new(book_comment_params)
    # コメントされた本のIDは今表示されている本のIDである
    comment.book_id = book.id
    # コメントを保存する
    comment.save
    @book = comment.book
    # リダイレクト先を指定
    redirect_to book_path(book.id)
  end

  def destroy
    # ユーザーのIDと本のIDで結びつけられたある1件を探し出す
    @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    # その1件を消す
    @book_comment.destroy
    # リダイレクト先を指定する
    redirect_to book_path(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
