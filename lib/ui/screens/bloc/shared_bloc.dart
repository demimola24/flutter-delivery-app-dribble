import 'dart:async';
import 'package:rxdart/rxdart.dart';


class SharedBloc {

   final _pageSubject = BehaviorSubject<int>();

  Stream<int> get pageStream => _pageSubject.stream;
  Function(int) get changePage => _pageSubject.sink.add;






  dispose() async {
    _pageSubject.drain();
    await _pageSubject.close();
  }

}

final sharedBloc = SharedBloc();
