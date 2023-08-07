import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:tapt/ui/constants/color_const.dart';

// ignore: must_be_immutable
class TitledBottomNavigationBar extends StatefulWidget {
  final bool reverse;
  final Curve curve;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? inactiveStripColor;
  final Color? indicatorColor;
  final bool ?enableShadow;
  int? currentIndex;
  final ValueChanged<int> onTap;
  final List<TitledNavigationBarItem> items;

  TitledBottomNavigationBar({
    Key? key,
    this.reverse = false,
    this.curve = Curves.linear,
    required this.onTap,
    required this.items,
    this.activeColor,
    this.inactiveColor,
    this.inactiveStripColor,
    this.indicatorColor,
    this.enableShadow = true,
    this.currentIndex = 0,
  })  : assert(items != null),
        assert(onTap != null),
        assert(currentIndex != null),
        assert(enableShadow != null),
        super(key: key);

  @override
  State createState() => _TitledBottomNavigationBarState();
}

class _TitledBottomNavigationBarState extends State<TitledBottomNavigationBar> {
  static const double BAR_HEIGHT = 60;
  static const double INDICATOR_HEIGHT = 4;

  bool get reverse => widget.reverse;

  Curve get curve => widget.curve;

  List<TitledNavigationBarItem> get items => widget.items;

  double width = 0;
  Color? activeColor;
  Duration duration = Duration(milliseconds: 270);

  double? _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (items.length - 1));
    } else {
      return lerpDouble(1.0, -1.0, index / (items.length - 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    activeColor = widget.activeColor ?? Theme.of(context).indicatorColor;

    return Container(
      height: BAR_HEIGHT,
      width: width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: INDICATOR_HEIGHT,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _select(index),
                  child: _buildItemWidget(item, index == widget.currentIndex),
                );
              }).toList(),
            ),
          ),
          Positioned(
            top: 0,
            width: width,
            child: AnimatedAlign(
              alignment:
              Alignment(_getIndicatorPosition(widget.currentIndex??0)??0.0, 0),
              curve: curve,
              duration: duration,
              child: Container(
                color: widget.indicatorColor ?? activeColor,
                width: width / items.length,
                height: INDICATOR_HEIGHT,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _select(int index) {
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex??0);
    setState(() {});
  }

  Widget _buildText(TitledNavigationBarItem item, bool isSelected) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // page icon
          item.customWidget!=null ? item.customWidget! : (item.icon!=null)? Icon(
            item.icon,
            color: isSelected
                ? ColorPath.DARK_COLOR
                : ColorPath.GREY,
            size: 24,
          ):SizedBox(height: 20,),
          SizedBox(height: 4,),

          // page title
          if (item.title != null)
            Text(
              '${item.title}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? ColorPath.DARK_COLOR
                    : ColorPath.GREY,
                  fontSize: 14,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildItemWidget(TitledNavigationBarItem item, bool isSelected) {
    return Container(
      color: item.backgroundColor,
      height: BAR_HEIGHT,
      width: width / items.length,
      child:  AnimatedAlign(
        duration: duration,
        alignment: isSelected ? Alignment.center : Alignment(0, 5.2),
        child: _buildText(item,isSelected),
      ),
    );
  }
}

class TitledNavigationBarItem {
  final String? title;
  final IconData? icon;
  final Widget? customWidget;
  final Color backgroundColor;

  TitledNavigationBarItem({
    this.icon,
    required this.title,
    this.customWidget,
    this.backgroundColor = Colors.white,
  });
}

