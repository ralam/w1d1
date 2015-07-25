require "byebug"
require_relative "board"
require_relative "card"


class Game
  def initialize
    puts "How big would you like your grid?"
    size = gets.chomp.to_i
    @board = Board.new(size)
    self.play
  end

  def play
    @board.populate
    until @board.won? do
    #2.times do
      system("clear")
      @board.render
      #debugger

      card1 = pick
#      @board.[](choice1[0], choice1[1])
      card1.reveal
      @board.render
      card2 = pick
      card2.reveal
      @board.render

      if card1.==(card2) == false
        sleep(2)
        card1.hide
        card2.hide
      end

    end
    p "Congratulations! You win!!!"
  end

  def pick
    card = nil
    loop do
      puts "Pick a card any face down card (row,column)"
      row, col = gets.chomp.split(",").map(&:to_i)
      card = @board[row, col]

      unless card.nil?
        break if card.face_up == false
      end
    end
    card
  end

  def over
    @board.won? == true
  end


end
