import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:shop_app/screens/order_list_screen/order_screen.dart';

enum DrawerEvents { rec_fill,rec_emp,prev_emp,prev_fill}

abstract class DrawerStates {}

// Used for navigating between different blocs
//
//class OrderBloc extends Bloc<DrawerEvents, DrawerStates> {
//
//  @override
//  DrawerStates get initialState => order_screen();
//  @override
//  Stream<DrawerStates> mapEventToState(DrawerEvents event) async* {
//    switch (event) {
//      case DrawerEvents.rec_fill:
//        yield Main_menu();
//        break;
//      case DrawerEvents.rec_emp:
//        yield UserScreen();
//        break;
//      case DrawerEvents.prev_emp:
//        yield Maati_news();
//        break;
//      case DrawerEvents.prev_fill:
//        yield output(null);
//        break;
//    }
//  }
//}
