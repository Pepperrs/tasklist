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
    if removed_item.is_a?(String)
      @items.delete(removed_item)
    elsif removed_item.is_a?(Integer)
      @items.delete_at(removed_item - 1)
    else
      return nil
    end
  end

  # Updates completion of an item in @items
  def update_completion(number, new_status)
  puts @items.find{|item| number - 1}.change_status(new_status)
  end

  def print
    puts
    @items.each(&:print_item)
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
    @completed_status = new_status
  end

  def completed?
    @completion_status
  end

  def mark_completed
    print completed? ? 'x' : ' '
  end

  def print_item
    print "\n#{mark_completed} | #{@description}"
  end
end
