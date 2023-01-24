

import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> args) async {
  String? input = stdin.readLineSync(encoding: utf8);
  if(input == null) {
    throw "empty content";
  }
}