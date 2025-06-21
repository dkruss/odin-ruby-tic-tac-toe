require './lib/grid/cell.rb'

class Grid

  attr_accessor :cells, :game_end

  def initialize
    @cells = [[Cell.new(),Cell.new(),Cell.new()],\
              [Cell.new(),Cell.new(),Cell.new()],\
              [Cell.new(),Cell.new(),Cell.new()]]
  end

  def mark_space(r,c,player)
    if (![1,2,3].include?(r) || ![1,2,3].include?(c))
      puts "Invalid cell. Choose again"
      0
    elsif cells[r-1][c-1].state != 0
      puts "Cell already taken. Choose again"
      0
    elsif player == "X"
      cells[r-1][c-1].place_x
      1
    elsif player == "O"
      cells[r-1][c-1].place_o
      1
    else
      0
    end
  end

  def check_grid_state
    if cells[0].reduce(0) { |sum,cell| sum + cell.state }.abs == 3
      return cells[0][0]
    elsif cells[1].reduce(0) { |sum,cell| sum + cell.state }.abs == 3
      return cells[1][0]
    elsif cells[2].reduce(0) { |sum,cell| sum + cell.state }.abs == 3
      return cells[2][0]
    elsif (cells[0][0].state + cells[1][0].state + cells[2][0].state).abs == 3
      return cells[0][0]
    elsif (cells[0][1].state + cells[1][1].state + cells[2][1].state).abs == 3
      return cells[0][1]
    elsif (cells[0][2].state + cells[1][2].state + cells[2][2].state).abs == 3
      return cells[0][2]
    elsif (cells[0][0].state + cells[1][1].state + cells[2][2].state).abs == 3
      return cells[1][1]
    elsif (cells[0][2].state + cells[1][1].state + cells[2][0].state).abs == 3
      return cells[1][1]
    end
    0
  end

  def to_s
    "
    #{cells[0][0]}|#{cells[0][1]}|#{cells[0][2]}
    #{cells[1][0]}|#{cells[1][1]}|#{cells[1][2]}
    #{cells[2][0]}|#{cells[2][1]}|#{cells[2][2]}"
  end
end