import 'package:flutter/material.dart';
import 'package:invoice/invoice.dart';
import 'package:invoice/screen1.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => Home(),
      'invoice': (context) => invoice(),
    }),
  );
}
