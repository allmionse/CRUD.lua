local crud = {}

crud.tasks = {}

-- Function to create a new task
function crud.create_task(description)
    table.insert(crud.tasks, { description = description, completed = false })
    print("Task created!")
end

-- Function to list all tasks
function crud.list_tasks()
    if #crud.tasks == 0 then
        return "No tasks."
    end

    local output = ""
    for i, task in ipairs(crud.tasks) do
        local status = task.completed and "[x]" or "[ ]"
        output = output .. i .. ". " .. status .. " " .. task.description .. "\n"
    end
    return output
end

-- Function to complete a task
function crud.complete_task(number)
    if crud.tasks[number] then
        crud.tasks[number].completed = true
        print("Task completed!")
    else
        print("Task not found.")
    end
end

-- Function to remove a task
function crud.remove_task(number)
    if crud.tasks[number] then
        table.remove(crud.tasks, number)
        print("Task removed!")
    else
        print("Task not found.")
    end
end

-- Function to display the menu
function crud.display_menu()
    while true do
        print("1. Create Task")
        print("2. List Tasks")
        print("3. Complete Task")
        print("4. Remove Task")
        print("5. Exit")
        local choice = io.read("*n")
        if choice == 1 then
            print("Enter task description:")
            local description = io.read()
            crud.create_task(description)
        elseif choice == 2 then
            print(crud.list_tasks())
        elseif choice == 3 then
            print("Enter task number to complete:")
            local number = io.read("*n")
            crud.complete_task(number)
        elseif choice == 4 then
            print("Enter task number to remove:")
            local number = io.read("*n")
            crud.remove_task(number)
        elseif choice == 5 then
            break
        else
            print("Invalid choice, please try again.")
        end
    end
end

return crud