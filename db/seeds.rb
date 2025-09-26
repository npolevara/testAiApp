# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
Comment.destroy_all
Task.destroy_all
User.destroy_all

# Create Users (exactly 4 as required)
john = User.create!(
  name: "John Developer",
  email: "john@company.com",
  role: "Developer"
)

sarah = User.create!(
  name: "Sarah Designer",
  email: "sarah@company.com",
  role: "Designer"
)

mike = User.create!(
  name: "Mike QA",
  email: "mike@company.com",
  role: "QA"
)

lisa = User.create!(
  name: "Lisa Manager",
  email: "lisa@company.com",
  role: "Manager"
)

# Create Tasks (exactly 8 as required)
task1 = Task.create!(
  title: "Setup project structure",
  description: "Initial project setup and structure creation",
  status: "To Do",
  priority: "High",
  user: john
)

task2 = Task.create!(
  title: "Design login page mockup",
  description: "Create visual mockup for the login page design",
  status: "In Progress",
  priority: "Medium",
  user: sarah
)

task3 = Task.create!(
  title: "Write user authentication tests",
  description: "Develop comprehensive test suite for user authentication",
  status: "To Do",
  priority: "High",
  user: mike
)

task4 = Task.create!(
  title: "Review sprint planning",
  description: "Review and finalize the current sprint planning session",
  status: "Done",
  priority: "Low",
  user: lisa
)

task5 = Task.create!(
  title: "Implement user registration API",
  description: "Build API endpoints for user registration functionality",
  status: "In Progress",
  priority: "High",
  user: john
)

task6 = Task.create!(
  title: "Create color palette and typography guide",
  description: "Establish consistent visual design standards",
  status: "Done",
  priority: "Medium",
  user: sarah
)

task7 = Task.create!(
  title: "Setup automated testing pipeline",
  description: "Configure CI/CD pipeline for automated testing",
  status: "To Do",
  priority: "Medium",
  user: mike
)

task8 = Task.create!(
  title: "Prepare quarterly review presentation",
  description: "Compile quarterly metrics and prepare presentation materials",
  status: "In Progress",
  priority: "Low",
  user: lisa
)

# Create sample comments
Comment.create!(
  content: "I think we should use Rails 7 for this project structure. It has some great new features.",
  task: task1,
  user: lisa,
  created_at: 2.hours.ago
)

Comment.create!(
  content: "Good point! I'll set up the initial structure with Rails 7 and add the necessary gems.",
  task: task1,
  user: john,
  created_at: 1.hour.ago
)

Comment.create!(
  content: "Looking great! I've reviewed the mockup and have a few suggestions for the login form layout.",
  task: task2,
  user: mike,
  created_at: 3.hours.ago
)

Comment.create!(
  content: "Thanks for the feedback! I'll incorporate those changes and update the mockup.",
  task: task2,
  user: sarah,
  created_at: 2.hours.ago
)

Comment.create!(
  content: "Should we include integration tests for the OAuth authentication flow as well?",
  task: task3,
  user: john,
  created_at: 4.hours.ago
)

Comment.create!(
  content: "Yes, definitely! OAuth is a critical part of our auth system.",
  task: task3,
  user: mike,
  created_at: 3.hours.ago
)

Comment.create!(
  content: "Sprint planning went well! Next sprint we'll focus on the authentication features.",
  task: task4,
  user: lisa,
  created_at: 1.day.ago
)

Comment.create!(
  content: "The API structure looks solid. I'm implementing the validation logic now.",
  task: task5,
  user: john,
  created_at: 30.minutes.ago
)

Comment.create!(
  content: "Love the color palette! The blue tones work perfectly with our brand.",
  task: task6,
  user: lisa,
  created_at: 6.hours.ago
)

puts "Created #{User.count} users, #{Task.count} tasks, and #{Comment.count} comments"
