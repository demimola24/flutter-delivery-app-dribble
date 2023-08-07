import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'dart:math' as math;
import '../constants/color_const.dart';
import 'bloc/shared_bloc.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  static final String routeName = SuccessScreen().runtimeType.toString();

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
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
      Future.delayed(const Duration(milliseconds:400), () {
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
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _animate ? 1 : 0,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 320),
          padding: _animate
              ? const EdgeInsets.all(0.0)
              : const EdgeInsets.only(top: 200),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: _animate? Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: const Image(image: AssetImage('lib/ui/assets/images/shipment_package.png'), height: 200)
                  ): Container(
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: const Image(image: AssetImage('lib/ui/assets/images/shipment_package.png'), height: 50)
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: const Text("Total Estimated Amount",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    ),),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Countup(
                      begin: 0,
                      end: 1353,
                      prefix: "\$",
                      duration: Duration(seconds: 3),
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.orange),
                    ),
                    SizedBox(width: 4,),
                    Container(
                      margin: EdgeInsets.only(bottom: 2),
                      child: const Text("USD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.orange
                        ),),
                    ),
                  ],
                ),
                SizedBox(height: 16,),
                Container(
                  margin: EdgeInsets.only(left: 32, right: 32),
                  child: const Text("This amount is estimated and this might vary if you change your location or weight",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: ColorPath.GREY
                    ),),
                ),
                SizedBox(height: 32,),
                AnimatedPadding(
                  duration: const Duration(milliseconds: 200),
                  padding: _animate
                      ? const EdgeInsets.all(0.0)
                      : const EdgeInsets.only(top: 30),
                  child: ZoomTapAnimation(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          sharedBloc.changePage(0);

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
                          'Back to home',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
