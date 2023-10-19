require './person'
require './student'
require './teacher'
require './book'
require './rental'
require 'json'
require './store'

class App
  attr_accessor :all_books, :all_people, :all_rentals

  def initialize
    @all_books = []
    @all_people = []
    @all_rentals = []
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @all_books << book
    save_data('books.json', @all_books)
    puts 'Book Created Successfully'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    number = gets.chomp

    case number
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Please enter 1 for student or 2 for teacher.'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission_input = gets.chomp
    permission = permission_input.downcase == 'y'

    student = Student.new(age, name, parent_permission: permission)
    @all_people << student
    save_data('persons.json', @all_people)
    puts 'Student Created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    special = gets.chomp

    teacher = Teacher.new(age, name, special)
    @all_people << teacher
    save_data('persons.json', @all_people)
    puts 'Teacher Created successfully'
  end

  def display_books
    @all_books = read_data('books.json')

    if @all_books.empty?
      puts 'No books available.'
    else
      @all_books.each_with_index do |book, index|
        puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
      end
    end
  end

  def display_persons
    @all_people = read_data('persons.json')

    if @all_people.empty?
      puts 'No persons available.'
    else
      @all_people.each_with_index do |p, i|
        if p.key?('specialization')
          puts "#{i}) [Teacher] Name: #{p['name']}, Age: #{p['age']}, Specialization: #{p['specialization']}"
        else
          puts "#{i}) [Student] Name: #{p['name']}, Age: #{p['age']}"
        end
      end
    end
  end

  def create_rental
    puts 'Select a book from the list by number'
    display_books
    select_index = gets.chomp.to_i

    selected_book = @all_books[select_index]

    puts 'Select a person from the list of people by number (not ID):'
    display_persons
    select_person_index = gets.chomp.to_i

    if select_person_index.negative? || select_person_index >= @all_people.length
      puts 'Invalid person selection.'
      return
    end

    selected_person = @all_people[select_person_index]

    print 'Date: '
    rental_date = gets.chomp

    rental = Rental.new(selected_book, rental_date, selected_person)
    @all_rentals << rental
    save_data('rentals.json', @all_rentals)
    puts 'Rental created'
  end

  def display_rentals
    @all_rentals = read_data('rentals.json')

    display_persons
    print 'Enter the number of the person: '
    person_index = gets.chomp.to_i

    if person_index.negative? || person_index >= @all_people.length
      puts 'Invalid person selection.'
      return
    end

    selected_person = @all_people[person_index]

    if selected_person.nil?
      puts 'Selected person not found.'
      return
    end

    puts "Person ID: #{selected_person['id']}"

    puts 'Rentals'
    @all_rentals.each do |rental|
      if rental['person_id']['id'] == selected_person['id']
        puts "Date: #{rental['date']}, Book: \"#{rental['book']['title']}\" by #{rental['book']['author']}"
      end
    end
  end
end
