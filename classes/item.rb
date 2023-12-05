require 'date'

class Item
attr_accessor :genre, :author, :source, :label, :publish_date, :archived
attr_reader :id

def initialize(publish_date, archived)
    @id = rand(1..1000)
    @publish_date = Date.parse(publish_date) if publish_date
    @archived = archived
end

def can_be_archived
    return false unless publish_date
    current_date = Date.today.year
    to_be_archived = current_date - @publish_date.year
    to_be_archived > 10
end

def move_to_archive
    @archived = can_be_archived?
end

end

# item1 = Item.new('2023-01-12', true)
# puts "#{item1.can_be_archived}"