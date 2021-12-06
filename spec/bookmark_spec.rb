require 'bookmark'

describe Bookmark do
  it 'should return a list of the bookmarks' do
    expect(subject.all).to include 'www.google.com'
    expect(subject.all).to include 'www.yahoo.com'
  end
end 