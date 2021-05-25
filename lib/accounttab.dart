import 'package:flutter/material.dart';
import 'package:money_manager/constants.dart';

class AccountTab extends StatefulWidget {
  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  int budget = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalBoxSmall,
          Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalBoxLarge,
                    Text(
                      'Budget',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalBoxLarge,
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: [
                            verticalBoxSmall,
                            Text(
                              'Set Monthly Budget',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 15.0,
                                  color: Colors.white),
                            ),
                            verticalBoxSmall,
                            Text(
                              budget.toString(),
                              style: TextStyle(
                                  color: Colors.pink.shade800,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45.0),
                            ),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  inactiveTrackColor: Colors.white24,
                                  activeTrackColor: Colors.white54,
                                  thumbColor: Colors.purple,
                                  overlayColor: Color(0x29E605E2),
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 15.0),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 30.0),
                                ),
                                child: Slider(
                                  value: budget.toDouble(),
                                  min: 0.0,
                                  max: 50000.0,
                                  divisions: 500,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      budget = newValue.toInt();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
          verticalBoxLarge,
          Text(
            'Account Details',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          verticalBoxLarge,
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Center(
                    child: ListTile(
                      leading: Icon(Icons.account_box),
                      title: Text(
                        'Vishrut Kumar',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text(
                      'vishrut1403@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 18.0,
                      ),
                    ),
                  )),
                  /*Expanded(
                      child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      '9869276015',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 18.0,
                      ),
                    ),
                  ))*/
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
