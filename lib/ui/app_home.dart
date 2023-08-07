import 'package:flutter/material.dart';
import 'package:tapt/ui/screens/bloc/shared_bloc.dart';
import 'package:tapt/ui/screens/calculate_screen.dart';
import 'package:tapt/ui/screens/home_screen.dart';
import 'package:tapt/ui/screens/profile_screen.dart';
import 'package:tapt/ui/screens/shipment_screen.dart';
import 'package:tapt/ui/widgets/floating_nav_bar.dart';

import 'constants/color_const.dart';


class AppHome extends StatefulWidget {
  static final String routeName = AppHome().runtimeType.toString();

  @override
  AppHomeState createState() => AppHomeState();
}

class AppHomeState extends State<AppHome>  {
  static int _selectedIndex = 0;
  bool changeOffset = false;
  bool hide = false;

  @override
  void initState() {
    super.initState();
    sharedBloc.pageStream.listen((index) {
      setState(() {
        _selectedIndex = index;
        checkMenuBar();
      });
    }, onError: (error) {

    });
  }

  final List<Widget> _pageOptions = <Widget>[
    HomeScreen(),
    CalculateScreen(),
    ShipmentScreen(),
    ProfileScreen(),
  ];

  checkMenuBar(){
    if(_selectedIndex>0){
      Future.delayed(const Duration(milliseconds:300), () {
        setState(() {
          changeOffset = true;
        });
      });
      Future.delayed(const Duration(milliseconds:450), () {
        setState(() {
          hide = true;
        });
      });
    }else{
      setState(() {
        changeOffset = false;
        hide = false;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    print("App home build");

    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPath.OFF_WHITE,
      body: Column(
        children: [
          Expanded(
              child: Container(
                  child: _pageOptions.elementAt(_selectedIndex)
              )
          ),
          AnimatedSlide(
            offset: changeOffset? Offset(0, 3): Offset.zero,
            duration: Duration(milliseconds: changeOffset ? 1000: 300),
            child: Visibility(
              visible: !hide,
              child: Container(
                margin: EdgeInsets.only(bottom: 12),
                child: TitledBottomNavigationBar(
                    currentIndex: _selectedIndex, // Use this to update the Bar giving a position
                    activeColor: ColorPath.DARK_PURPLE,
                    indicatorColor: ColorPath.DARK_PURPLE,
                    onTap: (index){
                      setState((){
                        _selectedIndex = index;
                          checkMenuBar();
                      });
                    },
                    items: [
                      TitledNavigationBarItem(title: 'Home', icon: Icons.home_outlined),
                      TitledNavigationBarItem(title: 'Calculate', icon: Icons.calculate_outlined),
                      TitledNavigationBarItem(title: 'Shipment', icon: Icons.refresh_outlined),
                      TitledNavigationBarItem(title: 'Profile', icon: Icons.person_outline_sharp),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }

}

