require "test_helper"

class TodosServiceTest < ActiveSupport::TestCase
  test "get_all should return all todos" do
    todos = TodosService.get_all
    assert_equal [todos(:one), todos(:two)], todos.sort_by { |x| x[:order] }
  end

  test "get should return todo" do
    todo = TodosService.get(id: todos(:one)[:id])
    assert_equal todos(:one), todo
  end

  test "create should create todo" do
    todo = TodosService.create(title: "New title", order: 3)
    expected = Todo.new(
      id: todo[:id],
      title: "New title",
      completed: false,
      order: 3
    )
    assert_equal expected, todo
    todo = Todo.last
    assert_equal expected, todo
  end

  test "update should modify todo" do
    one = todos(:one)
    todo = TodosService.update(id: one[:id], title: "New title",
      completed: true, order: 10)
    
    expected = Todo.new(
      id: one[:id],
      title: "New title",
      completed: true,
      order: 10
    )

    assert_equal expected, todo
    todo = Todo.find(one[:id])
    assert_equal expected, todo
  end

  test "delete should delete todo" do
    TodosService.delete(id: todos(:two)[:id])

    assert_equal [todos(:one)], Todo.all
  end

  test "delete_all should delete all todos" do
    TodosService.delete_all
    assert_equal 0, Todo.count
  end
end
