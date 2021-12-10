require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of the bookmarks' do
      bookmark = Bookmark.add_bookmark(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.add_bookmark(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.add_bookmark(url: "http://www.google.com", title: "Google")
   
      bookmarks = Bookmark.all
   
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
     end
  end

  describe '.add_bookmark' do
    it 'adds a new bookmark' do
      bookmark = Bookmark.add_bookmark(url: 'www.google.com', title: 'Google Search')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Google Search'
      expect(bookmark.url).to eq 'www.google.com'
    end
  end

  describe '.delete bookmark'do
    it 'deletes a bookmarks' do
      bookmark = Bookmark.add_bookmark(url: 'www.google.com', title: 'Google Search')
      Bookmark.delete_bookmark(id: bookmark.id)
      expect(Bookmark.all).to match_array([])
    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.add_bookmark(url: 'www.google.com', title: 'Google Search')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')
  
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.add_bookmark(url: 'www.google.com', title: 'Google Search')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Google Search'
      expect(result.url).to eq 'www.google.com'
    end
  end
end 