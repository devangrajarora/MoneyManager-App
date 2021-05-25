import 'package:flutter/material.dart';

enum Category { Food, Groceries, Travel, Other }

class RadioButtonFile extends StatefulWidget {
  @override
  _RadioButtonFileState createState() => _RadioButtonFileState();
}

class _RadioButtonFileState extends State<RadioButtonFile> {
  Category? _category = Category.Food;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio<Category>(
              fillColor: MaterialStateProperty.all(Color(0xFFE605E2)),
              focusColor: Colors.purple,
              value: Category.Food,
              groupValue: _category,
              onChanged: (Category? value) {
                setState(() {
                  _category = value;
                });
              }),
          title: Text(
            'Food',
            style: TextStyle(
                color: Colors.white, fontFamily: 'OpenSans', fontSize: 15.0),
          ),
        ),
        SizedBox(height: 7.0),
        ListTile(
          leading: Radio<Category>(
              fillColor: MaterialStateProperty.all(Color(0xFFE605E2)),
              focusColor: Colors.purple,
              value: Category.Groceries,
              groupValue: _category,
              onChanged: (Category? value) {
                setState(() {
                  _category = value;
                });
              }),
          title: Text(
            'Groceries',
            style: TextStyle(
                color: Colors.white, fontFamily: 'OpenSans', fontSize: 15.0),
          ),
        ),
        SizedBox(height: 7.0),
        ListTile(
          leading: Radio<Category>(
              fillColor: MaterialStateProperty.all(Color(0xFFE605E2)),
              focusColor: Colors.purple,
              value: Category.Travel,
              groupValue: _category,
              onChanged: (Category? value) {
                setState(() {
                  _category = value;
                });
              }),
          title: Text(
            'Travel',
            style: TextStyle(
                color: Colors.white, fontFamily: 'OpenSans', fontSize: 15.0),
          ),
        ),
        SizedBox(height: 7.0),
        ListTile(
          leading: Radio<Category>(
              fillColor: MaterialStateProperty.all(Color(0xFFE605E2)),
              focusColor: Colors.purple,
              value: Category.Other,
              groupValue: _category,
              onChanged: (Category? value) {
                setState(() {
                  _category = value;
                });
              }),
          title: Text(
            'Others',
            style: TextStyle(
                color: Colors.white, fontFamily: 'OpenSans', fontSize: 15.0),
          ),
        ),
      ],
    );
  }
}
