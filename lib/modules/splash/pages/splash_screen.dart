import 'package:flutter/material.dart';
import 'package:project_k/global/widgets/appbar_widget.dart';

class SplashScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;
  SplashScreen({super.key, this.arguments});
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar.appBarWidgetV2(),
      drawer: Drawer(
       
      ),
      body: Container(color: Colors.red),
      floatingActionButton: FloatingActionButton(onPressed: null),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: "Customers",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee),
            label: "Transactions",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.green,
          ),
        ],
      ),
      persistentFooterButtons: [
        ElevatedButton(onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        }, child: Text("Button 1")),
        ElevatedButton(onPressed: () {}, child: Text("Button 2")),
      ],
    );
  }

  
}
