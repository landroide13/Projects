
require 'sinatra'
require 'mongoid'
require "sinatra/namespace"

Mongoid.load! "mongoid.config"


class Book
  include Mongoid::Document

  field :title, type: String
  field :author, type: String
  field :isbn, type: String

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true

  index({ title: 'text' })
  index({ isbn:1 }, { unique: true, name: "isbn_index" })

  scope :title, -> (title) { where(title: /^#{title}/) }
  scope :isbn, -> (isbn) { where(isbn: isbn) }
  scope :author, -> (author) { where(author: author) }

end


   get '/' do
    'Welcome to BookList!'
   end


  namespace '/api/v1' do
     before do
       content_type 'application/json'
     end
     
     get '/books' do
       books = Book.all

      [:title, :isbn, :author].each do |filter|
        books = books.send(filter, params[filter]) if params[filter]
      end
       books.map {|book| BookSerializer.new(book)}.to_json
     end 
  end


class BookSerializer
  def initialize(book)
    @book = book
  end

  def as_json(*)

    data = {
      id: @book.id.to_s,
      title: @book.title,
      author: @book.author,
      isbn: @book.isbn
     }
    data[:errors] = @book.errors if @book.errors.any?
    data
  end  
end














