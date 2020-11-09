import 'package:helloWorld/consoleUI.dart' as ui;
import 'package:helloWorld/webclient.dart' as web;
import 'package:helloWorld/parser.dart' as parse;
import 'package:helloWorld/board.dart' as board;

/// Calls prompt server to get the URL
String getURL(){
  return ui.promptServer();
}

/// Calls prompt strategy to get the strategy
String getStrategy(var info){
  return ui.promptStrategy(info);
}

/// calls prompt move to get player move
int getMove({int width=7}){
  return ui.promptMove(width);
}

/// calls get info and gets info from given url and extension
dynamic getUrlInfo(var url, var extension){
  return web.getInfo(url, extension);
}

/// calls parse info to parse the json information
List<dynamic> parseJson(var response){
  return parse.parseInfo(response);
}

/// calls drop disk to drop given disk and color into the board
void dropDisk(var color, var col){
  board.dropDisk(color, col);
}

/// calls print board and outputs board to user
void outputBoard(){
  board.printBoard();
}

/// calls end print and outputs the ending board with winning row to user
void outputEndBoard(var coord){
  board.endPrint(coord);
}

/// calls show message to output given message
void output(String output){
  ui.showMessage(output);
}