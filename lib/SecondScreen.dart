import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            maxCrossAxisExtent: 200.0,
            children: <Widget>[
              Card(
                child: FittedBox(
                  child: Image(
                    image: AssetImage('images/lights.jpeg'),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Card(
                child: FittedBox(
                  child: Image(
                    image: AssetImage('images/lights.jpeg'),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Card(
                child: FittedBox(
                  child: Image(
                    image: AssetImage('images/lights.jpeg'),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Card(
                child: FittedBox(
                  child: Image(
                    image: AssetImage('images/lights.jpeg'),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Card(
                child: FittedBox(
                  child: Image(
                    image: AssetImage('images/lights.jpeg'),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Card(
                child: FittedBox(
                  child: Image(
                    image: AssetImage('images/lights.jpeg'),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )),
    );
  }
}
