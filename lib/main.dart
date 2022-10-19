import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/screens/contacts_list.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    )
  );
  runApp(  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ContactsList(),
  ));
}

