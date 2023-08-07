import 'package:flutter/material.dart';
import 'package:tapt/ui/screens/success_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'dart:math' as math;
import '../constants/color_const.dart';
import 'bloc/shared_bloc.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  static final String routeName = CalculateScreen().runtimeType.toString();

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  bool _animate = false;
  static bool _isStart = true;
  int? selectedCategory;

  @override
  void initState() {
    super.initState();
    _isStart = true;
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
      body: Container(
        child: Column(
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
                              child: const Text("Calculate",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPath.WHITE
                                ),),
                            ),
                          ),
                          const SizedBox(width: 8,),
                        ],
                      ),
                      SizedBox(height: 16,),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _animate ? 1 : 0,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 200),
                  padding: _animate
                      ? const EdgeInsets.all(4.0)
                      : const EdgeInsets.only(top: 60),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8,),
                          Container(
                            child: const Text("Destination",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),),
                          ),
                          Container(
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
                            child: Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    labelText: " Sender Location",
                                    prefixIcon: Container(
                                      margin: EdgeInsets.only(top: 8,bottom: 8,right: 10,left: 0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.grey.withOpacity(0.5),
                                              width: 1.0,
                                            ),
                                          )
                                      ),
                                      child: Icon(Icons.upload_rounded, color: ColorPath.GREY,),
                                    ),
                                    fillColor: ColorPath.GREY.withOpacity(0.1),
                                  ),
                                ),
                                SizedBox(height: 12,),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    labelText: " Receiver Location",
                                    prefixIcon: Container(
                                      margin: EdgeInsets.only(top: 8,bottom: 8,right: 10,left: 0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.grey.withOpacity(0.5),
                                              width: 1.0,
                                            ),
                                          )
                                      ),
                                      child: Transform.rotate(
                                          angle: 180 * math.pi / 180,
                                          child: Icon(Icons.upload_rounded, color: ColorPath.GREY,)
                                      ),
                                    ),
                                    fillColor: ColorPath.GREY.withOpacity(0.1),
                                  ),
                                ),
                                SizedBox(height: 12,),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    filled: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    labelText: " Approx Weight",
                                    prefixIcon: Container(
                                      margin: EdgeInsets.only(top: 8,bottom: 8,right: 10,left: 0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.grey.withOpacity(0.5),
                                              width: 1.0,
                                            ),
                                          )
                                      ),
                                      child: Icon(Icons.hourglass_bottom_outlined, color: ColorPath.GREY,),
                                    ),
                                    fillColor: ColorPath.GREY.withOpacity(0.1),
                                  ),
                                ),
                                SizedBox(height: 12,),
                              ],
                            ),
                          ),
                          SizedBox(height: 24,),
                          Container(
                            child: const Text("Packaging",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),),
                          ),
                          SizedBox(height: 8,),
                          Container(
                            child: const Text("What are you sending?",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: ColorPath.GREY
                              ),),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.only(top: 4,bottom: 4),
                            padding: EdgeInsets.all(8),
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
                            child: Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(left: 8, right: 12, bottom: 8,top: 8),
                                    decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: Colors.grey.withOpacity(0.5),
                                            width: 1.0,
                                          ),
                                        )
                                    ),
                                    child: const Image(image: AssetImage('lib/ui/assets/images/package.png'), height: 24,color: ColorPath.GREY,)
                                ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child: const Text("Box",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                    ),),
                                ),
                                Transform.rotate(
                                    angle: 270 * math.pi / 180,
                                    child: Icon(Icons.chevron_left_rounded, color: ColorPath.GREY,)
                                ),
                                SizedBox(width: 8,),
                              ],
                            ),
                          ),
                          SizedBox(height: 24,),
                          Container(
                            child: const Text("Categories",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black
                              ),),
                          ),
                          SizedBox(height: 8,),
                          Container(
                            child: const Text("What are you sending?",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: ColorPath.GREY
                              ),),
                          ),
                          SizedBox(height: 12,),

                          AnimatedPadding(
                            duration: const Duration(milliseconds: 400),
                            padding: _animate
                                ? const EdgeInsets.all(0.0)
                                : const EdgeInsets.only(left: 60),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: ZoomTapAnimation(
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                shape: BoxShape.rectangle,
                                                color:  selectedCategory==0?Colors.black: Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                )),
                                            child:  Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Visibility(
                                                    visible: selectedCategory==0,
                                                    child: Icon(Icons.done,size: 16,color: Colors.white,)
                                                ),
                                                SizedBox(width: 4,),
                                                Text("Documents",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: selectedCategory==0?Colors.white: Colors.black,
                                                  ),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          setState(() {
                                            selectedCategory = 0;
                                          });
                                        },
                                      ),
                                      SizedBox(width: 8,),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: ZoomTapAnimation(
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                shape: BoxShape.rectangle,
                                                color:  selectedCategory==1?Colors.black: Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                )),
                                            child:  Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Visibility(
                                                    visible: selectedCategory==1,
                                                    child: Icon(Icons.done,size: 16,color: Colors.white,)
                                                ),
                                                SizedBox(width: 4,),
                                                Text("Glass",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: selectedCategory==1?Colors.white: Colors.black,
                                                  ),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          setState(() {
                                            selectedCategory = 1;
                                          });
                                        },
                                      ),
                                      SizedBox(width: 8,),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: ZoomTapAnimation(
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                shape: BoxShape.rectangle,
                                                color:  selectedCategory==2?Colors.black: Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                )),
                                            child:  Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Visibility(
                                                    visible: selectedCategory==2,
                                                    child: Icon(Icons.done,size: 16,color: Colors.white,)
                                                ),
                                                SizedBox(width: 4,),
                                                Text("Liquid",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: selectedCategory==2?Colors.white: Colors.black,
                                                  ),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          setState(() {
                                            selectedCategory = 2;
                                          });
                                        },
                                      ),
                                      SizedBox(width: 8,),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: ZoomTapAnimation(
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                shape: BoxShape.rectangle,
                                                color:  selectedCategory==3?Colors.black: Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                )),
                                            child:  Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Visibility(
                                                    visible: selectedCategory==3,
                                                    child: Icon(Icons.done,size: 16,color: Colors.white,)
                                                ),
                                                SizedBox(width: 4,),
                                                Text("Food",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: selectedCategory==3?Colors.white: Colors.black,
                                                  ),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          setState(() {
                                            selectedCategory = 3;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12,),
                                  Row(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: ZoomTapAnimation(
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                shape: BoxShape.rectangle,
                                                color:  selectedCategory==4?Colors.black: Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                )),
                                            child:  Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Visibility(
                                                    visible: selectedCategory==4,
                                                    child: Icon(Icons.done,size: 16,color: Colors.white,)
                                                ),
                                                SizedBox(width: 4,),
                                                Text("Electronics",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: selectedCategory==4?Colors.white: Colors.black,
                                                  ),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          setState(() {
                                            selectedCategory = 4;
                                          });
                                        },
                                      ),
                                      SizedBox(width: 8,),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: ZoomTapAnimation(
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                shape: BoxShape.rectangle,
                                                color:  selectedCategory==5?Colors.black: Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                )),
                                            child:  Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Visibility(
                                                    visible: selectedCategory==5,
                                                    child: Icon(Icons.done,size: 16,color: Colors.white,)
                                                ),
                                                SizedBox(width: 4,),
                                                Text("Product",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: selectedCategory==5?Colors.white: Colors.black,
                                                  ),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          setState(() {
                                            selectedCategory = 5;
                                          });
                                        },
                                      ),
                                      SizedBox(width: 8,),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: ZoomTapAnimation(
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                shape: BoxShape.rectangle,
                                                color:  selectedCategory==6?Colors.black: Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                )),
                                            child:  Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Visibility(
                                                    visible: selectedCategory==6,
                                                    child: Icon(Icons.done,size: 16,color: Colors.white,)
                                                ),
                                                SizedBox(width: 4,),
                                                Text("Others",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: selectedCategory==6?Colors.white: Colors.black,
                                                  ),),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: (){
                                          setState(() {
                                            selectedCategory = 6;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 45,),
                          ZoomTapAnimation(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, SuccessScreen.routeName);
                                },
                                style: ButtonStyle(
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    minimumSize:
                                    MaterialStateProperty.all(Size(double.infinity, 50)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0)),
                                    ),
                                    backgroundColor:
                                    MaterialStateProperty.all(ColorPath.ORANGE)),
                                  child: Text(
                                  'Calculate',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                          SizedBox(height: 24,),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
