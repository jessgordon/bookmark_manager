require 'bookmark'

describe Bookmark do
  it 'should return a list of the bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")

    expect(Bookmark.all).to include 'http://www.google.com/'
    expect(Bookmark.all).to include 'http://www.makersacademy.com/'
    expect(Bookmark.all).to include 'http://www.destroyallsoftware.com'
  end

  describe '.add_bookmark' do
    it 'should add a new bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.add_bookmark('www.google.com')

      expect(Bookmark.all).to include 'www.google.com'
    end
  end
end 