import 'package:flutter/material.dart';

const textInputDeco = InputDecoration(
//  fillColor: Colors.white,
//  filled: true,
//  enabledBorder: OutlineInputBorder(
//      borderSide: BorderSide(color: Colors.white, width: 2.0)
//      ),
//  focusedBorder: OutlineInputBorder(
//      borderSide: BorderSide(color: Colors.green, width: 2.0)
//      ),
  labelStyle: TextStyle(
    fontFamily: 'RobotoMono',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.green),
  ),
);
