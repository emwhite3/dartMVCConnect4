import 'dart:io';

/// Board file that has all board logic like drop disk and output

List<List<String>> board = [['-', '-', '-', '-', '-', '-', '-'],
                            ['-', '-', '-', '-', '-', '-', '-'],
                            ['-', '-', '-', '-', '-', '-', '-'],
                            ['-', '-', '-', '-', '-', '-', '-'],
                            ['-', '-', '-', '-', '-', '-', '-'],
                            ['-', '-', '-', '-', '-', '-', '-']];
List<int> flip = [5, 4, 3, 2, 1, 0];    // array that is responsible for flipping inputs if need be

/// Method that drops disk into the board
void dropDisk(var color, var col){
  for (var i = 0; i < board.length; i++){
    if(board[i][col] == '-'){
      board[i][col] = color;
      return;
    }
  }
  print('Cannot make that move: ${col}');
  exit(0);
}

/// Outputs the board to the user
void printBoard(){
  for(var i = board.length - 1; i >= 0; i--){
    for(var j = 0; j < board[0].length; j++){
      stdout.write(' ${board[i][j]} ');
    }
    stdout.write('\n');
  }
}

/// cheat method that suggests a move to the user
void cheat(){
  for(var i = 0; i < board.length; i++){      // horizontal win check
    for(var j = 0; j <= 3; j++){
      if(board[i][j] == 'R' &&
         board[i][j+1] == 'R' &&
         board[i][j+2] == 'R' &&
         board[i][j+3] == '-') {
        print('I suggest column ${j + 4}\n');
        return;
        }
      }
    }

  for(var i = 0; i < board.length; i++){    // embedded space checks
    for(var j = 0; j <= 3; j++){
      if(board[i][j] == 'R' &&
          board[i][j+1] == '-' &&
          board[i][j+2] == 'R' &&
          board[i][j+3] == '-') {
        print('I suggest column ${j + 2}\n');
        return;
      } else if(board[i][j] == 'R' &&
          board[i][j+1] == '-' &&
          board[i][j+2] == 'R' &&
          board[i][j+3] == 'R') {
        print('I suggest column ${j + 2}\n');
        return;
      } else if(board[i][j] == 'R' &&
          board[i][j+1] == 'R' &&
          board[i][j+2] == '-' &&
          board[i][j+3] == 'R') {
        print('I suggest column ${j + 3}\n');
        return;
      } else if(board[i][j] == '-' &&
          board[i][j+1] == 'R' &&
          board[i][j+2] == '-' &&
          board[i][j+3] == 'R') {
        print('I suggest column ${j + 1}\n');
        return;
      } else if(board[i][j] == '-' &&
          board[i][j+1] == 'R' &&
          board[i][j+2] == '-' &&
          board[i][j+3] == 'R') {
        print('I suggest column ${j + 1}\n');
        return;
      }
    }
  }

  for(var j = 0; j < board[0].length; j++){ // vertical win check
    for(var i = 0; i < 3; i++){
      if(board[i][j] == 'R' &&
          board[i+1][j] == 'R' &&
          board[i+2][j] == 'R' &&
          board[i+3][j] == '-'){
        print('I suggest column ${j+1}\n');
        return;
      }
    }
  }
  print('I suggest column ${1}\n');
}

/// inputs winning 4 disks into board and outputs it to user
void endPrint(var coord){
  for(var i = 0; i < coord.length; i+=2){
    board[flip[coord[i+1]]][coord[i]] = 'X';
  }
  printBoard();
  }