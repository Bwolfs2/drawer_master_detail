import 'package:flutter/material.dart';
import 'drawer_bloc.dart';
import 'drawer_master.dart';
import 'model/drawer_master_item.dart';

class DrawerMasterDetail extends StatefulWidget {
  final UserAccountsDrawerHeader userAccountsDrawerHeader;
  final Widget header;
  final List<DrawerMasterItem> drawerMasterItems;
  final DrawerMasterItem initPage;
  final Widget footer;
  final Color selectedColor;
  final Color selectedBackGroundColor;
  final Color backgroundColor;

  const DrawerMasterDetail(
      {Key key,
      this.userAccountsDrawerHeader,
      this.header,
      @required this.drawerMasterItems,
      @required this.initPage,
      this.footer,
      this.selectedColor,
      this.backgroundColor,
      this.selectedBackGroundColor})
      : super(key: key);

  @override
  _DrawerMasterDetailState createState() =>
      _DrawerMasterDetailState(DrawerBloc(initPage: initPage));
}

class _DrawerMasterDetailState extends State<DrawerMasterDetail> {
  DrawerBloc bloc;

  _DrawerMasterDetailState(this.bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DrawerMasterItem>(
      stream: bloc.selectedDrawerPage,
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData || asyncSnapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
            drawer: Drawer(
              child: DrawerMaster(
                drawerMasterItems: widget.drawerMasterItems,
                header: widget.header,
                userAccountsDrawerHeader: widget.userAccountsDrawerHeader,
                footer: widget.footer,
                selectedBackGroundColor: widget.selectedBackGroundColor,
                selectedId: asyncSnapshot.data.id,
                color: widget.backgroundColor,
              ),
            ),
            appBar: asyncSnapshot.data.appBar != null
                ? asyncSnapshot.data.appBar
                : AppBar(
                    title: asyncSnapshot.data.item.title,
                  ),
            body: asyncSnapshot.data.page);
      },
    );
  }
}
