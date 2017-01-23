class ToDoItem < ApplicationRecord
  belongs_to :to_do_list
  enum status: [:undone, :done]
end
