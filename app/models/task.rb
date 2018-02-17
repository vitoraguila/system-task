class Task < ApplicationRecord
  belongs_to :user
  has_many :subtask, dependent: :destroy
  enum type: [:public_status, :private_status]
  enum status: [:active, :finished]

  validates :title, :description, :user, :subtask, :status, :type, :task_date, presence: true
end
