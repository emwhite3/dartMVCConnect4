/// Evan M. White
import 'package:helloWorld/controller.dart' as control;
import 'package:helloWorld/globals.dart' as globals;

/// creates a new game with the given url and sets pid
void newGame() async {
  var info = await control.getUrlInfo(globals.url, 'new/?strategy=${globals.strategy}');
  globals.pid = info['pid'];
}

/// play game method that drops disks into play and outputs status of game
Future<bool> play() async {
  var move = control.getMove();           // get player and computer move
  var info = await control.getUrlInfo(globals.url, 'play/?pid=${globals.pid}&move=${move}');
  control.dropDisk('R', move);
  if(info['ack_move']['isWin']){          // check if game is won lost or tied
    control.output('\nYou Won!\n');
    control.outputEndBoard(info['ack_move']['row']);
    return false;
  } else if (info['move']['isWin']){
    control.output('\nYou Lost!\n');
    control.outputEndBoard(info['move']['row']);
    return false;
  } else if (info['move']['isDraw'] || info['ack_move']['isDraw']){
    control.output('\nDraw!\n');
    return false;
  }
  control.dropDisk('Y', info['move']['slot']);
  control.outputBoard();
  return true;                            // return if the game should continue
}

/// main method that executes game logic order
void main() async{
  globals.url = control.getURL();                   // get url for server
  var info = await control.getUrlInfo(globals.url, 'info');
  var choice = control.getStrategy(info);           // get user to choose a strategy
  globals.strategy = info['strategies'][int.parse(choice) - 1];
  control.output('Your choice was ' + globals.strategy);
  await newGame();                                  // play game
  while(await play()){
  }
  print('URL: ${globals.url}\nPID: ${globals.pid}\nSTRATEGY: ${globals.strategy}');
}