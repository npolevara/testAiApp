class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true, inclusion: { in: ['Developer', 'Designer', 'QA', 'Manager'] }

  def assigned_tasks_count
    tasks.count
  end
end
