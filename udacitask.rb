require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new('Things to Learn')
# Add four new items
list.add_item('make a List')
list.add_item('print the List')
list.add_item('complete an item')
list.add_item('save the List')
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
list.rename('new Name')
# Print the list
list.print
