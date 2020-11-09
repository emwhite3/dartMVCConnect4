import 'dart:convert';

/// parses the given info by extracting strategies list from the json response
dynamic parseInfo(var response){
  var info = jsonDecode(response.body);
  return info;
}