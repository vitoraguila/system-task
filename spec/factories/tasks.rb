FactoryBot.define do
  factory :task do
    title         { FFaker::Lorem.word }
    description   { FFaker::Lorem.sentence }
    user 
    status        { :active }
    type        { :public_status } 
    task_date { FFaker::Time.date }
    task_hour { rand(24).to_s }
  end
end
