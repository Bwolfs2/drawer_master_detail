import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DrawerMasterItem {
  final Widget page;
  final ListTile item;
  final ListTile selectedItem;
  final Widget appBar;
  bool _isCustomItem = false;
  Widget customItem;
  String id;

  factory DrawerMasterItem.customItem(Widget customItem) =>
      DrawerMasterItem(customItem: customItem).._isCustomItem = true;

  DrawerMasterItem(
      {this.selectedItem, this.page, this.item, this.appBar, this.customItem}) {
    id = Uuid().v4();
  }

  isCustomItem() => _isCustomItem;
}
