 #!/bin/bash

INCOMPLETE_FILE="incomplete_tasks.txt"
COMPLETED_FILE="completed_tasks.txt"
DELETED_FILE="deleted_tasks.txt"

initialize_files() {
    for file in "$INCOMPLETE_FILE" "$COMPLETED_FILE" "$DELETED_FILE"; do
        [[ ! -e "$file" ]] && touch "$file"
    done
}

add_task() {
    read -p "Enter task description: " task
    read -p "Enter priority (1-3): " priority
    if [[ ! $priority =~ ^[1-3]$ ]]; then
        echo "Invalid priority. Must be between 1 and 3."
        return
    fi
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$priority|$task|$timestamp" >> "$INCOMPLETE_FILE"
    echo "Added task: [$priority] $task ($timestamp)"
}

display_tasks() {
    local file=$1
    local list_name=$2
    if [[ -s "$file" ]]; then
        echo "$list_name:"
        cat "$file"
    else
        echo "No tasks found in $list_name."
    fi
}

complete_task() {
    display_tasks "$INCOMPLETE_FILE" "Incomplete Tasks"
    read -p "Enter task description to mark as completed: " task
    if grep -q "$task" "$INCOMPLETE_FILE"; then
        grep "$task" "$INCOMPLETE_FILE" >> "$COMPLETED_FILE"
        sed -i "/$task/d" "$INCOMPLETE_FILE"
        echo "Task marked as completed: $task"
    else
        echo "Task not found."
    fi
}

delete_task() {
    display_tasks "$INCOMPLETE_FILE" "Incomplete Tasks"
    read -p "Enter task description to delete: " task
    if grep -q "$task" "$INCOMPLETE_FILE"; then
        grep "$task" "$INCOMPLETE_FILE" >> "$DELETED_FILE"
        sed -i "/$task/d" "$INCOMPLETE_FILE"
        echo "Task deleted: $task"
    else
        echo "Task not found."
    fi
}

search_task() {
    read -p "Enter search term: " search_term
    echo "Searching for '$search_term'..."
    for file in "$INCOMPLETE_FILE" "$COMPLETED_FILE" "$DELETED_FILE"; do
        echo "Results in $(basename "$file"):"
        grep -i "$search_term" "$file" || echo "No matches found in $(basename "$file")."
    done
}


main_menu() {
    while true; do
        echo ""
        echo "------ To-Do List Program ------"
        echo "1. Add a new task"
        echo "2. Display incomplete tasks"
        echo "3. Mark task as completed"
        echo "4. Display completed tasks"
        echo "5. Delete a task"
        echo "6. Display deleted tasks"
        echo "7. Search tasks"
        echo "8. Exit"
        echo "------------------------------"
        read -p "Choose an option: " option

        case $option in
            1) add_task ;;
            2) display_tasks "$INCOMPLETE_FILE" "Incomplete Tasks" ;;
            3) complete_task ;;
            4) display_tasks "$COMPLETED_FILE" "Completed Tasks" ;;
            5) delete_task ;;
            6) display_tasks "$DELETED_FILE" "Deleted Tasks" ;;
            7) search_task ;;
            8) echo "Goodbye!"; exit 0 ;;
            *) echo "Invalid option. Try again." ;;
        esac
    done
}


initialize_files
main_menu
