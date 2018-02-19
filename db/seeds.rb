puts "Register Standard user"

User.create!(
  name: "Test Avenue Code", 
  email: "teste@teste.com.br",  
  password: "123456"
)

puts "Standard user registered with success"

###########################################

puts "Register tasks of user standard"

100.times do
  Task.create!(
    title: FFaker::Lorem.word, 
    description: FFaker::Lorem.sentence, 
    user: User.all.first,
    status: [0,1].sample,
    type_status: [0,1].sample, 
    task_date: FFaker::Time.date,
    task_hour: rand(24).to_s
  )   
end

puts "Tasks of user standard registered with success"

###########################################

puts "Register subtasks of user standard"

300.times do
  Subtask.create!(
    description: FFaker::Lorem.sentence,
    task: Task.all.sample,
    status: [0,1].sample,
    subtask_date: FFaker::Time.date,
    subtask_hour: rand(24).to_s
  )   
end

puts "Subtasks of user standard registered with success"

###########################################

puts "Register Others users"

100.times do
  User.create!(
    name: FFaker::Lorem.word, 
    email: FFaker::Internet.email,  
    password: "123456"
  )
end

puts "Others users registered with success"

###########################################

puts "Register tasks of others users"

400.times do
  Task.create!(
    title: FFaker::Lorem.word, 
    description: FFaker::Lorem.sentence, 
    user: User.all.sample,
    status: [0,1].sample,
    type_status: [0,1].sample, 
    task_date: FFaker::Time.date,
    task_hour: rand(24).to_s
  )   
end

puts "Tasks of others users registered with success"

###########################################

puts "Register subtasks of ohers users"

800.times do
  Subtask.create!(
    description: FFaker::Lorem.sentence,
    task: Task.all.sample,
    status: [0,1].sample,
    subtask_date: FFaker::Time.date,
    subtask_hour: rand(24).to_s
  )   
end

puts "Subtasks of others users  registered with success"

###########################################
