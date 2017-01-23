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
      user.create_to_do_list(nil)
      expect(user.to_do_lists.count).to eq 0
    end

  end

  describe "#add_task" do
    it "should create a new list and add the task if the list  is not found" do
    end

    it "should add the task to list" do
    end

    it "should not add a task without a title" do
    end
  end

  describe "#mark_task" do
    it "should modify the status of a task from undone to done" do
    end
  end

  describe "#user_tasks" do
    it "should list all the user tasks" do
    end
  end

end
