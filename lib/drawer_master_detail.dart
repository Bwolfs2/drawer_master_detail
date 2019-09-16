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
  final double kTabletBreakpoint;

  const DrawerMasterDetail(
      {Key key,
      this.userAccountsDrawerHeader,
      this.header,
      @required this.drawerMasterItems,
      @required this.initPage,
      this.footer,
      this.selectedColor,
      this.backgroundColor,
      this.selectedBackGroundColor,
      this.kTabletBreakpoint = 720.0})
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
        return LayoutBuilder(builder: (context, boxConstraints) {
          if (boxConstraints.maxWidth < widget.kTabletBreakpoint) {
            print(boxConstraints.maxWidth);
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
              body: asyncSnapshot.data.page,
            );
          }

          return Row(
            children: <Widget>[
              Container(
                width: 300,
                decoration: BoxDecoration(
                    border: Border(
                  right: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                )),
                child: Material(
                  elevation: 6,
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
              ),
              Expanded(
                child: Scaffold(
                  appBar: asyncSnapshot.data.appBar != null
                      ? asyncSnapshot.data.appBar
                      : AppBar(
                          title: asyncSnapshot.data.item.title,
                        ),
                  body: asyncSnapshot.data.page,
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
