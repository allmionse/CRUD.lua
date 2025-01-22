local crud = require("crud")

-- Function to simulate user interaction
local function simulate_interaction()
    print("Welcome to the Task Manager!")
    
    -- Create tasks
    print("\nCreating tasks...")
    crud.create_task("Task 1")
    os.execute("sleep 1")
    crud.create_task("Task 2")
    os.execute("sleep 1")
    crud.create_task("Task 3")
    os.execute("sleep 1")
    
    -- List tasks
    print("\nListing tasks...")
    print(crud.list_tasks())
    os.execute("sleep 2")
    
    -- Complete a task
    print("\nCompleting task 2...")
    crud.complete_task(2)
    os.execute("sleep 1")
    
    -- List tasks after completing task 2
    print("\nListing tasks after completing task 2...")
    print(crud.list_tasks())
    os.execute("sleep 2")
    
    -- Remove a task
    print("\nRemoving task 1...")
    crud.remove_task(1)
    os.execute("sleep 1")
    
    -- List tasks after removing task 1
    print("\nListing tasks after removing task 1...")
    print(crud.list_tasks())
    os.execute("sleep 2")
    
    print("\nThank you for using the Task Manager!")
end

simulate_interaction()