import 'package:flutter/material.dart';
import 'drawer_bloc.dart';
import 'model/drawer_master_item.dart';

class DrawerMaster extends StatefulWidget {
  final UserAccountsDrawerHeader userAccountsDrawerHeader;
  final Widget header;
  final List<DrawerMasterItem> drawerMasterItems;
  final Color color;
  final Widget footer;
  final Color selectedBackGroundColor;
  final String selectedId;

  const DrawerMaster(
      {Key key,
      @required this.drawerMasterItems,
      @required this.userAccountsDrawerHeader,
      @required this.header,
      this.color,
      this.footer,
      this.selectedBackGroundColor,
      this.selectedId})
      : super(key: key);

  @override
  _DrawerMasterState createState() => _DrawerMasterState();
}

class _DrawerMasterState extends State<DrawerMaster> {
  var bloc = DrawerBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color ?? Colors.white,
      child: Column(
        children: <Widget>[
          widget.header ?? Container(),
          widget.userAccountsDrawerHeader ?? Container(),
          Expanded(
            child: ListView(
              children: widget.drawerMasterItems
                  .map(
                    (item) => item.isCustomItem()
                        ? item.customItem
                        : Container(
                            color: item.id == widget.selectedId
                                ? widget.selectedBackGroundColor
                                : Colors.transparent,
                            child: getList(
                                item,
                                (item.id == widget.selectedId &&
                                        item.selectedItem != null)
                                    ? item.selectedItem
                                    : item.item),
                          ),
                  )
                  .toList(),
            ),
          ),
          widget.footer ?? Container()
        ],
      ),
    );
  }

  getList(drawerItem, item) {
    return ListTile(
      contentPadding: item.contentPadding,
      dense: item.dense,
      enabled: item.enabled,
      isThreeLine: item.isThreeLine,
      key: item.key,
      leading: item.leading,
      subtitle: item.subtitle,
      title: item.title,
      trailing: item.trailing,
      onTap: () async {
        bloc.changeSelectedDrawerPage(drawerItem);
        // await Future.delayed(Duration(milliseconds: 200));
        Navigator.pop(context);
      },
    );
  }
}
