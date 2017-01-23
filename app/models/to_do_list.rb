class ToDoList < ApplicationRecord
  belongs_to :user
  has_many :to_do_items

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user
end
