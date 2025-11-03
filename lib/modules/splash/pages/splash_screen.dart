import 'package:flutter/material.dart';
import 'package:project_k/global/widgets/appbar_widget.dart';
import 'package:project_k/global/widgets/drawer_widget.dart';
import 'package:project_k/modules/auth/pages/login_screen.dart';

class SplashScreen extends StatelessWidget {
  Map<String, dynamic>? arguments;
  SplashScreen({super.key, this.arguments});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar.appBarWidgetV1(
        titleText: "Splash Screen",

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
        ],
      ),
     
      drawer: DrawerWidget.getDrawer(context),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(title: Text("Item $index"));
        },
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
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
        ElevatedButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Text("Button 1"),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Button 2")),
      ],
    );
  }
}
