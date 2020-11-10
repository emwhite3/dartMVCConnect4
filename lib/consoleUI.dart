import 'dart:io';
import 'package:helloWorld/board.dart' as board;

var defURL = 'http://www.cs.utep.edu/cheon/cs3360/project/c4/'; // default url

/// Asks user for the server URL. If none is provided then the default one is used
String promptServer(){
  stdout.write('Enter the server URL [default: $defURL] ');
  var url = stdin.readLineSync();
  if (url.isEmpty){                       // if the entered string is empty set to default url
    url = defURL;
  }
  return url;
}

/// Asks user for a strategy from the strategies retrieved from the server
String promptStrategy(var info){
  stdout. write('Choose a strategy: ');   // get info for board and output strategies
  for (var i = 0; i < info['strategies'].length; i++){
    stdout.write('${(i+1)}. ${info['strategies'][i]} ');
  }
  stdout. write('[default: 1]: ');        // get user input for strategy choice
  var choice = stdin.readLineSync();
  if (choice.isEmpty){                    // returns default value if nothing is entered
    return '1';
  } else if (int.parse(choice) > 0  && int.parse(choice) <= info.length) {
    return choice;                        // checks if choice is valid and if so returns it
  }else {                                // if choice is invalid notify user and re-prompt choice
    stdout.write('Invalid choice: $choice\n');
    return promptStrategy(info);
  }

}

/// obtains move from player and returns a 0 based index of players move
int promptMove(var width){
  stdout.write('Select a slot [1-$width]: ');
  var move = stdin.readLineSync();
  try {
    if (int.parse(move) > 0 && int.parse(move) <= width) {
      return int.parse(move) - 1;
    } else if(int.parse(move) == 69){
      board.cheat();
      return promptMove(width);
    } else {
      stdout.write('Invalid selection: $move\n');
      return promptMove(width);
    }
  } on FormatException {
    stdout.write('Invalid selection: $move\n');
    return promptMove(width);
  }
}

/// Outputs a given message to the user
void showMessage(String output){
  print(output);
}