import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget{
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Welcome to the app without name!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}