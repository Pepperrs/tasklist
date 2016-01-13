require 'yaml'

class TodoList
  attr_reader :title, :items

  # methods and stuff go here
  # Initialize todo list with a title and no items
  def initialize(list_title = 'new List')
    @title = list_title
    @items = []
  end

  def rename(new_name)
    @title = new_name
  end

  # Creates a new Item and adds it to the array of Items
  def add_item(new_item, priority = 1)
    @items.push(Item.new(new_item, priority))
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
    @items[number - 1].completed_status = new_status
  end

  def update_priority(number, new_priority)
    @items[number - 1].priority = new_priority
  end

  def update_description(number, new_description)
    @items[number - 1].description = new_description
  end

  def print
    @items.sort! { |x, y| x.priority <=> y.priority }
    puts
    puts @title
    puts 'state | description | priority'
    @items.each(&:print_item)
  end

  def create_savefile
    { title: @title, items: @items }
  end

  # code for saving and loading has been learned from http://stackoverflow.com/a/4310299
  def save_to_file
    File.open('todo.txt', 'w') { |file| file.write(YAML.dump(create_savefile)) }
  end

  def load_from_file(file_name)
    savefile = YAML.load(File.read(file_name))
    @items = savefile[:items]
    @title = savefile[:title]
  end
end

class Item
  # methods and stuff go here
  attr_accessor :priority, :completed_status, :description
  def initialize(item_description, priority = 1)
    @description = item_description
    @completed_status = false
    @priority = priority
  end

  # Changes completion_status

  def mark_completed
    print @completed_status ? 'Done ' : '     '
  end

  def print_item
    print "#{mark_completed} | #{@description} | #{@priority}\n"
  end
end
