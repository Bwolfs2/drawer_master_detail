import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'model/drawer_master_item.dart';

class DrawerBloc {
  static DrawerBloc _instance;

  factory DrawerBloc({DrawerMasterItem initPage}) {
    _instance ??= DrawerBloc._internalConstructor(initPage);
    return _instance;
  }

  DrawerBloc._internalConstructor(DrawerMasterItem initPage) {
    _selectedDrawerController.add(initPage);
  }

  var _selectedDrawerController = BehaviorSubject<DrawerMasterItem>();
  Stream<DrawerMasterItem> get selectedDrawerPage =>
      _selectedDrawerController.stream;
  Function(DrawerMasterItem) get changeSelectedDrawerPage =>
      _selectedDrawerController.add;

  void dispose() {
    _selectedDrawerController.close();
  }
}
