class Task < ApplicationRecord
  before_validation :set_status, on: :create

  belongs_to :user
  has_many :subtask, dependent: :destroy
  enum type_status:  { "public_status" => 0, "private_status" => 1 }
  enum status: { "open" => 0, "finished" => 1 }

  validates :title, :description, :status, :user, :type_status, :task_date, presence: true

  # Scopes for filters
  scope :recent,   ->{where("type_status = 0").order("task_date ASC") }
  scope :mytasks,  ->(current_user, quantity = 100) { where("user_id = ?", current_user).limit(quantity).order("task_date ASC") }
  scope :alltasks, ->{where("type_status = 0").order("task_date ASC")}


  private

  def set_status
    self.status = :open
  end
end
