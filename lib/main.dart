import 'package:flutter/material.dart';
import 'data.dart';
import 'pet_view.dart';
import 'nature_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'iOS',
        primarySwatch: Colors.blue,
        textSelectionColor: Colors.black,
      ),
      title: 'UnSplash',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('UnSplash Collection'),
            backgroundColor: Colors.grey,
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              tabs: <Widget>[
                Tab(
                  text: 'Pets',
                ),
                Tab(text: 'Nature'),
              ],
            ),
          ),
          body: TabBarView(children: [
            PetView(),
            NatureView(),
          ]),
        ),
      ),
    );
  }
}
