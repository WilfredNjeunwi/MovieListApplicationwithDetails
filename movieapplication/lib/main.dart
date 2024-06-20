import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/provider.dart';
import 'repository/repository.dart';
import 'screens/starter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieProvider(MovieRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Movie App',
        home: StarterScreen(),
      ),
    );
  }
}
