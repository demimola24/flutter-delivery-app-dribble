import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:tapt/ui/constants/color_const.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static final String routeName = SearchScreen().runtimeType.toString();

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>  with SingleTickerProviderStateMixin{
  bool _animate = false;
  static bool _isStart = true;
  static bool _startAnim = false;
  final _debouncer = Debouncer(milliseconds: 400);

  @override
  void initState() {
    super.initState();
    _isStart = true;
    _startAnim=false;
     loadAnim();
  }

  void loadAnim(){
    if (_isStart) {
      Future.delayed(Duration(milliseconds:300), () {
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12,top: 50,bottom: 20),
                color:  ColorPath.DARK_COLOR,
                child: Row(
                  children: [
                    AnimatedSlide(
                      offset: !_animate? Offset(-1, 0): Offset.zero,
                      duration: const Duration(milliseconds: 150),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.chevron_left_rounded, size: 32,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: Hero(
                        tag: "SearchBar",
                        child: Material(
                          color: Colors.transparent,
                          child: TextField(
                            autofocus: true,
                            onChanged: (value){
                              _debouncer.run(() async {
                                setState(() {
                                  _startAnim = true;
                                });
                              });

                            },
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
                              labelText: "Enter the receipt number",
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
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 24,),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _animate ? 1 : 0,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 200),
                  padding: _animate
                      ? const EdgeInsets.all(0.0)
                      : const EdgeInsets.only(top: 60),
                  child: Container(
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
                    margin: EdgeInsets.only(left: 12, right: 16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: _startAnim==false,
                              child: AnimatedListItem(1,_startAnim, key: ValueKey<int>(1))
                          ),
                          AnimatedListItem(2,_startAnim, key: ValueKey<int>(2)),
                          AnimatedListItem(3,_startAnim, key: ValueKey<int>(3)),
                          AnimatedListItem(4,_startAnim, key: ValueKey<int>(4)),
                          AnimatedListItem(5,_startAnim, key: ValueKey<int>(5)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
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
      Future.delayed(Duration(milliseconds: widget.index *80), () {
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
    return AnimatedOpacity(
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
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: ColorPath.DARK_COLOR, // border color
                      shape: BoxShape.circle,
                    ),
                    child: Image(image: AssetImage('lib/ui/assets/images/package.png'), height: 25,color: Colors.white,)
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: const Text("Mac book pro M2",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 16),
                          child: const Text("#NEhDHD66DGD",
                            style: TextStyle(
                                fontSize: 13,
                                color: ColorPath.GREY
                            ),),
                        ),
                        SizedBox(width: 4,),
                        Icon(Icons.circle, size: 5,color: ColorPath.GREY.withOpacity(0.5),),
                        SizedBox(width: 4,),
                        Container(
                          child: const Text("Barcelona",
                            style: TextStyle(
                                fontSize: 13,
                                color: ColorPath.GREY
                            ),),
                        ),
                        SizedBox(width: 4,),
                        Icon(Icons.arrow_forward_rounded, size: 12,color: ColorPath.GREY,),
                        SizedBox(width: 4,),
                        Container(
                          child: const Text("Paris",
                            style: TextStyle(
                                fontSize: 13,
                                color: ColorPath.GREY
                            ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 4,),
            Visibility(
              visible: widget.index<5,
              child: Divider(),
            ),
            SizedBox(height: 4,),
          ],
        ),
      ),
    );
  }
}

class Debouncer {
  late final int milliseconds;
  Timer? _timer;
  Debouncer({ required this.milliseconds });
  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
