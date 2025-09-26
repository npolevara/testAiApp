# Task Management App

A comprehensive task management application built with Ruby on Rails 7. This application provides a complete solution for managing tasks and users with full CRUD functionality, filtering, searching, and real-time statistics.

## Features

### 5 Core Pages
1. **Dashboard** - Overview with statistics and recent activity
2. **Task List** - Filterable and searchable task management
3. **Create Task** - Form-based task creation with validation
4. **Task Detail** - Individual task view with edit capabilities and history
5. **User Management** - Complete user administration

### Key Functionality
- **CRUD Operations** for both tasks and users
- **Advanced Filtering** by task status (All, To Do, In Progress, Done)
- **Search Functionality** with minimum 3-character requirement
- **Sorting** by creation date and priority
- **Real-time Statistics** showing total, completed, and in-progress tasks
- **Task History Tracking** with timestamps and user actions
- **Form Validation** with client-side character counting
- **Responsive Design** with clean, modern UI

### Sample Data Included
- **4 Users**: John Developer, Sarah Designer, Mike QA, Lisa Manager
- **8 Tasks**: Covering various statuses and priorities across all team members

## Requirements

- Ruby 3.0+ 
- Rails 7.2+
- SQLite3 (included by default)

## Setup Instructions

### 1. Clone or Navigate to the Project
```bash
cd testai_app/task_management_app
```

### 2. Install Dependencies
```bash
bundle install
```

### 3. Setup Database
```bash
rails db:migrate
rails db:seed
```

### 4. Start the Application
```bash
rails server
```

The application will be available at `http://localhost:3000`

## Usage Guide

### Dashboard (Home Page)
- View summary statistics: total tasks, completed tasks, in-progress tasks
- See recent activity with the last 5 task updates
- Quick access to create new tasks

### Task Management
- **Task List**: View all tasks with filtering by status and search by title
- **Create Task**: Add new tasks with title, description, priority, assignee, and due date
- **Task Details**: View individual tasks with full history and quick status updates
- **Edit Tasks**: Modify all task properties including status changes

### User Management
- **User List**: View all users with role badges and task counts
- **Add Users**: Create new users with name, email, and role
- **Edit Users**: Modify user information and view their assigned tasks
- **Smart Deletion**: Prevents deletion of users with assigned tasks

## Technical Details

### Models
- **User**: Name, email, role (Developer/Designer/QA/Manager)
- **Task**: Title, description, status, priority, due date, assignee

### Validations
- **Task titles**: Required, 1-100 characters
- **Task descriptions**: Optional, max 500 characters  
- **User names**: Required, 1-50 characters
- **Email addresses**: Required, valid format
- **Due dates**: Cannot be in the past
- **Status/Priority**: Restricted to predefined values

### Key Features
- **Search**: Case-insensitive partial matching on task titles
- **Sorting**: Clickable column headers with direction indicators
- **Filtering**: Status dropdown with instant results
- **Statistics**: Real-time calculation from actual data
- **History**: Task creation and update tracking
- **Responsive**: Mobile-friendly design with Bootstrap-inspired CSS

## API Structure

### Routes
```
Root: GET /                     # Dashboard
Dashboard: GET /dashboard       # Dashboard page
Tasks: GET /tasks              # Task list with filtering/search
       GET /tasks/new          # New task form
       POST /tasks             # Create task
       GET /tasks/:id          # Task details
       GET /tasks/:id/edit     # Edit task form  
       PATCH /tasks/:id        # Update task
       DELETE /tasks/:id       # Delete task
Users: GET /users              # User management page
       POST /users             # Create user
       GET /users/:id/edit     # Edit user form
       PATCH /users/:id        # Update user
       DELETE /users/:id       # Delete user
```

## Data Schema

### Users Table
- `id` (primary key)
- `name` (string, required)
- `email` (string, required, unique)
- `role` (string, enum: Developer/Designer/QA/Manager)
- `created_at`, `updated_at`

### Tasks Table  
- `id` (primary key)
- `title` (string, required)
- `description` (text, optional)
- `status` (string, enum: To Do/In Progress/Done)
- `priority` (string, enum: Low/Medium/High) 
- `due_date` (date, optional)
- `user_id` (foreign key)
- `created_at`, `updated_at`

## Testing the Application

### Manual Testing Checklist
1. **Dashboard**: Verify statistics update when tasks change
2. **Task Creation**: Test form validation and required fields
3. **Task Filtering**: Test all status filters and search functionality
4. **Task Sorting**: Click column headers to test sorting
5. **Task Updates**: Test status changes and full edits
6. **User Management**: Test user creation, editing, and deletion restrictions
7. **Navigation**: Verify all navigation links work correctly

### Sample Workflow
1. Visit dashboard to see overview
2. Navigate to Tasks to view all tasks
3. Use filters to find specific tasks
4. Click on a task to view details
5. Edit task status or full details
6. Visit User Management to see team
7. Add a new user and assign tasks

## Project Structure
```
app/
├── controllers/
│   ├── dashboard_controller.rb    # Dashboard logic
│   ├── tasks_controller.rb        # Task CRUD operations
│   └── users_controller.rb        # User management
├── models/
│   ├── task.rb                    # Task model with validations
│   └── user.rb                    # User model with associations
└── views/
    ├── layouts/
    │   └── application.html.erb   # Main layout with navigation
    ├── dashboard/
    │   └── index.html.erb         # Dashboard page
    ├── tasks/                     # Task-related views
    └── users/                     # User management views
```

## Contributing

This is a demonstration project showcasing a complete Rails 7 application with modern best practices:

- RESTful routing patterns
- Model validations and associations  
- Responsive CSS without external frameworks
- Client-side JavaScript for enhanced UX
- Comprehensive error handling
- Clean, semantic HTML structure

## License

This project is created for demonstration purposes and educational use.