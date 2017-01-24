class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :to_do_lists

  validates :email, :password, presence: true
  validates_uniqueness_of :email

  #In the first 2 methods am returning an object to handle the error messages

  def create_to_do_list(name)
    ToDoList.create(name: name, user_id: id)
  end

  def add_task(list_name, task_title, task_description, start_date = Date.today, end_date = Date.today)
    list = to_do_lists.find_by(name: list_name)
    list = create_to_do_list(list_name) unless list.present? #create a new list if not found
    ToDoItem.create(to_do_list: list, title: task_title, description: task_description, start_date: start_date, end_date: end_date)
  end

  def mark_task(list_name, task_title)
    list = to_do_lists.find_by(name: list_name)
    todo_item = ToDoItem.where(to_do_list: list, title: task_title).first if list
    todo_item.done! if todo_item.present?
  end

  def user_tasks
  
  end

end
