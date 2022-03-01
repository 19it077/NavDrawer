import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import './FirstScreen.dart';
import './SecondScreen.dart';
import 'package:camera/camera.dart';
import './camera_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Flutter Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const ({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Schedule',
      style: TextStyle(color: Color(0xFF66FCF1), fontSize: 30.0),
    ),
    Text(
      'Index 1: Contacts',
      style: TextStyle(color: Color(0xFF66FCF1), fontSize: 30.0),
    ),
    Text(
      'Index 2: Bills',
      style: TextStyle(color: Color(0xFF66FCF1), fontSize: 30.0),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1F2833),
        appBar: AppBar(
          title: Text(
            "NavBar",
            style: TextStyle(color: Color(0xFFC5C6C7)),
          ),
          backgroundColor: Color(0xFF0B0C10),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        drawer: Drawer(
          backgroundColor: Color(0xFF1F2833),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF0B0C10)),
                accountName:
                    Text("Khushi", style: TextStyle(color: Color(0xFFC5C6C7))),
                accountEmail: Text("khushi@gmail.com",
                    style: TextStyle(color: Color(0xFFC5C6C7))),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color(0xFF66FCF1),
                  child: Text(
                    "K",
                    style: TextStyle(fontSize: 40.0, color: Color(0xFF0B0C10)),
                  ),
                ),
              ),
              ListTile(
                textColor: Color(0xFFC5C6C7),
                leading: Icon(Icons.home),
                iconColor: Color(0xFFC5C6C7),
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Color(0xFFC5C6C7),
                textColor: Color(0xFFC5C6C7),
                leading: Icon(Icons.list),
                title: Text("List View"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstScreen()));
                },
              ),
              ListTile(
                iconColor: Color(0xFFC5C6C7),
                textColor: Color(0xFFC5C6C7),
                leading: Icon(Icons.image),
                title: Text("Grid View"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SecondScreen()));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Color(0xFFC5C6C7),
            selectedItemBorderColor: Color(0xFF0B0C10),
            selectedItemBackgroundColor: Color(0xFF66FCF1),
            selectedItemIconColor: Color(0xFF1F2833),
            selectedItemLabelColor: Color(0xFF0B0C10),
          ),
          selectedIndex: _selectedIndex,
          onSelectTab: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.calendar_today,
              label: 'Schedule',
            ),
            FFNavigationBarItem(
              iconData: Icons.people,
              label: 'Contacts',
            ),
            FFNavigationBarItem(
              iconData: Icons.attach_money,
              label: 'Bills',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await availableCameras().then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraPage(
                    cameras: value,
                  ),
                ),
              ),
            );
          },
          backgroundColor: Colors.grey,
          child: const Icon(Icons.camera),
        ));
  }
}
