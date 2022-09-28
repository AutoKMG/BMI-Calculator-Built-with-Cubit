// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final String sex;
  final bool isMaleSelected;
  final String sexImage;
  Gender({
    Key? key,
    required this.sex,
    required this.sexImage,
    required this.isMaleSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isMaleSelected ? Colors.blue : Colors.grey[400]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(sexImage),
            height: 90,
            width: 90,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            sex,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
