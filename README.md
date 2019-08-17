# drawer_master_detail

 A new Flutter package to build a Drawer like Master Detail Page of Xamarin and Android Native Drawer.

## Getting Started


## Usage Example

<img src="https://github.com/Bwolfs2/drawer_master_detail/raw/master/assets/sample_image.jpg" width="300">

import drawer_master_detail.dart

```dart
import 'package:drawer_master_detail/drawer_master_detail.dart';
```

## Samples

```dart
   class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DrawerMasterDetail(      
      selectedBackGroundColor: Colors.grey,
      drawerMasterItems: [
        DrawerMasterItem(page: Page01(),item:ListTile(title: Text("Page 01"),), selectedItem:ListTile(title: Text("Page 01" , style: TextStyle(color: Colors.white), ),) ),
        DrawerMasterItem(page: Page02(),item:ListTile(title: Text("Page 02"),)),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 03"),)),
        DrawerMasterItem.customItem(Divider(
          color: Colors.red,
        )),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 04"),) , appBar:AppBar(title: Text("Menu legal"),),),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 05"),)),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 06"),)),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 07"),)),        
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 08"),)),
        DrawerMasterItem.customItem(Container(         
          child: Column(            
            children: <Widget>[            
              Divider(),
              Text("Titulo Diferente", style: TextStyle(color: Colors.grey),),            
            ],
          ),
        )),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 09"),)),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 10"),)),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 11"),)),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 12"),)),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 13"),)),
        DrawerMasterItem(page: Page03(),item:ListTile(title: Text("Page 14"),)),
      ],
      footer: Container(
        height: 50,
        alignment: Alignment.center,
        width: double.infinity,
        color: Colors.red,
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
      
      initPage: DrawerMasterItem(page: Page01(),item:ListTile(title: Text("Home Page"),) ),
    );
  }
}

```