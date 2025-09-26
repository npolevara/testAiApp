class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  before_action :find_task
  before_action :find_comment, only: [:destroy]

  def index
    @comments = @task.comments.includes(:user).ordered
    
    respond_to do |format|
      format.json do
        formatted_comments = @comments.map do |comment|
          {
            id: comment.id,
            content: comment.content,
            user_name: comment.user.name,
            user_role: comment.user.role,
            created_at: comment.created_at.strftime("%B %d, %Y at %I:%M %p"),
            created_at_iso: comment.created_at.iso8601
          }
        end
        render json: formatted_comments
      end
    end
  end

  def create
    @comment = @task.comments.build(comment_params)
    # For now, we'll use the first user. In a real app, this would be current_user
    @comment.user = User.first
    
    respond_to do |format|
      format.json do
        if @comment.save
          render json: {
            id: @comment.id,
            content: @comment.content,
            user_name: @comment.user.name,
            user_role: @comment.user.role,
            created_at: @comment.created_at.strftime("%B %d, %Y at %I:%M %p"),
            created_at_iso: @comment.created_at.iso8601
          }, status: :created
        else
          render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      format.json do
        if @comment.destroy
          head :no_content
        else
          render json: { errors: ['Unable to delete comment'] }, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def find_task
    @task = Task.find(params[:task_id])
  end

  def find_comment
    @comment = @task.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
