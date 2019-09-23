import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DrawerMasterItem extends DrawerMasterItemAbs {
  final Widget page;
  final ListTile item;
  final Widget appBar;
  bool _isCustomItem = false;
  Widget customItem;
  String id;

  factory DrawerMasterItem.customItem(Widget customItem) =>
      DrawerMasterItem(customItem: customItem).._isCustomItem = true;

  DrawerMasterItem(
      {selectedItem, this.page, this.item, this.appBar, this.customItem})
      : super(selectedItem) {
    id = Uuid().v4();
  }

  isCustomItem() => _isCustomItem;
}

abstract class DrawerMasterItemAbs {
  final ListTile selectedItem;

  DrawerMasterItemAbs(this.selectedItem);
}
