class Card
  attr_accessor :face_up
  attr_reader :value

  def initialize(value)
    @value = value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @face_up ? @value.to_s : "X"
  end

  def ==(card)
    return false unless card.is_a?(self.class)
    self.value == card.value
  end

  private
  attr_writer :value
end
