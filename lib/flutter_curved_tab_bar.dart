library flutter_curved_tab_bar;

import 'package:flutter/material.dart';

class CurvedTabBar extends StatefulWidget {
  final Color tabsColor;
  final Color tabSelectedColor;
  final Color iconsColor;
  final Color iconSelectedColor;
  final Function onTabSelected;
  final List<IconData> icons;

  const CurvedTabBar({this.tabsColor, this.tabSelectedColor, this.iconSelectedColor, this.iconsColor, this.onTabSelected, this.icons});

  @override
  State<StatefulWidget> createState() => CurvedTabBarState();
}

class CurvedTabBarState extends State<CurvedTabBar> {
  var _index = 0;
  var tab1 = Key("0");
  var tab2 = Key("1");
  var tab3 = Key("2");
  var tab4 = Key("3");

  Key selectedKey = Key("0");

  @override
  Widget build (BuildContext context) {

    return Column(children: [
      Container(
        color: widget.tabsColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  setState(() {
                    selectedKey = tab1;
                    _index = 0;
                    widget.onTabSelected(_index);
                  });
                },
                child: _tabLeft(
                    widget.icons[0],
                    widget.tabSelectedColor,
                    widget.tabsColor,
                    widget.iconsColor,
                    widget.iconSelectedColor,
                    selectedKey == tab1
                )
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    selectedKey = tab2;
                    _index = 1;
                    widget.onTabSelected(_index);
                  });
                },
                child: _tabCenter(
                    widget.icons[1],
                    widget.tabSelectedColor,
                    widget.tabsColor,
                    widget.iconsColor,
                    widget.iconSelectedColor,
                    selectedKey == tab2
                )
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    selectedKey = tab3;
                    _index = 2;
                    widget.onTabSelected(_index);
                  });
                },
                child: _tabCenter(
                    widget.icons[2],
                    widget.tabSelectedColor,
                    widget.tabsColor,
                    widget.iconsColor,
                    widget.iconSelectedColor,
                    selectedKey == tab3
                )
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    selectedKey = tab4;
                    _index = 3;
                    widget.onTabSelected(_index);
                  });
                },
                child: _tabRight(
                    widget.icons[3],
                    widget.tabSelectedColor,
                    widget.tabsColor,
                    widget.iconsColor,
                    widget.iconSelectedColor,
                    selectedKey == tab4
                )
            )
          ],
        ),
      ),
    ]);
  }

  Widget _tabLeft(IconData icon, Color tabColor, Color backgroundTabColor, Color iconsColor, Color iconSelectedColor, bool selected) {

    print("left ${selected}");
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
        width: selected ? width * 0.25 + 20 : width * 0.25 - 20,
        height: height * 0.06,
        child: selected ? CustomPaint(
          painter: CustomPathTabLeft(tabColor: tabColor),
          child: Container(
            child: Padding(
              padding: selected ? EdgeInsets.only(right: 20.0) : EdgeInsets.all(0.0) ,
              child: Icon(
                icon,
                color: iconSelectedColor,
              ),
            ),
          ),
        ) : Container(color: backgroundTabColor, child: Icon(icon, color: iconsColor))
    );
  }

  Widget _tabCenter(IconData icon, Color tabColor, Color backgroundTabColor, Color iconsColor, Color iconSelectedColor, bool selected) {

    print("center ${selected}");
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
        width: selected ? width * 0.25 + 40 : width * 0.25 - 20,
        height: height * 0.06,
        child: selected ? CustomPaint(
          painter: CustomPathTabCenter(tabColor: tabColor),
          child: Container(
            child: Padding(
              padding: selected ? EdgeInsets.only(right: 0.0) : EdgeInsets.all(0.0),
              child: Icon(icon, color: iconSelectedColor),
            ),
          ),
        ) : Container(color: backgroundTabColor, child: Icon(icon, color: iconsColor))
    );
  }

  Widget _tabRight(IconData icon, Color tabColor, Color backgroundTabColor, Color iconsColor, Color iconSelectedColor, bool selected) {

    print("right ${selected}");
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
        width: selected ? width * 0.25 + 20 : width * 0.25 - 20,
        height: height * 0.06,
        child: selected ? CustomPaint(
          painter: CustomPathTabRight(tabColor: tabColor),
          child: Container(
            child: Padding(
              padding: selected ? EdgeInsets.only(left: 20.0) : EdgeInsets.all(0.0),
              child: Icon(icon, color: iconSelectedColor),
            ),
          ),
        ) : Container(color: backgroundTabColor, child: Icon(icon, color: iconsColor)
        )
    );
  }
}

class CustomPathTabLeft extends CustomPainter {
  final Color tabColor;

  const CustomPathTabLeft({this.tabColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint();
    line.color = tabColor;
    Path path = new Path();

    path.moveTo(0, size.height);

    path.lineTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(size.width - 20, 0, size.width - 20, 20);
    path.lineTo(size.width - 20, size.height - 20);
    path.quadraticBezierTo(
        size.width - 20, size.height, size.width, size.height);

    path.close();
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CustomPathTabRight extends CustomPainter {
  final Color tabColor;

  const CustomPathTabRight({this.tabColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint();
    line.color = tabColor;
    Path path = new Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(20, size.height, 20, size.height - 20);
    path.lineTo(20, 20);
    path.quadraticBezierTo(20, 0, 40, 0);
    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);
    path.lineTo(size.width, size.height);

    path.close();
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CustomPathTabCenter extends CustomPainter {
  final Color tabColor;

  const CustomPathTabCenter({this.tabColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint();
    line.color = tabColor;
    Path path = new Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(20, size.height, 20, size.height - 20);
    path.lineTo(20, 20);
    path.quadraticBezierTo(20, 0, 40, 0);
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(size.width - 20, 0, size.width - 20, 20);
    path.lineTo(size.width - 20, size.height - 20);
    path.quadraticBezierTo(
        size.width - 20, size.height, size.width, size.height);

    path.close();
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}