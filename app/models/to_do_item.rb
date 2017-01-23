class ToDoItem < ApplicationRecord
  belongs_to :to_do_list
  enum status: [:undone, :done]

  validates :title, presence: true
  validates_uniqueness_of :title, scope: :to_do_list
end
