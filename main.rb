require './app'

def main
app = App.new
loop do
  puts 'Please choose an option by entering a number:'

  puts '1 - Create Book'
  puts '2 - Create Person'
  puts '3 - Create Rental'
  puts '4 - List all Books'
  puts '5 - List all People'
  puts '6 - List Rentals for a Person'
  puts '7 - Exit'
  print ''
  choice = gets.chomp

  case choice
  when '1'
    app.create_book
  when '2'
    app.create_person
  when '3'
    app.create_rental
  when '4'
    app.display_books
  when '5'
    app.display_persons
  when '6'
    app.all_rentals
  when '7'
    puts 'Thanks for using our app. See you soon.'
  else
    puts 'Invalid choice. Please select a valid option.'
  end
end
end

main();