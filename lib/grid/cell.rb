class Cell

  attr_accessor :state, :string_rep

  def initialize
    @state = 0
    @string_rep = " "
  end
  
  def place_x
    self.state = 1
    self.string_rep = "X"
  end

  def place_o
    self.state = -1
    self.string_rep = "O"
  end

  def to_s
    "#{string_rep}"
  end
end