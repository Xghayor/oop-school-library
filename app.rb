require './person'
require './student'
require './teacher'
require './book'
require './rental'

class App
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
    puts 'Student Created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    special = gets.chomp

    teacher = Teacher.new(age, special, name)
    @all_people << teacher
    puts 'Teacher Created successfully'
  end

  def display_books
    if @all_books.empty?
      puts 'No books available.'
    else
      @all_books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def display_persons
    @all_people.each_with_index do |p, index|
      if p.is_a?(Student)
        puts "#{index}) [Student] Name: #{p.name}, Age: #{p.age}"
      elsif p.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{p.name}, Age: #{p.age}, Specialization: #{p.specialization}"
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

    puts 'Rental created'
  end

  def all_rentals
    display_persons
    print 'Enter the number of the person: '
    person_index = gets.chomp.to_i

    if person_index.negative? || person_index >= @all_people.length
      puts 'Invalid person selection.'
      return
    end

    selected_person = @all_people[person_index]

    rentals_for_person = @all_rentals.select { |rental| rental.person == selected_person }

    if rentals_for_person.empty?
      puts "No rentals found for #{selected_person.name}."
    else
      puts "ID of person #{selected_person.id}:"
      rentals_for_person.each do |rental|
        puts 'Rentals For:'
        puts "Book: #{rental.book.title} by #{rental.book.author} Rental Date: #{rental.date}"
      end
    end
  end
end
