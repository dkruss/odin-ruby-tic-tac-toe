require './lib/grid.rb'

def play_game
  moves = 0
  player = "X"
  game_end = false

  g = Grid.new()

  while !game_end
    
    puts "#{player}'s turn."
    puts "Which row?"
    row = gets.chomp.to_i
    puts "Which column?"
    col = gets.chomp.to_i
    
    if g.mark_space(row,col,player) == 1
      if player == "O" then player = "X" else player = "O" end
      moves += 1
      if moves >= 4
        if g.check_grid_state != 0
          game_end = true
          puts "#{g.check_grid_state} is the winner!"
          break
        end
      end
      if moves > 8
        game_end = true
        puts "Tie!"
        break
      end
      puts g
    end

  end
end

play_game