class Task < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :description, length: { maximum: 500 }, allow_blank: true
  validates :status, presence: true, inclusion: { in: ['To Do', 'In Progress', 'Done'] }
  validates :priority, presence: true, inclusion: { in: ['Low', 'Medium', 'High'] }

  validate :due_date_cannot_be_in_past

  scope :by_status, ->(status) { where(status: status) if status.present? && status != 'All' }
  scope :search_by_title, ->(query) { where("title LIKE ?", "%#{query}%") if query.present? && query.length >= 3 }

  def self.statuses
    ['To Do', 'In Progress', 'Done']
  end

  def self.priorities
    ['Low', 'Medium', 'High']
  end

  def priority_order
    case priority
    when 'High' then 3
    when 'Medium' then 2
    when 'Low' then 1
    else 0
    end
  end

  private

  def due_date_cannot_be_in_past
    return unless due_date.present?

    if due_date < Date.current
      errors.add(:due_date, "can't be in the past")
    end
  end
end
