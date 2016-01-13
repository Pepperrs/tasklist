class TodoList
  attr_reader :title, :items

  # methods and stuff go here
  # Initialize todo list with a title and no items
  def initialize(list_title)
    @title = list_title
    @items = [] # Starts empty! No Items yet!
  end

  def rename(new_name)
    @title = new_name
  end

  # Creates a new Item and adds it to the array of Items
  def add_item(new_item)
    @items.push(Item.new(new_item))
  end

def remove_item(removed_item)
  @items.delete(removed_item)
end


end

class Item
  # methods and stuff go here
  def initialize(item_description)
    @description = item_description
    @completed_status = false
  end
end
