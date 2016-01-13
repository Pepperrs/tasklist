require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new('Old List')
# Add four new items
list.add_item('item 1')
list.add_item('item 2')
list.add_item('item 3')
list.add_item('item 3')
# Print the list
list.print
# Delete the first item
list.remove_item(1)
# Print the list
list.print
# Delete the second item
list.remove_item(2)
# Print the list
list.print
# Update the completion status of the first item to complete
list.update_completion(1, true)
# Print the list
list.print
# Update the title of the list
list.rename_title('New List')
# Print the list
list.print
# Change priority
list.update_priority(1, 5)
# Print the list
list.print
# Add items with priorities
list.add_item('item a', 3)
list.add_item('item b', 2)
# Print the list
list.print
# Save the List
list.save_to_file
# Load a new instance of that List
savedList = TodoList.new
savedList.load_from_file('todo.txt')
puts 'We have now loaded our List. We will rename it to show the difference'
# Rename savedList
savedList.rename_title('Saved List')
# Print the new List
savedList.print
# We can also change the name of an item to make the change more visibke.
savedList.update_description(1, 'renamed Task')
# lets print both Lists for comparision
savedList.print
list.print
