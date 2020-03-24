class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:content, :topic_id))
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topics_path, success: "コメントに成功しました"
    else
      redirect_to topics_path, danger: "コメントに失敗しました"
    end
  end
end