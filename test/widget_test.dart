import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2, // Jumlah tab
        child: Scaffold(
          appBar: AppBar(
            title: Text('Contoh Tab dan Kolom Flutter'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Konten untuk Tab 1
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Kolom 1 - Item 1'),
                  Text('Kolom 1 - Item 2'),
                  Text('Kolom 1 - Item 3'),
                ],
              ),

              // Konten untuk Tab 2
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Kolom 2 - Item 1'),
                  Text('Kolom 2 - Item 2'),
                  Text('Kolom 2 - Item 3'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
