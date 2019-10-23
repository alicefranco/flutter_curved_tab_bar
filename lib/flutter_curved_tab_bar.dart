library flutter_curved_tab_bar;
import 'package:flutter/material.dart';
import 'dart:math';

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
        height: MediaQuery.of(context).size.height*0.06,
        color: widget.tabsColor,
        child: Stack(
            children:
            [
              Row(
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
                      child: _tab(widget.icons[0], widget.iconsColor, widget.tabsColor)
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedKey = tab2;
                          _index = 1;
                          widget.onTabSelected(_index);
                        });
                      },
                      child: _tab(widget.icons[1], widget.iconsColor, widget.tabsColor)
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedKey = tab3;
                          _index = 2;
                          widget.onTabSelected(_index);
                        });
                      },
                      child: _tab(widget.icons[2], widget.iconsColor, widget.tabsColor)
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedKey = tab4;
                          _index = 3;
                          widget.onTabSelected(_index);
                        });
                      },
                      child: _tab(widget.icons[3],  widget.iconsColor, widget.tabsColor)
                  )
                ],
              ),
              _tabSelected(widget.icons, widget.iconSelectedColor, widget.tabSelectedColor, _index)
            ]
        ),
      ),
    ]);
  }

  Widget _tab(IconData icon, Color iconColor, Color tabColor) {
    return Container(
      color: tabColor,
      width: MediaQuery.of(context).size.width*0.25,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }

  Widget _tabSelected(List<IconData> icons, Color iconSelectedColor, Color tabSelectedColor, int indexSelected) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    if (indexSelected == 0) {
      return AnimatedAlign(
        duration: Duration(milliseconds: 500),
        alignment: Alignment(-1.0, 0),
        child: Container(
            width: width * 0.25 + 20,
            height: height * 0.06,
            child: CustomPaint(
              painter: CustomPathTabLeft(tabColor: tabSelectedColor),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    icons[0],
                    color: iconSelectedColor,
                  ),
                ),
              ),
            )
        ),

      );
    }
    else if (indexSelected == 3) {
      return AnimatedAlign(
        duration: Duration(milliseconds: 500),
        alignment: Alignment(1.0, 0),
        child: Container(
            width: width * 0.25 + 20,
            height: height * 0.06,
            child: CustomPaint(
              painter: CustomPathTabRight(tabColor: tabSelectedColor),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Icon(icons[3], color: iconSelectedColor),
                ),
              ),
            )
        ),

      );
    }
    else {
      return AnimatedAlign(
        duration: Duration(milliseconds: 500),
        alignment: Alignment(0.375*(pow(-1, indexSelected)), 0),
        child: Container(
            width: width * 0.25 + 40,
            height: height * 0.06,
            child: CustomPaint(
              painter: CustomPathTabCenter(tabColor: tabSelectedColor),
              child: Container(
                  child: Icon(icons[indexSelected], color: iconSelectedColor)
              ),
            )
        ),
      );
    }
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