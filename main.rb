require './app'
require 'json'

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

  def choice
    print '> '
    gets.chomp
  end
end



class Main
  def initialize(app)
    @app = app
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def run
    
    menu = Menu.new

    loop do
      menu.display
      choice = menu.choice

      case choice
      when '1' then @app.display_books
      when '2' then @app.display_persons
      when '3' then @app.create_person
      when '4' then @app.create_book
      when '5' then @app.create_rental
      when '6' then @app.display_rentals
      when '7'
        save_data
        break 
      else
        puts 'Invalid choice. Please select a valid option.'
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  
end



main = Main.new(App.new)
main.run