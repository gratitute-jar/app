import 'dart:html';

import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Be Grateful',
            ),
          ),
          )
      ],
    );
  }
}