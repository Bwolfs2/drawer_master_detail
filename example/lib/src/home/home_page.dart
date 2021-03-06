import 'package:drawer_master_detail/drawer_master_detail.dart';
import 'package:drawer_master_detail/model/drawer_master_item.dart';
import 'package:drawer_master_detail/model/drawer_master_item_group.dart';
import 'package:flutter/material.dart';

import '../pages/page_01.dart';
import '../pages/page_02.dart';
import '../pages/page_03.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DrawerMasterDetail(
      selectedBackGroundColor: Colors.grey.withOpacity(.5),
      drawerMasterItems: [
        DrawerMasterItemGroup(title: Text("Top top top"), items: [
          DrawerMasterItem(
            page: () => Page01(),
            item: ListTile(
              title: Text("Page 01"),
            ),
            selectedItem: ListTile(
              title: Text(
                "Page 01",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          DrawerMasterItem(
            page: () => Page02(),
            item: ListTile(
              title: Text("Page 02"),
            ),
            selectedItem: ListTile(
              title: Text(
                "Page 02",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ]),
        DrawerMasterItem(
            page: () => Page01(),
            item: ListTile(
              title: Text("Page 01"),
            ),
            selectedItem: ListTile(
              title: Text(
                "Page 01",
                style: TextStyle(color: Colors.green),
              ),
            )),
        DrawerMasterItem(
            page: () => Page02(),
            item: ListTile(
              title: Text("Page 02"),
            )),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 03"),
            )),
        DrawerMasterItem.customItem(Container(
          height: 10,
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  height: 5,
                ),
              ),
            ],
          ),
        )),
        DrawerMasterItem(
          page: () => Page03(),
          item: ListTile(
            title: Text("Page 04"),
          ),
          appBar: AppBar(
            title: Text("Menu legal"),
          ),
        ),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 05"),
            )),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 06"),
            )),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 07"),
            )),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 08"),
            )),
        DrawerMasterItem.customItem(Container(
          child: Column(
            children: <Widget>[
              Divider(),
              Text(
                "Titulo Diferente",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        )),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 09"),
            )),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 10"),
            )),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 11"),
            )),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 12"),
            )),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 13"),
            )),
        DrawerMasterItem(
            page: () => Page03(),
            item: ListTile(
              title: Text("Page 14"),
            )),
      ],
      footer: Container(
          height: 50,
          alignment: Alignment.center,
          width: double.infinity,
          color: Colors.green,
          child: Text("Footer")),
      //   header: Text("Casa"),
      userAccountsDrawerHeader: UserAccountsDrawerHeader(
        accountEmail: Text("bwolfnoob@gmail.com"),
        accountName: Text("bwolf"),
        currentAccountPicture: CircleAvatar(
          child: Text("BW"),
          backgroundColor: Colors.yellowAccent,
        ),
      ),

      initPage: DrawerMasterItem(
          page: () => Page01(),
          item: ListTile(
            title: Text("Home Page"),
          )),
    );
  }
}
