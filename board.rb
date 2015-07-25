class Board
  attr_accessor :grid, :size

  def initialize(size = 4)
    @size = size
    @grid = Array.new(size) { Array.new(size) }
    #@grid.populate
  end

  def generate_cards
    card_values = (1..(size ** 2) / 2).to_a * 2
    # cards = []
    cards = card_values.inject([]) do |acc, value|
      acc << Card.new(value)
    end # TA: use #map instead

    # card_values.each { |value| cards << Card.new(value)}
    #cards
  end

  def populate
    #debugger
    cards = self.generate_cards.shuffle
    @size.times do |i|
       @size.times do |sub_i|
         self[i, sub_i] = cards.shift
       end
    end

  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end

  def render
    display_array = []

    @size.times do |i|
      sub_array = []
      @size.times do |sub_i|
        # if self[i, sub_i].face_up
        #   sub_array << self[i, sub_i].value
        # else
        #   sub_array << 'X'
        # end
        sub_array << self[i, sub_i].to_s
      end
      display_array << sub_array
    end

    display_array.each {|el| p el}

  end

  def won?
    @grid.flatten.all? { |card| card.face_up }
    # @size.times do |i|
    #   @size.times do |sub_i|
    #     return false if self[i, sub_i].face_up == false
    #   end
    # end
    # true
  end

  def reveal(row, col)
    self[row, col].reveal
  end

end
