# Bash ToDo Program

This is a simple ToDo list program written in Bash. It allows you to manage tasks by adding, completing, removing, and searching tasks across incomplete, completed, and deleted task lists. The program also supports task priorities, due dates, and times.

## Features

- **Add New Tasks**: Add tasks with a title, description, priority (1 to 3), and deadline.
- **View Incomplete Tasks**: Displays all incomplete tasks from the `incomplete_tasks.txt` file.
- **Complete Tasks**: Move tasks from the incomplete list to the completed list (`completed_tasks.txt`).
- **View Completed Tasks**: Displays all tasks marked as completed.
- **Remove Tasks**: Removes tasks from the incomplete list and adds them to the deleted list (`deleted_tasks.txt`).
- **View Deleted Tasks**: Displays all deleted tasks.
- **Search Tasks**: Allows searching for tasks within incomplete, completed, or deleted lists by title or description.

## File Structure

- `incomplete_tasks.txt`: Stores all incomplete tasks.
- `completed_tasks.txt`: Stores all completed tasks.
- `deleted_tasks.txt`: Stores all deleted tasks.

## Task Format

Each task is stored in the following format:
```
priority|title|description|deadline
```

For example:
```
1|Finish project report|Complete the report by the deadline|2024-10-30 18:00
2|Read a book|Read 'Clean Code' for the upcoming class|2024-11-01 14:00
```

## Usage

1. Clone the repository.
2. Run the script using the following command:
   ```bash
   ./todo.sh
   ```
3. Follow the on-screen instructions to add, complete, remove, or search for tasks.

## Prerequisites

- Bash (Most Unix-based systems like Linux and macOS already have this installed).

## Contribution

Feel free to fork this repository, make improvements, and submit pull requests.
