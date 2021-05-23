import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/constants.dart';

var values = [200, -300, 500, 100, 600, -750, 900, 1000];

Widget HomeTab() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalBoxLarge,
        verticalBoxExtra,
        Expanded(
            child: Text(
          'Hello, Vishrut',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 35.0,
              fontWeight: FontWeight.bold),
        )),
        Expanded(
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalBoxSmall,
                    Row(
                      children: [
                        SizedBox(width: 25.0),
                        Text(
                          'Remaining Budget',
                          style: TextStyle(
                              fontFamily: 'OpenSans', color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        SizedBox(width: 25.0),
                        Text(
                          '5,000',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.pink.shade800,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ))),
        Expanded(
          flex: 3,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalBoxLarge,
                Text(
                  'Recent Transactions',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 25.0),
                ),
                verticalBoxSmall,
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white12,
                          child: ListTile(
                            leading: values[index].toInt() < 0
                                ? Icon(Icons.remove_circle, color: Colors.red)
                                : Icon(Icons.add, color: Colors.green),
                            title: Text('11/05/2021',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0)),
                            subtitle: Text('Food',
                                style: TextStyle(
                                    color: Colors.pink.shade800,
                                    fontSize: 15.0)),
                            trailing: Text(values[index].toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: values[index].toInt() > 0
                                        ? Colors.green
                                        : Colors.red)),
                          ),
                        );
                      },
                      itemCount: values.length),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
