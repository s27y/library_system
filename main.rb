require 'active_record'


ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3",
	:database => "memory")

def find_a_book(bookname)
  #
end

class Clean < ActiveRecord::Migration
  def self.up
    create_table :users do |table|
      table.column :name, :string
      table.column :age, :integer
    end
    create_table :books do |table|
      table.column :title, :string
      table.column :user_id, :integer
      table.column :borrowed_when, :timestamps
      table.column :dueback, :timestamps
    end
  end

  def self.down
    drop_table :users
    drop_table :books
  end

end

class User < ActiveRecord::Base
  has_many :book
end

class Book < ActiveRecord::Base
  belongs_to :user
end

  def menu
    welcomeText = "\nWelcome to Library System\n"
    puts welcomeText  #=> this will be displayed at the beginning of the app

    num = 0
    begin
      puts "1 Show users in the System \n
        2 Show books in the System \n
        3 Borrow a book\n
        4 Return a book \n
        5 Find a book \n
        6 Find a user \n
        7 Exit\n"
      puts "Enter a number"
      num = gets
      num = num.chomp
      case
      when num == "1"
        show_all_users
      when num == "2"
        show_all_books
      when num == "3"
        borrow_a_book
      when num == "4"
        return_a_book
      when num == "5"
        find_a_book
      when num == "6"
        find_a_user
      when num == "7"
        Clean.down
    abort("See you!")
      end
    end until num == "7"

  end

  def borrow_a_book
    #
  end

  def return_a_book
    #
  end
  

  def show_all_books
    Book.all.each do |b|
      p b
    end
  end

  def show_all_users
    User.all.each do |u|
      p u
    end
  end

  def find_a_user
    puts "Enter a user name:"
      user_name = gets
      #model = User.find(:first, :conditions => ["lower(name) = ?", "yang"]) 
      p User.find_by_name(user_name.chomp.downcase)
  end

  def find_a_book
    puts "Enter a book title:"
    book_title = gets
    #model = Book.find(:first, :conditions => ["lower(name) = ?", book_name.chomp.downcase]) 
    p Book.find_by_title(book_title.chomp.downcase)
  end



#
Clean.up
user1 = User.create(:name => 'yang',
                   :age => 24)
user2 = User.create(:name => 'joe',
                   :age => 24)
user3 = User.create(:name => 'jack',
                   :age => 24)
user4 = User.create(:name => 'marry',
                   :age => 24)
user5 = User.create(:name => 'ann',
                   :age => 24)

book1 = Book.create(:title => 'ruby')
book2 = Book.create(:title => 'rails')
book3 = Book.create(:title => 'java')
book4 = Book.create(:title => 'c++')
book5 = Book.create(:title => 'C')


menu