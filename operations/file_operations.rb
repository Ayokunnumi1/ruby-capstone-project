require_relative '../classes/book'
require_relative '../classes/label'
require 'json'


class FileOperations
    attr_accessor :books, :labels

    def initialize(books, labels)
        @books = books
        @labels = labels
    end

    def add_new_book
    puts 'Add a new book'
    puts ''
    puts 'Enter the publisher of book?'
    publisher = gets.chomp
    puts ''
    puts 'Enter Cover State of book? Enter(good) or (bad)'
    cover_state = gets.chomp
    puts ''
    print 'Is the book archived? Enter (true) or (false)'
    archived = gets.chomp
    puts ''
    puts 'Enter date of publishing the book Format("YYYY-MM-DD)'
    publish_date = gets.chomp
    added_book = Book.new(publisher, cover_state, publish_date, archived)
    books.push({ id: added_book.id, publisher: added_book.publisher, cover_state: added_book.cover_state,
                 archived: added_book.archived, publish_date: added_book.publish_date })
    save_json_data('books.json', books)
    puts 'New Book added successfully'
  end

  def list_all_books
    if books.empty?
      puts 'No books added yet'
      puts 'Choose option 3 to add a new book'
    else
      puts 'Listed books'
      books.each do |book|
        puts "id:#{book['id'] || book[:id]}"
        puts "publisher: #{book['publisher'] || book[:id]}"
        puts "cover_state: #{book['cover_state'] || book[:cover_state]}"
        puts "archived:#{book['archived'] || book[:archived]}"
        puts "published_date:#{book['publish_date'] || book[:publish_date]}"
        puts ''
      end
    end
  end

  def add_new_label
    puts 'Add a new label'
    puts ''
    puts 'Enter the title of label?'
    title = gets.chomp
    puts ''
    puts 'Enter Color of label?'
    color = gets.chomp
    puts ''
    added_label = Label.new(title, color)
    labels.push({ id: added_label.id, title: added_label.title, color: added_label.color })
    save_json_data('labels.json', labels)
    puts 'New Label added successfully'
  end

  def list_all_labels
    if labels.empty?
      puts 'No labels added yet'
      puts 'Choose option 4 to add a new label'
    else
      puts 'Listed Labels'
      labels.each do |label|
        puts "id:#{label['id'] || label[:id]}"
        puts "title:#{label['title'] || label[:title]}"
        puts "color:#{label['color'] || label[:color]}"
        puts ''
      end
    end
  end

  def save_json_data(file_name, array_object)
    File.open(file_name, 'w') do |file|
      file.puts JSON.pretty_generate(array_object)
    end
  end
  
end