require 'json'
require './app'

class StoringData
  def initialize(app)
    @app = app
  end

  def save_to_json(data, filename)
    File.open(filename, 'w') { |file| file.puts(JSON.generate(data)) }
  end

  def save_people_to_json
    people = @app.all_people.map do |person|
      data = {
        name: person.name,
        id: person.id,
        age: person.age
      }
  
      if person.is_a?(Student)
        data['type'] = 'Student'
        if person.parent_permission.is_a?(Hash)
          data['parent_permission'] = person.parent_permission[:parent_permission]
        else
          data['parent_permission'] = person.parent_permission
        end
      elsif person.is_a?(Teacher)
        data['type'] = 'Teacher'
        data['specialization'] = person.specialization
      end
  
      data
    end
  
    save_to_json(people, 'person.json')
  end
  
  

  def save_books_to_json
    books = @app.all_books.map { |book| { title: book.title, author: book.author } }
    save_to_json(books, 'books.json')
  end

  def save_rentals_to_json
    rentals = @app.all_rentals.map do |rental|
      {
        date: rental.date,
        person_name: rental.person.name,
        book_title: rental.book.title
      }
    end

    save_to_json(rentals, 'rentals.json')
  end

end
