import 'package:flutter/material.dart';
import 'package:flutter_dio_bloc/ui/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PostPage(postId: 1), // Assuming postId 1 for initial post
    );
  }
}
