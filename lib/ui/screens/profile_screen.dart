import 'package:flutter/material.dart';
import 'package:tapt/ui/screens/success_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'dart:math' as math;
import '../constants/color_const.dart';
import 'bloc/shared_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static final String routeName = ProfileScreen().runtimeType.toString();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      Future.delayed(const Duration(milliseconds:300), () {
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
            Container(
              padding: const EdgeInsets.only(left: 12, right: 12,top: 50,bottom: 0),
              color:  ColorPath.DARK_COLOR,
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
                          child: const Text("Profile",
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



          ],
        ),
      ),
    );
  }
}
