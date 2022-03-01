import 'package:flutter/material.dart';
import 'dart:math';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            index++;
            return ListTile(
                leading: Icon(Icons.list),
                trailing: attendance(),
                title: Text("19IT00$index"));
          }),
    );
  }
}

class attendance extends StatefulWidget {
  const attendance({Key? key}) : super(key: key);

  @override
  _attendanceState createState() => _attendanceState();
}

class _attendanceState extends State<attendance> {
  @override
  Widget build(BuildContext context) {
    int index1 = Random().nextInt(2);
    if (index1 == 1) {
      return Text(
        "Present",
        style: TextStyle(color: Colors.green),
      );
    } else {
      return Text(
        "Absent",
        style: TextStyle(color: Colors.red),
      );
    }
  }
}
