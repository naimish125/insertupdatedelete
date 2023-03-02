import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insertupdatedelete/screen/update/provider.dart';
import 'package:insertupdatedelete/screen/update/view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => studentdata_provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => View(),
        },
      ),
    ),
  );
}