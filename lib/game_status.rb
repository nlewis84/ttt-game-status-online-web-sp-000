require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8], 
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |x|
    if position_taken?(board, x[0]) && board[x[0]] == board[x[1]] && board[x[1]] == board[x[2]]
      return x
    end
  end
  false
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
  if won?(board) == false && full?(board) == false
    return false
  end
  if won?(board) == true
    return false
  end
end

#true for draw
#true for won and full
#true for won and not full
#false for in-progress


def over?(board)
  if draw?(board) == true
    return true
  end
  if won?(board) == false && full?(board) == false
    return false
  end
  true
end

# X when X won
# O when O won
# nil when no winner

def winner(board)
  if over?(board) == true
    return board[won?(board)[0]]
  else
    return nil
  end
end





