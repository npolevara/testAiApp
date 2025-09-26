class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.includes(:user)

    # Apply status filter
    if params[:status].present? && params[:status] != 'All'
      @tasks = @tasks.by_status(params[:status])
    end

    # Apply search filter
    if params[:search].present? && params[:search].length >= 3
      @tasks = @tasks.search_by_title(params[:search])
    end

    # Apply sorting
    case params[:sort]
    when 'created_date'
      @tasks = @tasks.order(created_at: params[:direction] == 'desc' ? :desc : :asc)
    when 'priority'
      # Custom priority sorting
      priority_order = case params[:direction]
                      when 'desc'
                        "CASE priority WHEN 'High' THEN 3 WHEN 'Medium' THEN 2 WHEN 'Low' THEN 1 END DESC"
                      else
                        "CASE priority WHEN 'High' THEN 3 WHEN 'Medium' THEN 2 WHEN 'Low' THEN 1 END ASC"
                      end
      @tasks = @tasks.order(Arel.sql(priority_order))
    else
      @tasks = @tasks.order(created_at: :desc)
    end

    @tasks = @tasks.all
    @users = User.all
    @filter_options = ['All', 'To Do', 'In Progress', 'Done']
  end

  def show
    @task_history = get_task_history(@task)
  end

  def new
    @task = Task.new
    @users = User.all
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      @users = User.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @users = User.all
  end

  def update
    # Handle quick status update from task show page
    if params[:task] && params[:task][:status] && params[:task].keys == ['status']
      if @task.update(status: params[:task][:status])
        redirect_to @task, notice: "Task status updated to #{params[:task][:status]}."
      else
        redirect_to @task, alert: 'Unable to update task status.'
      end
    else
      # Handle full form update from edit page
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        @users = User.all
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully deleted.'
  end



  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :priority, :user_id, :due_date)
  end

  def get_task_history(task)
    history = []

    # Add creation event
    history << {
      event: 'Task created',
      timestamp: task.created_at,
      user: task.user.name
    }

    # For demonstration purposes, we'll show some mock status changes
    # In a real app, you'd track these changes in an audit table
    if task.status != 'To Do'
      history << {
        event: "Status changed to #{task.status}",
        timestamp: task.updated_at,
        user: task.user.name
      }
    end

    # Sort by timestamp, newest first
    history.sort_by { |h| h[:timestamp] }.reverse
  end
end
