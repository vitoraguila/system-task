class Subtask < ApplicationRecord
  belongs_to :task
  
  enum status: [:active, :finished]

  validates :description, :task, :status, presence: true
end
