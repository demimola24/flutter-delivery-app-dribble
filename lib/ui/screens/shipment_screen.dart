import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:tapt/ui/constants/color_const.dart';

import '../app_home.dart';
import 'bloc/shared_bloc.dart';

class ShipmentScreen extends StatefulWidget {
  const ShipmentScreen({Key? key}) : super(key: key);

  static final String routeName = const ShipmentScreen().runtimeType.toString();

  @override
  State<ShipmentScreen> createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen>  with SingleTickerProviderStateMixin{
  bool _animate = false;
  static bool _isStart = true;
  static bool _startAnim = true;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _isStart = true;
    _startAnim=true;
     loadAnim();
  }

  void loadAnim(){
    if (_isStart) {
      Future.delayed(const Duration(milliseconds:100), () {
        setState(() {
          _animate = true;
          _isStart = false;
        });
      });
    } else {
      _animate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorPath.OFF_WHITE,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "AppBar",
            child: Container(
              padding: const EdgeInsets.only(left: 12, right: 12,top: 50,bottom: 0),
              color:  ColorPath.DARK_COLOR,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 200),
                padding: _animate
                    ? const EdgeInsets.all(0.0)
                    : const EdgeInsets.only(bottom: 60),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: (){
                            sharedBloc.changePage(0);
                          },
                          child: const Icon(Icons.chevron_left_rounded, size: 32,color: Colors.white,),
                        ),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 45),
                            width: width,
                            child: const Text("Shipment History",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: ColorPath.WHITE
                              ),),
                          ),
                        ),
                        const SizedBox(width: 8,),
                      ],
                    ),
                    SizedBox(height: 16,),
                    AnimatedPadding(
                      duration: const Duration(milliseconds: 200),
                      padding: _animate
                          ? const EdgeInsets.all(4.0)
                          : const EdgeInsets.only(left: 120),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 8, right: 8),
                                        width: 70,
                                        alignment: Alignment.center,
                                        child: Row(
                                          children:  [
                                            Text("All",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedIndex==0 ? ColorPath.WHITE: ColorPath.WHITE.withOpacity(0.5)
                                              ),),
                                            SizedBox(width: 4,),
                                            Container(
                                              padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                                              decoration:  BoxDecoration(
                                                color: selectedIndex==0 ? ColorPath.ORANGE: Colors.purpleAccent.withOpacity(0.5),
                                                borderRadius: BorderRadius.all(Radius.circular(11)),
                                              ),
                                              child: Text("12",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: selectedIndex==0 ? ColorPath.WHITE: ColorPath.WHITE.withOpacity(0.5)
                                                ),),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        setState(() {
                                          selectedIndex = 0;
                                          _startAnim = true;
                                        });
                                      },
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Container(
                                        width: 110,
                                        margin: EdgeInsets.only(left: 8, right: 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children:  [
                                            Text("Completed",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedIndex==1 ? ColorPath.WHITE: ColorPath.WHITE.withOpacity(0.5)
                                              ),),
                                            SizedBox(width: 4,),
                                            Container(
                                                padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                                                decoration:  BoxDecoration(
                                                    color: selectedIndex==1 ? ColorPath.ORANGE: Colors.purpleAccent.withOpacity(0.5),
                                                borderRadius: BorderRadius.all(Radius.circular(11)),
                                              ),
                                              child: Text("5",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: selectedIndex==1 ? ColorPath.WHITE: ColorPath.WHITE.withOpacity(0.5)
                                                ),),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        setState(() {
                                          _startAnim = true;
                                          selectedIndex = 1;
                                        });
                                      },
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 8, right: 8),
                                        width: 115,
                                        child: Row(
                                          children:  [
                                            Text("In progress",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedIndex==2 ? ColorPath.WHITE: ColorPath.WHITE.withOpacity(0.5)
                                              ),),
                                            SizedBox(width: 4,),
                                            Container(
                                              padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                                              decoration:  BoxDecoration(
                                                color: selectedIndex==2 ? ColorPath.ORANGE: Colors.purpleAccent.withOpacity(0.5),
                                                borderRadius: BorderRadius.all(Radius.circular(11)),
                                              ),
                                              child: Text("3",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: selectedIndex==2? ColorPath.WHITE: ColorPath.WHITE.withOpacity(0.5)
                                                ),),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        setState(() {
                                          _startAnim = true;
                                          selectedIndex = 2;
                                        });
                                      },
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Container(
                                        width: 90,
                                        margin: EdgeInsets.only(left: 8, right: 8),
                                        child: Row(
                                          children:  [
                                            Text("Pending",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                color: selectedIndex==3? ColorPath.WHITE: ColorPath.WHITE.withOpacity(0.5),
                                              ),),
                                            SizedBox(width: 4,),
                                            Container(
                                              padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                                              decoration:  BoxDecoration(
                                                color: selectedIndex==3 ? ColorPath.ORANGE: Colors.purpleAccent.withOpacity(0.5),
                                                borderRadius: BorderRadius.all(Radius.circular(11)),
                                              ),
                                              child: Text("3",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                  color: selectedIndex==3? ColorPath.WHITE: ColorPath.WHITE.withOpacity(0.5),
                                                ),),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        setState(() {
                                          _startAnim = true;
                                          selectedIndex = 3;
                                        });
                                      },
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Container(
                                        width: 105,
                                        margin: EdgeInsets.only(left: 8, right: 8),
                                        child: Row(
                                          children:  [
                                            Text("Cancelled",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                color: selectedIndex==4? ColorPath.WHITE: ColorPath.WHITE.withOpacity(0.5),
                                              ),),
                                            SizedBox(width: 4,),
                                            Container(
                                              padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                                              decoration:  BoxDecoration(
                                                color: selectedIndex==4 ? ColorPath.ORANGE: Colors.purpleAccent.withOpacity(0.5),
                                                borderRadius: BorderRadius.all(Radius.circular(11)),
                                              ),
                                              child: Text("3",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                  color: selectedIndex==4? ColorPath.WHITE: ColorPath.WHITE.withOpacity(0.5),
                                                ),),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        setState(() {
                                          _startAnim = true;
                                          selectedIndex = 4;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12,),
                                Container(
                                  width: 570,
                                  child: AnimatedAlign(
                                    alignment:
                                    Alignment(_getIndicatorPosition(selectedIndex??0)??0.0, 0),
                                    curve: Curves.linear,
                                    duration: Duration(milliseconds: 270),
                                    child: Container(
                                      color:ColorPath.ORANGE,
                                      width: selectedIndex==0?86:selectedIndex==1?126:selectedIndex==2?131:selectedIndex==3?106:121,
                                      height: 4,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.transparent, Colors.white, Colors.white],
                  stops: [0.0, 0.1, 0.999, 1.0], // 10% purple, 80% transparent, 10% purple
                ).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16,),
                      Container(
                        child: const Text("Shipments",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),),
                      ),
                      Visibility(
                        visible: _startAnim==false,
                          child: AnimatedListItem(1,_startAnim, key: const ValueKey<int>(1))
                      ),
                      AnimatedListItem(2,_startAnim, key: const ValueKey<int>(2)),
                      AnimatedListItem(3,_startAnim, key: const ValueKey<int>(3)),
                      AnimatedListItem(4,_startAnim, key: const ValueKey<int>(4)),
                      AnimatedListItem(5,_startAnim, key: const ValueKey<int>(5)),
                      AnimatedListItem(6,_startAnim, key: const ValueKey<int>(6)),
                      AnimatedListItem(7,_startAnim, key: const ValueKey<int>(7)),
                    ],
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }

  double? _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    //width: selectedIndex==0?86:selectedIndex==1?126:selectedIndex==2?131:selectedIndex==3?106:121,
    if (isLtr) {
      if(index==0){
        return lerpDouble(-1.0, 1.0, 0);
      }
      if(index==1){
        return lerpDouble(-1.0, 1.0, 86/(570-126));
      }
      if(index==2){
        return lerpDouble(-1.0, 1.0, (86+126)/(570-131));
      }
      if(index==3){
        return lerpDouble(-1.0, 1.0, (86+126+131)/(570-106));
      }
      return lerpDouble(-1.0, 1.0, 1);
    } else {
      if(index==0){
        return lerpDouble(1.0, -1.0, index / (3.2 - 1));
      }
      if(index==1){
        return lerpDouble(1.0, -1.0, index / (4.3 - 1));
      }
      if(index==2){
        return lerpDouble(1.0, -1.0,  index / (3.7 - 1));
      }
      if(index==3){
        return lerpDouble(1.0, -1.0, index / (3.68 - 1));
      }
      return lerpDouble(1.0, -1.0, index / (3.5 - 1));
    }
  }
}

class AnimatedListItem extends StatefulWidget {
  final int index;
   final bool isStart;

  const AnimatedListItem(this.index,this.isStart, {Key? key}) : super(key: key);

  @override
  State<AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  bool _animate = false;
  late bool _isStart = false;



  @override
  void initState() {
    super.initState();

  }

  void loadAnim(){
    _isStart = widget.isStart;
    if (_isStart) {
      setState(() {
        _animate = false;
        _isStart = true;
      });
      Future.delayed(Duration(milliseconds: widget.index *50), () {
        setState(() {
          _animate = true;
          _isStart = false;
        });
      });
    } else {
      _animate = true;
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedListItem oldWidget) {
    loadAnim();
    super.didUpdateWidget(oldWidget);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8,bottom: 8),
      padding: EdgeInsets.all(12),
      decoration:  BoxDecoration(
        color: Colors.white, // border color
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 4.0,
          ),
        ],
      ),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: _animate ? 1 : 0,
        curve: Curves.easeInOutQuart,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          padding: _animate
              ? const EdgeInsets.all(0.0)
              : const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 8, right: 8,top: 5, bottom: 5),
                              decoration:  BoxDecoration(
                                color: Colors.grey.withOpacity(0.1), // border color
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(widget.index<3? Icons.sync:Icons.restore,size: 15,
                                color: widget.index<3 ? Colors.green:Colors.orange),
                                  Container(
                                    padding: const EdgeInsets.only(left: 4),
                                    child:  Text(widget.index<3 ?"in-progress": "pending",
                                      style: TextStyle(
                                          fontSize:  14,
                                          fontWeight: widget.index<3 ?FontWeight.normal:FontWeight.w600,
                                        color: widget.index<3 ? Colors.green:Colors.orange, // border color
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),
                        Container(
                          child: const Text("Arriving today!",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                            ),),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          child: const Text("Your delivery, #N373737373 from Atlanta is arriving today!",
                            style: TextStyle(
                                fontSize: 13,
                                color: ColorPath.GREY
                            ),),
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Container(
                              child: const Text("\$1400 USD",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: ColorPath.DARK_PURPLE
                                ),),
                            ),
                            SizedBox(width: 4,),
                            Icon(Icons.circle, size: 5,color: ColorPath.GREY.withOpacity(0.5),),
                            SizedBox(width: 4,),
                            Container(
                              child: const Text("Sept 20, 2023",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ColorPath.BLACK
                                ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 24,),
                  Container(
                      padding: const EdgeInsets.all(8),
                      child: const Image(image: AssetImage('lib/ui/assets/images/shipment_package.png'), height: 70,)
                  ),
                  SizedBox(width: 12,),

                ],
              ),
              const SizedBox(height: 4,),
            ],
          ),
        ),
      ),
    );
  }
}
