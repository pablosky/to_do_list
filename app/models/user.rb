class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :to_do_lists

  validates :email, :password, presence: true
  validates_uniqueness_of :email, scope: :user

  def create_to_do_list(name)
    self.to_do_lists << ToDoList.create(name: name)
  end

  def add_task(list_name, task_title, task_description, start_date, end_date)
    list = todo_lists.where(name: list_name).first
    list = create_to_do_list(list_name) unless list.present? #create a new list if not found
    list.to_do_items << ToDoItem.new(title: task_title, description: task_description, start_date: start_date, end_date: end_date)
    list.save!
  end

  def mark_task(list_name, task_title)
    list = todo_lists.where(name: list_name).first
    todo_item = ToDoItem.where(to_do_list: list, title: task_title).first
    todo_item.done! if todo_item.present?
  end

end
