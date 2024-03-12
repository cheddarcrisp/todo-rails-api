class Todo < ApplicationRecord
  def url
    "http://localhost:3000/todos/#{id}"
  end
end
