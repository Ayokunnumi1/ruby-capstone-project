class label

    def initialize(title, color)
        @id = id
        @title = title
        @color = color
        @items = []
    end

    def add_item(item)
        @items.push(item)
        item.label = self
    end
end