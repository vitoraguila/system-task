class Task < ApplicationRecord
  before_validation :set_status, on: :create

  belongs_to :user
  has_many :subtask, dependent: :destroy
  enum type_status: [:public_status, :private_status]
  enum status: [:active, :finished]

  validates :title, :description, :status, :user, :type_status, :task_date, presence: true

  private

  def set_status
    self.status = :active
  end
end
