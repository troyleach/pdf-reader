require 'pdf-reader'

class BookModel
  attr_reader   :title
  attr_accessor :file, :page3

  def initialize(filename)
    @file     = PDF::Reader.new(filename)
    @title    = @file.info[:Title]
    @page3    = @file.page(3).to_s.split(".")
  end

  # this is where logic will live to pull what ever you want
  # from the book
  # obviously you will need change @page3! maybe this should be
  # a variable that the user could change?? 
  # I made this very simple, only split on periods so you will
  # have to change this
end


class TextABook
  attr_reader   :view, :book
  attr_accessor :sentences

  def initialize(book_name)
    @view     = View.new
    @book     = BookModel.new(book_name)
  end

  def run
    view.book_title(book.title)
    view.welcome
    choice = view.user_input

    while book.page3.length > 0
      populate(choice)
      view.display_sentences(@sentences)
      if book.page3.length == 0
        view.finished_page
        exit
      end
      break if choice.downcase == "q"
      view.next_sentences
      choice = view.user_input
    end

  end

  def populate(choice)
    @sentences = book.page3.pop(choice.to_i)
  end

end




class View
  attr_accessor :counter

  def initialize
   @counter = 0 #YOU WILL HAVE TO SAVE THE COUNTER IN THE db
  end

  def welcome
    puts "Please enter how many sentences you would like texted to you!"
    print "or type Q to quite: "
  end

  def next_sentences
    print "Enter the next desired set "
  end

  def user_input
    gets.chomp
  end

  def book_title(book_name)
    puts "The book you are reading #{book_name}"
  end


  def display_sentences(sentences)
    sentences.each do |sentence|
      puts
      puts "SENTENCE NUMBER #{@counter += 1}"
      puts sentences.join()
      puts "- " * 35
    end
  end

  def finished_page
    puts
    puts "Good job you finished this page!"
    puts "good bye!!"
  end

end

# below needs to become a variable that the users inserts
# the name of the book. you will have to format the user input
TextABook.new("A Christmas Carol.pdf").run
