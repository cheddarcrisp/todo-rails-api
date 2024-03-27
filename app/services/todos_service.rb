class TodosService
  class << self
    def get_all
      Todo.all
    end

    def get(id:)
      Todo.find(id)
    end

    def create(title:, order:)
      Todo.create(title: title, order: order)
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