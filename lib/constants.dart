import 'package:flutter/material.dart';

const Color kBgColorOne = Color(0xFFB816DA);

const Color kBgColorTwo = Color(0xFFD127A6);

const Widget verticalBoxLarge = SizedBox(height: 30.0);

const Widget verticalBoxSmall = SizedBox(height: 15.0);

const Widget verticalBoxExtra = SizedBox(height: 50.0);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter Amount',
  hintStyle: TextStyle(color: Colors.white),
  helperText: 'Amount',
  helperStyle: TextStyle(color: Colors.white),
  filled: true,
  fillColor: Colors.white12,
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
  enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
);
