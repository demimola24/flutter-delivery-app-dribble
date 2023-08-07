import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapt/ui/app_home.dart';
import 'package:tapt/ui/constants/color_const.dart';
import 'package:tapt/ui/screens/calculate_screen.dart';
import 'package:tapt/ui/screens/search_screen.dart';
import 'package:tapt/ui/screens/shipment_screen.dart';
import 'package:tapt/ui/screens/success_screen.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorPath.DARK_COLOR,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Tapt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Helvetica'),
      color: Colors.white,
      home: AppState(),
    );
  }
}

class AppState extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const AppState({super.key});

  @override
  _AppStateState createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tapt',
      navigatorKey: AppState.navigatorKey,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Montserrat',
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder()
            }
        ),
        highlightColor: Colors.deepPurple,
      ),
      routes: _routes,
      initialRoute: AppHome.routeName,
      // onUnknownRoute: (RouteSettings settings) {
      //   return MaterialPageRoute<void>(
      //     settings: settings,
      //     builder: (BuildContext context) => LoginScreen(),
      //   );
      // },
    );
  }

  final Map<String, Widget Function(BuildContext)> _routes = {
    AppHome.routeName: (context) => AppHome(),
    SearchScreen.routeName: (context) => const SearchScreen(),
    ShipmentScreen.routeName: (context) => const ShipmentScreen(),
    CalculateScreen.routeName: (context) => const CalculateScreen(),
    SuccessScreen.routeName: (context) => const SuccessScreen()

  };


  void showSuccessDialog(title,message){

  }

}
