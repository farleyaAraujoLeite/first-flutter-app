import 'package:flutter/material.dart';

Widget pageBody(String imgUrl, String title, String description ) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(imgUrl),
        Text(
          title, 
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            ),),
        Text(
          description, 
          style: TextStyle(
            fontSize: 14,
            color: Colors.black26,
            ),
          textAlign: TextAlign.justify,  
          ),
      ],
    ),
  );
}