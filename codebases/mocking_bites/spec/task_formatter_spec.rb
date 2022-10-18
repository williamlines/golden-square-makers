require "task_formatter"

RSpec.describe TaskFormatter do
  context "Testing complete and incomplete tasks with TaskFormatter" do
    it "can format complete tasks correctly" do
      complete_task = double(:task, complete?: true, title: "DONE")
      task_formatter = TaskFormatter.new(complete_task)
      expect(task_formatter.format).to eq "[x] DONE"
    end
    it "can format incomplete tasks correctly" do
      incomplete_task = double(:task, complete?: false, title: "TODO")
      task_formatter = TaskFormatter.new(incomplete_task)
      expect(task_formatter.format).to eq "[ ] TODO"
    end
  end
end