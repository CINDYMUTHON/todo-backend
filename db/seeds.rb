# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "creating users"
10.times do
    user = User.create(
      username: Faker::Internet.username,
      password: Faker::Internet.password,
      email: Faker::Internet.email
    #   email: Faker::Internet.gender
    )
    puts "creating tasks"
  end
    task1 = Task.create(task_name: 'TFC', task_description: 'Tehilla tea farm', task_status: 'complete')
    task1 = Task.create(task_name: 'CDH', task_description: 'cee dines hotel', task_status: 'complete')
    task3 = Task.create(task_name: 'APC', task_description: 'Avocado plants ', task_status: 'incomplete')
    task4 = Task.create(task_name: 'MIC', task_description: 'mark miller on',  task_status:  'incomplete')
    task5 = Task.create(task_name: 'CCI', task_description: 'climate change ', task_status: 'complete')

    puts "done seeding"