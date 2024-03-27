class TodosService
  class << self
    def get_all
      Todo.all
    end

    def get(id:)
      Todo.find(id)
    end

    def create(title:, order:)
      guid = SecureRandom.uuid
      todo = Todo.create(title: title, order: order, guid: guid)
      TodoEvents.created(todo: todo.slice(:guid, :title, :order).as_json)
      todo
    end

    def update(id:, title:, completed:, order:)
      Todo.update(id, title: title, completed: completed, order: order)
    end

    def delete(id:)
      Todo.destroy(id)
    end

    def delete_all
      Todo.destroy_all
    end
  end
end