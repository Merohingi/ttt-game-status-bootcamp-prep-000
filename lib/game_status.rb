require "pry"
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8],
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], 
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    if board[win_index1] == "X" && board[win_index2] == "X" && board[win_index3] == "X"
      return win_combo
    elsif board[win_index1] == "O" && board[win_index2] == "O" && board[win_index3] == "O"
      return win_combo
    end
  end
  
  if board.none? {|position| position == " " || position == "" || position == nil}
    return false
  elsif board == [" ", " ", " ", " ", " ", " ", " ", " ", " "] || board == ["","","","","","","","",""]
    return false
  else
    return false
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false
    return true
  elsif full?(board) == true
    return true
  end
end

def winner(board)
  if won?(board)
    win_combo = won?(board)
    sample_index = win_combo[0]
    if board[sample_index] == "X"
      return "X"
    elsif board[sample_index] == "O"
      return "O"
    end
  end
  return nil
end

