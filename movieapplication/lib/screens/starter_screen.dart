import 'package:flutter/material.dart';
import '../provider/provider.dart';
import 'movie_list_screen.dart';

class StarterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to My Movie App!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the MovieListScreen
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ChangeNotifierProvider(
                //       create: (_) => MovieProvider(),
                //       child: MovieListScreen(),
                //     ),
                //   ),
                // );
              },
              child: Text('View Movies'),
            ),
          ],
        ),
      ),
    );
  }
}
