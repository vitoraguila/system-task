class Subtask < ApplicationRecord
  before_validation :set_status, on: :create
  belongs_to :task
  
  enum status: { "open" => 0, "finished" => 1 }

  validates :description, :task_id, :status, presence: true

  def set_status
    self.status = :open
  end
end
