require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  it "returns tasks with all" do
    task_list = TaskList.new
    task_1 = double(:task_1)
    task_2 = double(:task_2)
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end
  
  it "can return false if not all tasks complete with .all_complete" do
    task_list = TaskList.new
    task_1 = double(:task_1, complete?: false)
    task_2 = double(:task_2, complete?: true)
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all_complete?).to be false
  end
  it "can return true if all tasks complete with .all_complete" do
    task_list = TaskList.new
    task_1 = double(:task_1, complete?: true)
    task_2 = double(:task_2, complete?: true)
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all_complete?).to be true
  end
  # Unit test `#all` and `#all_complete?` behaviour
end
