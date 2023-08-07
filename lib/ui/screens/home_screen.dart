import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:tapt/ui/constants/color_const.dart';
import 'package:tapt/ui/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _animate = false;
  static bool _isStart = true;

  @override
  void initState() {
    super.initState();
    _isStart = true;
    loadAnim();
  }

  void loadAnim(){
    if (_isStart) {
      Future.delayed(const Duration(milliseconds:130), () {
        setState(() {
          _animate = true;
          _isStart = false;
        });
      });
    } else {
      _animate = false;
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
          Stack(
            children: [
              Hero(
                tag: "AppBar",
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds:600),
                  opacity: _animate ? 1 : 0,
                  child: Container(
                    height: 190,
                    color:  ColorPath.DARK_COLOR,
                  ),
                ),
              ),
              AnimatedSlide(
                offset: !_animate? Offset(0, -1): Offset.zero,
                duration: const Duration(milliseconds: 150),
                child:  Container(
                  padding: const EdgeInsets.only(left: 12, right: 12,top: 50,bottom: 20),
                  color:  ColorPath.DARK_COLOR,
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 50,
                              width: 50,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage:AssetImage('lib/ui/assets/images/profile.png'),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 4),
                                          child: Transform.rotate(
                                              angle: 45 * math.pi / 180,
                                              child: const Icon(Icons.navigation_sharp,color: Colors.white70,size: 15,)
                                          ),
                                        ),
                                        const SizedBox(width: 3,),
                                        const Text("Your location",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Helvetica",
                                              color: Colors.white70
                                          ),),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        const Text("Wertheimer, Illinois",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Helvetica",
                                              color: Colors.white
                                          ),),
                                        const SizedBox(width: 4,),
                                        Transform.rotate(
                                            angle: 90 * math.pi / 180,
                                            child: const Icon(Icons.chevron_right_rounded,color: Colors.white)
                                        ),

                                      ],
                                    ),

                                  ],
                                )),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.white, // border color
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.notifications_none,color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Hero(
                        tag: "SearchBar",
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                labelStyle: const TextStyle(color: Colors.grey),
                                labelText: "Enter the receipt number ...",
                                prefixIcon: Icon(Icons.search, color: ColorPath.DARK_COLOR,),
                                suffixIcon: Container(
                                  height: 50,
                                  padding: const EdgeInsets.all(6),
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: const BoxDecoration(
                                    color:ColorPath.ORANGE, // border color
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 1.5,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(Icons.qr_code_scanner,color: Colors.white),
                                ),
                                fillColor: Colors.white,
                              ),
                            ),
                            onTap: (){
                              Navigator.pushNamed(context, SearchScreen.routeName);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24,),
          Expanded(
              child:  AnimatedPadding(
                duration: const Duration(milliseconds: 150),
                padding: _animate
                    ? const EdgeInsets.all(0.0)
                    : const EdgeInsets.only(top: 120),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: const Text("Tracking",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),),
                      ),
                      SizedBox(height: 24,),
                      Container(
                        decoration:  BoxDecoration(
                          color: Colors.white, // border color
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: const Text("Shipment Number",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: ColorPath.GREY
                                              ),),
                                          ),
                                          SizedBox(height: 8,),
                                          Container(
                                            child: const Text("NEJ2HDHDGDGDGDGD",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black
                                              ),),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Image(image: AssetImage('lib/ui/assets/images/lifter.png'), height: 50,)
                                  ],
                                ),
                              ),
                              Divider(),
                              Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(8),
                                        decoration:  BoxDecoration(
                                          color: Colors.orangeAccent.withOpacity(0.3), // border color
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image(image: AssetImage('lib/ui/assets/images/package_up.png'), height: 25,)
                                    ),
                                    SizedBox(width: 8,),
                                    Container(
                                      width: (width/2)-60,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: const Text("Sender",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: ColorPath.GREY
                                              ),),
                                          ),
                                          SizedBox(height: 4,),
                                          Container(
                                            child: const Text("Atlanta, 5243",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black
                                              ),),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Expanded(child: SizedBox(width: 50,)),
                                    Container(
                                      width: (width/2)-60,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: const Text("Time",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: ColorPath.GREY
                                              ),),
                                          ),
                                          SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              Icon(Icons.circle, color: Colors.green,size: 8,),
                                              SizedBox(width: 4,),
                                              Container(
                                                child: const Text("2 days - 3 days",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black
                                                  ),),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 24,),
                              Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(8),
                                        decoration:  BoxDecoration(
                                          color: Colors.greenAccent.withOpacity(0.5),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image(image: AssetImage('lib/ui/assets/images/package_up.png'), height: 25,)
                                    ),
                                    SizedBox(width: 8,),
                                    Container(
                                      width: (width/2)-60,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: const Text("Receiver",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: ColorPath.GREY
                                              ),),
                                          ),
                                          SizedBox(height: 4,),
                                          Container(
                                            child: const Text("Chicago, 6342",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black
                                              ),),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Expanded(child: SizedBox(width: 50,)),
                                    Container(
                                      width: (width/2)-60,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: const Text("Status",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: ColorPath.GREY
                                              ),),
                                          ),
                                          SizedBox(height: 4,),
                                          Container(
                                            child: const Text("Waiting to collect",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black
                                              ),),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 8,),
                              Divider(),
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.add, color:ColorPath.ORANGE,size: 20,),
                                  SizedBox(width: 4,),
                                  Container(
                                    child: const Text("Add Stop",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ColorPath.ORANGE
                                      ),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 32,),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: const Text("Available Vehicles",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),),
                      ),
                      SizedBox(height: 8,),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _animate ? 1 : 0,
                        child: AnimatedPadding(
                          duration: const Duration(milliseconds: 150),
                          padding: _animate
                              ? const EdgeInsets.all(0.0)
                              : const EdgeInsets.only(left: 120),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                AnimatedListItem("Ocean freight",1,_animate, key: ValueKey<int>(1)),
                                AnimatedListItem("Cargo freight",2,_animate, key: ValueKey<int>(2)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24,),
                    ],
                  ),
                ),
              )),


        ],
      ),
    );
  }
}


class AnimatedListItem extends StatefulWidget {
  final String text;
  final int index;
  final bool isStart;

  const AnimatedListItem(this.text,this.index,this.isStart, {Key? key}) : super(key: key);

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
          child: Container(
            width: 150,
            decoration:  BoxDecoration(
              color: Colors.white, // border color
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 4.0,
                ),
              ],
            ),
            margin: EdgeInsets.only(left: 16, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
            AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: _animate
                  ? const EdgeInsets.all(0.0)
                  : const EdgeInsets.only(left: 40),
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    child: const Text("Ocean freight",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),),
                  ),
                ),
                AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                  padding: _animate
                      ? const EdgeInsets.all(0.0)
                      : const EdgeInsets.only(left: 40),
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    child: const Text("International",
                      style: TextStyle(
                          fontSize: 13,
                          color: ColorPath.GREY
                      ),),
                  ),
                ),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 320),
                  padding: _animate
                      ? const EdgeInsets.all(0.0)
                      : const EdgeInsets.only(left: 300),
                  child: Container(
                      alignment: Alignment.bottomRight,
                      child: Image(image: AssetImage('lib/ui/assets/images/ship.png'), height: 140,width: 100,)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

