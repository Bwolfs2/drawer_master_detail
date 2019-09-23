import 'package:drawer_master_detail/model/drawer_master_item_group.dart';
import 'package:flutter/material.dart';
import 'drawer_bloc.dart';
import 'model/drawer_master_item.dart';

class DrawerMaster extends StatefulWidget {
  final UserAccountsDrawerHeader userAccountsDrawerHeader;
  final Widget header;
  final List<DrawerMasterItemAbs> drawerMasterItems;
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
                  .map<Widget>(
                    (item) => _menu(item),
                  )
                  .toList(),
            ),
          ),
          widget.footer ?? Container()
        ],
      ),
    );
  }

  _getList(drawerItem, item) {
    return ListTile(
      contentPadding: item?.contentPadding ?? null,
      dense: item?.dense ?? false,
      enabled: item?.enabled ?? true,
      isThreeLine: item?.isThreeLine ?? false,
      key: item?.key,
      leading: item?.leading,
      subtitle: item?.subtitle,
      title: item?.title,
      trailing: item?.trailing,
      onTap: () async {
        bloc.changeSelectedDrawerPage(drawerItem);
        // await Future.delayed(Duration(milliseconds: 200));
        Navigator.pop(context);
      },
    );
  }

  _menu(DrawerMasterItemAbs item) {
    if (item is DrawerMasterItem) {
      return item.isCustomItem()
          ? item.customItem
          : Container(
              color: item.id == widget.selectedId
                  ? widget.selectedBackGroundColor ?? Colors.grey
                  : Colors.transparent,
              child: _getList(
                item,
                (item.id == widget.selectedId && item.selectedItem != null)
                    ? item.selectedItem
                    : item.item,
              ),
            );
    }

    if (item is DrawerMasterItemGroup) {
      return ExpansionTile(
        title: item.title ?? Text("No Title Set"),
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(left: 20),
            shrinkWrap: true,
            children: item.items.map(
              (data) {
                print(data.id == widget.selectedId);
                return Container(
                  color: data.id == widget.selectedId
                      ? widget.selectedBackGroundColor ?? Colors.grey
                      : Colors.transparent,
                  child: _getList(
                    data,
                    (data.id == widget.selectedId && data.selectedItem != null)
                        ? data.selectedItem
                        : data.item,
                  ),
                );
              },
            ).toList(),
          ),
        ],
      );
    }
  }
}
