import 'package:flutter/material.dart';
import 'package:insertupdatedelete/screen/update/view.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Homeview(),
      },
    ),
  );
}