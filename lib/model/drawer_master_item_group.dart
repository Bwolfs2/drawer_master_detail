import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'drawer_master_item.dart';

class DrawerMasterItemGroup  extends DrawerMasterItemAbs {
  final Text title;
  final List<DrawerMasterItem> items;
  String id;

  DrawerMasterItemGroup({this.title, this.items}):super(null) {
    id = Uuid().v4();
  }
}
