require 'json'

class DataLoader
  def self.load_books(file_name, all_books)
    if File.exist?(file_name)
      books_data = File.read(file_name)
      books_array = JSON.parse(books_data)

      books_array.each do |book_hash|
        book = Book.new(book_hash['title'], book_hash['author'])
        all_books << book
      end
    else
      puts 'Books file not found. No books loaded.'
    end
  end

  def self.load_people(file_name, all_people)
    if File.exist?(file_name)
      people_data = File.read(file_name)
      people_array = JSON.parse(people_data)

      people_array.each do |person_hash|
        if person_hash.key?('specialization')
          teacher = Teacher.new(person_hash['age'], person_hash['specialization'], person_hash['name'])
          all_people << teacher
        else
          student = Student.new(person_hash['age'], person_hash['name'], parent_permission: person_hash['parent_permission'])
          all_people << student
        end
      end
    else
      puts 'People file not found. No people loaded.'
    end
  end

  def self.load_rentals(file_name, all_books, all_people, all_rentals)
    if File.exist?(file_name)
      rentals_data = File.read(file_name)
      rentals_array = JSON.parse(rentals_data)

      rentals_array.each do |rental_hash|
        book = all_books.find { |b| b.title == rental_hash['book_title'] }
        person = all_people.find { |p| p.name == rental_hash['person_name'] }
        rental_date = rental_hash['date']

        if book && person
          rental = Rental.new(book, rental_date, person)
          all_rentals << rental
        else
          puts 'No rental found. Some rentals could not be loaded due to missing books or people.'
        end
      end
    else
      puts 'Rentals file not found. No rentals loaded.'
    end
  end
end
