import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dictionary App',
          style: TextStyle(
              color: Colors.white
          ),
        ),

      ),
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
