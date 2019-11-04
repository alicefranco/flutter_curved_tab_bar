import 'package:flutter/material.dart';
import 'package:flutter_curved_tab_bar/flutter_curved_tab_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = <Widget>[_screen0(), _screen1(), _screen2(), _screen3(), _screen4()];

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget> [
              CurvedTabBar(
                tabsColor: Colors.white,
                tabSelectedColor: Colors.blueAccent,
                iconSelectedColor: Colors.white,
                iconsColor: Colors.blue[200],
                numberOfTabs: 4,
                icons: [Icons.person_outline, Icons.widgets, Icons.bookmark, Icons.search, Icons.style],
                onTabSelected: (_index) {
                  setState(() {
                    _currentIndex = _index;
                  });
                }
              ),
              _screens[_currentIndex]
            ],
          ),
          )
      ),
    );
  }

  Widget _screen0() {
    return Container(
      height: MediaQuery.of(context).size.height - 73,
      color: Colors.white,
      child: Center(child: Text("Screen 0"))
    );
  }

  Widget _screen1() {
    return Container(
      height: MediaQuery.of(context).size.height - 73,
      color: Colors.white,
      child: Center(child: Text("Screen 1"))
    );
  }

  Widget _screen2() {
    return Container(
      height: MediaQuery.of(context).size.height - 73,
      color: Colors.white,
      child: Center(child: Text("Screen 2"))
    );
  }

  Widget _screen3() {
    return Container(
      height: MediaQuery.of(context).size.height - 73,
      color: Colors.white,
      child: Center(child: Text("Screen 3"))
    );
  }

  Widget _screen4() {
    return Container(
        height: MediaQuery.of(context).size.height - 73,
        color: Colors.white,
        child: Center(child: Text("Screen 4"))
    );
  }
}
