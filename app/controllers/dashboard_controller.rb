class DashboardController < ApplicationController
  def index
    @total_tasks = Task.count
    @completed_tasks = Task.where(status: 'Done').count
    @in_progress_tasks = Task.where(status: 'In Progress').count

    @recent_activities = get_recent_activities
  end

  private

  def get_recent_activities
    # Get the 5 most recently created or updated tasks
    recent_tasks = Task.includes(:user)
                      .order(updated_at: :desc)
                      .limit(5)

    activities = []

    recent_tasks.each do |task|
      # Determine the action based on created vs updated timestamps
      if task.created_at == task.updated_at
        action = 'created'
      else
        action = case task.status
                when 'Done'
                  'completed'
                else
                  'updated'
                end
      end

      activities << {
        task_title: task.title,
        action: action,
        user_name: task.user.name,
        timestamp: task.updated_at
      }
    end

    activities
  end
end
