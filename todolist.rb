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

  # Deletes an Item in the array of Items
  def remove_item(removed_item)
    @items.delete(removed_item)
  end

# Updates completion of an item in @items
  def update_completion(item, new_status)
    @items.find(item).change_status(new_status)
  end
end

class Item
  # methods and stuff go here
  def initialize(item_description)
    @description = item_description
    @completed_status = false
  end

# Changes completion_status
  def change_status(new_status)
    @completed_status = new_status.to_b
  end
end
