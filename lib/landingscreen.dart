import 'package:flutter/material.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/hometab.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          bottomNavigationBar: menu(),
          floatingActionButton: FloatingActionButton(
              foregroundColor: Colors.white,
              backgroundColor: Colors.pink.shade800,
              child: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return bottomSheet(context);
                    });
              }),
          body: TabBarView(children: [
            HomeTab(),
            Container(
                child: Center(
              child: Text(
                'Graphs',
                style: TextStyle(color: Colors.white),
              ),
            )),
            Container(
                child: Center(
              child: Text(
                'Account',
                style: TextStyle(color: Colors.white),
              ),
            )),
          ]),
        ),
      ),
    );
  }
}

Widget menu() {
  return Container(
    child: TabBar(
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.purple, width: 2.0),
            insets: EdgeInsets.only(left: 9.0, right: 9.0)),
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.list)),
          Tab(
            icon: Icon(Icons.account_circle),
          )
        ]),
  );
}

Widget bottomSheet(BuildContext context) {
  var textcontroller = TextEditingController();

  return Container(
    //height: 700.0,
    decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white12, width: 3.0)),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.0),
          Text('Add Transaction',
              style: TextStyle(
                  fontFamily: 'OpenSans', color: Colors.white, fontSize: 25.0)),
          verticalBoxLarge,
          Container(
            width: 300.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: TextStyle(color: Colors.white),
              decoration: kTextFieldDecoration,
            ),
          ),
          verticalBoxLarge,
          Container(
            width: 300.0,
            child: TextField(
              controller: textcontroller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white12,
                helperText: 'Enter Date of Transaction',
                helperStyle: TextStyle(color: Colors.white),
                hintText: 'Enter Date',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
              ),
              onTap: () {
                _selectDate(context);
                String dateString =
                    "${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
                textcontroller.text = dateString;
              },
            ),
          ),
          verticalBoxLarge,
        ],
      ),
    ),
  );
}

DateTime selectedDate = DateTime.now();
_selectDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2021),
  );
  if (picked != null && picked != selectedDate) selectedDate = picked;
}
