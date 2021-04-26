import 'package:flutter/material.dart';
import 'file:///F:/practice/lib/models/all_models.dart';
import 'package:practice/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime DateOfBirth;
  DateTime DateOfToday;
  TextEditingController birthdayDate =
      TextEditingController(text: 'Select Date');
  TextEditingController todayDate = TextEditingController(text: 'Select Date');
  CurrentAge age = CurrentAge();
  NextBirth birth = NextBirth();
  AgeCalculator calculator = AgeCalculator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
            child: Text(
          'Age Calculator',
        )),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Column(
            children: [
              textWidget('Date of Birth'),
              textFieldWidget(birthdayDate),
              SizedBox(),
              textWidget('Today Date'),
              textFieldWidget(todayDate),
              SizedBox(),
              Center(child: buttonWidgets('Calculate')),
              SizedBox(
                height: 17,
              ),
              textWidget('Your Age is'),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  outputWidgets('Years', age.years),
                  outputWidgets('Months', age.months),
                  outputWidgets('Days', age.day)
                ],
              ),
              SizedBox(
                height: 17,
              ),
              textWidget('Your Next Birthday in'),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  outputWidgets('Years', 0),
                  outputWidgets('Months', birth.months),
                  outputWidgets('Days', birth.day)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
  //widget 1
  Widget textWidget(String data) {
    return Text(
      data,
      style: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
          fontSize: 16.0),
    );
  }

  //widget 2
  Widget textFieldWidget(TextEditingController data) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: TextField(
        controller: data,
        onTap: () {
          showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1940),
              lastDate: DateTime.now())
              .then((value) {
            setState(() {
              data.text = Date.formatDate(value);
              if (data == birthdayDate) {
                DateOfBirth = value;
              } else if (data == todayDate) {
                DateOfToday = value;
              } else
                return null;
            });
          });
        },
        readOnly: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          suffixIcon:
          Icon(Icons.date_range, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  //widget 3
  Widget buttonWidgets(String text) {
    return ButtonTheme(
      minWidth: 150,
      height: 55,
      child: RaisedButton(
        onPressed: () {
          setState(() {
            age = calculator.calculateAge(DateOfBirth, DateOfToday);
            birth = calculator.calculateNextBirth(DateOfBirth, DateOfToday);
          });
        },
        color: Theme.of(context).primaryColor,
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  //widget 4
  Widget outputWidgets(String title, int data) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: Center(
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          height: 30,
          width: 110,
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                )),
            child: Center(child: Text(data.toString())),
            height: 30,
            width: 110)
      ],
    );
  }
}
