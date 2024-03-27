class TodoEvents
  class << self
    def created(todo:)
      # Publish creation event to enterprise bus so we can make the big bucks
      puts "Todo create: #{todo}"
    end
  end
end