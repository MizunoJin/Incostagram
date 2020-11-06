class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { redirect_to request.referrer || micropost_path(@comment.micropost) }
        flash[:success] ='コメントを投稿しました!'
      else
        format.html { redirect_to micropost_path(@comment.micropost) }
        flash[:danger] ='コメントの投稿に失敗しました'
      end
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    respond_to do |format|
        format.html { redirect_to request.referrer || micropost_path(@comment.micropost) }
        format.js
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content, :micropost_id, :user_id, :parent_id)
  end

end
