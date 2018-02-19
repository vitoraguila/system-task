FactoryBot.define do
  factory :subtask do
    description   { FFaker::Lorem.sentence }
    task
    status { :open }
    subtask_date { FFaker::Time.date }
    subtask_hour { rand(24).to_s }
  end
end
 