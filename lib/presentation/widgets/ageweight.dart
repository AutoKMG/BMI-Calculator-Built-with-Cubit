// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AgeWeight extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback func1;
  final VoidCallback func2;
  final String herotag1;
  final String herotag2;
  const AgeWeight({
    Key? key,
    required this.title,
    required this.value,
    required this.func1,
    required this.func2,
    required this.herotag1,
    required this.herotag2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[400]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Text(
            '$value',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: func1,
                heroTag: herotag1,
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                  heroTag: herotag2,
                  mini: true,
                  onPressed: func2,
                  child: Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}
