import 'package:flutter/material.dart';
import 'login.dart';
void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': ((context) => const Login()),
    },
  ),
);

