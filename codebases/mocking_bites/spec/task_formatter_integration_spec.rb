require "task_formatter"
require "task"

RSpec.describe "task_formatter and task integration" do
  it "can format a complete task" do
    complete_task = Task.new("DONE")
    task_formatter = TaskFormatter.new(complete_task)
    complete_task.mark_complete
    expect(task_formatter.format).to eq "[x] DONE"
  end
  it "can format an incomplete task" do
    incomplete_task = Task.new("TODO")
    task_formatter = TaskFormatter.new(incomplete_task)
    expect(task_formatter.format).to eq "[ ] TODO"
  end
  it "can format an initally incomplete task, and then format when complete" do
    task = Task.new("Walk the dog")
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "[ ] Walk the dog"
    task.mark_complete
    expect(task_formatter.format).to eq "[x] Walk the dog"
  end
end
