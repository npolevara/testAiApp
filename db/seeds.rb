# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
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
Task.create!(
  title: "Setup project structure",
  description: "Initial project setup and structure creation",
  status: "To Do",
  priority: "High",
  user: john
)

Task.create!(
  title: "Design login page mockup",
  description: "Create visual mockup for the login page design",
  status: "In Progress",
  priority: "Medium",
  user: sarah
)

Task.create!(
  title: "Write user authentication tests",
  description: "Develop comprehensive test suite for user authentication",
  status: "To Do",
  priority: "High",
  user: mike
)

Task.create!(
  title: "Review sprint planning",
  description: "Review and finalize the current sprint planning session",
  status: "Done",
  priority: "Low",
  user: lisa
)

Task.create!(
  title: "Implement user registration API",
  description: "Build API endpoints for user registration functionality",
  status: "In Progress",
  priority: "High",
  user: john
)

Task.create!(
  title: "Create color palette and typography guide",
  description: "Establish consistent visual design standards",
  status: "Done",
  priority: "Medium",
  user: sarah
)

Task.create!(
  title: "Setup automated testing pipeline",
  description: "Configure CI/CD pipeline for automated testing",
  status: "To Do",
  priority: "Medium",
  user: mike
)

Task.create!(
  title: "Prepare quarterly review presentation",
  description: "Compile quarterly metrics and prepare presentation materials",
  status: "In Progress",
  priority: "Low",
  user: lisa
)

puts "Created #{User.count} users and #{Task.count} tasks"
