require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {FactoryGirl.create(:user)}

  describe "#create_to_do_list" do

    it "should create a todo list for the user" do
      user.create_to_do_list("Groceries to shop")
      expect(user.to_do_lists.count).to eq 1
      expect(user.to_do_lists.first.name).to eq "Groceries to shop"
    end

    it "should not create a todo list without a name" do
      user.create_to_do_list(nil)  #it responds name cant be blank in the errors
      expect(user.to_do_lists.count).to eq 0
    end

  end

  describe "#add_task" do
    it "should create a new list and add the task if the list is not found" do
      user.add_task("Groceries to shop", "Buy Beer", "For Friends and party")
      expect(user.to_do_lists.count).to eq 1
      expect(user.to_do_lists.first.name).to eq "Groceries to shop"
      expect(user.to_do_lists.first.to_do_items.count).to eq 1
    end

    it "should add the task to list" do
      user.create_to_do_list("Sports")
      user.create_to_do_list("Skills")
      user.add_task("Skills", "Ruby", "An awesome language to learn")
      to_do_list = user.to_do_lists.find_by(name: "Skills")
      expect(to_do_list.to_do_items.count).to eq 1
    end

    it "should not add a task without a title" do
      user.create_to_do_list("Sports")
      user.add_task("Sports", nil, "A description")
      to_do_list = user.to_do_lists.find_by(name: "Sports")
      expect(to_do_list.to_do_items.count).to eq 0
    end
  end

  describe "#mark_task" do
    it "should modify the status of a task from undone to done" do
      user.create_to_do_list("Skills")
      task = user.add_task("Skills", "Ruby", "An awesome language to learn")
      to_do_list = user.to_do_lists.find_by(name: "Skills")
      user.mark_task("Skills", "Ruby")
      task.reload
      expect(task.done?).to be_truthy
    end
  end

  describe "#user_tasks" do
    it "should list all the user tasks" do
    end
  end

end
