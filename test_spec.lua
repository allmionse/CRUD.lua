require("busted.runner")()
local crud = require("crud")

-- Declare global variables for busted
describe = describe
before_each = before_each
it = it
assert = assert

describe("Task CRUD", function()
    before_each(function()
        crud.tasks = {}
    end)

    it("should create a new task", function()
        crud.create_task("Test task")
        assert.equals(1, #crud.tasks)
        assert.equals("Test task", crud.tasks[1].description)
        assert.equals(false, crud.tasks[1].completed)
    end)

    it("should list all tasks", function()
        crud.create_task("Test task 1")
        crud.create_task("Test task 2")
        local output = crud.list_tasks()
        assert.equals("1. [ ] Test task 1\n2. [ ] Test task 2\n", output)
    end)

    it("should complete a task", function()
        crud.create_task("Test task")
        crud.complete_task(1)
        assert.equals(true, crud.tasks[1].completed)
    end)

    it("should remove a task", function()
        crud.create_task("Test task")
        crud.remove_task(1)
        assert.equals(0, #crud.tasks)
    end)
end)