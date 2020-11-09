import 'dart:io';
import 'package:helloWorld/parser.dart' as parse;
import 'package:helloWorld/controller.dart' as control;
import 'package:http/http.dart' as http;

/// get info retrieves strategy from user and uses http to communicate with the server
Future<dynamic> getInfo(var url, var extension) async{
  url += extension;
  control.output('Obtaining server information ......');
  try {
    var info = parse.parseInfo(await http.get(url)); // parse json string
    return info;
  } catch (e){
    print('URL error: ${url}');
    exit(0);
  }
}

// should return json object