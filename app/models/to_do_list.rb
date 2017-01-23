class ToDoList < ApplicationRecord
  belongs_to :user
  has_many :to_do_items
end
