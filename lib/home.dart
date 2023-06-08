import 'package:flutter/material.dart';

import 'new_enquiry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:Container(child:
        TextButton(onPressed: () {
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewEnquiry()),
  );
          },
      child: Text('New enquiry',
      style: TextStyle(fontSize: 20),),
      )
       )
      
    );
  }
}