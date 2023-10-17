require './app'

class Menu 
  def display
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all persons'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def get_choice
    print '> '
    gets.chomp
  end
end

# rubocop:disable Metrics/CyclomaticComplexity


