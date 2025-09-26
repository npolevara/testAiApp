class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }

  scope :ordered, -> { order(:created_at) }
  scope :recent_first, -> { order(created_at: :desc) }
end
